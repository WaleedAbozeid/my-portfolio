import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/l10n/app_localizations.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '404',
                style: TextStyle(
                  fontSize: 96,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primary,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                loc.locale.languageCode == 'ar'
                    ? 'عذراً! الصفحة التي تبحث عنها غير موجودة'
                    : 'Oops! The page you are looking for does not exist.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                loc.locale.languageCode == 'ar'
                    ? 'ربما تم نقل الصفحة أو أن الرابط غير صحيح.'
                    : 'It might have been moved or the URL is incorrect.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDark ? Colors.white60 : Colors.black54,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () => context.go('/'),
                icon: const Icon(Icons.home, size: 20),
                label: Text(
                  loc.locale.languageCode == 'ar'
                      ? 'العودة للرئيسية'
                      : 'Back to Home',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
