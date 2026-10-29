import 'dart:convert';
import 'package:http/http.dart' as http;

/// Service for handling portfolio contact form submissions.
/// Supports Web3Forms API with automatic fallback to mailto.
class ContactService {
  /// Web3Forms Access Key:
  /// To get a free key in 5 seconds (no account needed):
  /// 1. Go to https://web3forms.com
  /// 2. Enter your email (waleedabozeid995@gmail.com)
  /// 3. Paste the received access key here.
  static const String web3FormsAccessKey = '';

  static const String receiverEmail = 'waleedabozeid995@gmail.com';

  /// Sends contact message via Web3Forms API.
  /// Returns `true` if delivered successfully, `false` otherwise.
  static Future<bool> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
    String? botcheck,
  }) async {
    // Honeypot anti-spam verification: if bot filled this hidden field, ignore
    if (botcheck != null && botcheck.trim().isNotEmpty) {
      return false;
    }

    if (web3FormsAccessKey.isEmpty || web3FormsAccessKey == 'YOUR_ACCESS_KEY') {
      return false;
    }

    try {
      final response = await http.post(
        Uri.parse('https://api.web3forms.com/submit'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'access_key': web3FormsAccessKey,
          'name': name,
          'email': email,
          'subject': subject,
          'message': message,
          'from_name': 'Portfolio Contact Form',
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is Map && data['success'] == true) {
          return true;
        }
      }
    } catch (_) {
      // Network error or timeout, will fallback to mailto
    }

    return false;
  }
}
