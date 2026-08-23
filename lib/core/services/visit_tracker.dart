import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// Service to track portfolio visitors using CountAPI (free, no auth required).
/// CountAPI endpoint: https://api.countapi.xyz/hit/:namespace/:key
///
/// - Increments a global counter on every NEW session (once per 24h per device).
/// - Falls back to local session count if API is unavailable.
class VisitTrackerService {
  static const String _namespace = 'waleedabozeid-portfolio';
  static const String _key = 'page-visits';
  static const String _lastVisitKey = 'last_visit_timestamp';
  static const String _cachedCountKey = 'cached_visitor_count';

  static const String _countApiUrl =
      'https://api.countapi.xyz/hit/$_namespace/$_key';
  static const String _countApiGet =
      'https://api.countapi.xyz/get/$_namespace/$_key';

  /// Returns the current global visitor count and increments it if
  /// this is a new session (>24h since last visit on this device).
  static Future<int> trackAndGetCount() async {
    final prefs = await SharedPreferences.getInstance();

    final lastVisit = prefs.getInt(_lastVisitKey) ?? 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    final hoursSinceLast = (now - lastVisit) / (1000 * 60 * 60);

    // Only hit (increment) if more than 24 hours since last visit
    final shouldIncrement = hoursSinceLast > 24;
    final endpoint = shouldIncrement ? _countApiUrl : _countApiGet;

    try {
      final response = await http
          .get(Uri.parse(endpoint))
          .timeout(const Duration(seconds: 8));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final count = (data['value'] as num?)?.toInt() ?? 0;

        // Update local cache
        await prefs.setInt(_cachedCountKey, count);
        if (shouldIncrement) {
          await prefs.setInt(_lastVisitKey, now);
        }
        return count;
      }
    } catch (_) {
      // Network error — fall back to cached value
    }

    // Return cached count if API fails
    return prefs.getInt(_cachedCountKey) ?? 0;
  }
}
