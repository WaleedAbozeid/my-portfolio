import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/l10n/locale_provider.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        final isArabic = localeProvider.locale.languageCode == 'ar';
        return IconButton(
          icon: const Icon(Icons.language),
          onPressed: () {
            final newLocale = isArabic
                ? const Locale('en')
                : const Locale('ar');
            localeProvider.setLocale(newLocale);
          },
          tooltip: isArabic ? 'Switch to English' : 'التبديل إلى العربية',
        );
      },
    );
  }
}
