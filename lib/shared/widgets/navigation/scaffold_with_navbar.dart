import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../buttons/theme_toggle.dart';
import '../buttons/language_toggle.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavbar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WMA',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          // Desktop Navigation
          if (MediaQuery.of(context).size.width > 768) ...[
            TextButton(
              onPressed: () => context.go('/'),
              child: Text(loc.translate('nav_home')),
            ),
            TextButton(
              onPressed: () => context.go('/projects'),
              child: Text(loc.translate('nav_projects')),
            ),
            TextButton(
              onPressed: () => context.go('/about'),
              child: Text(loc.translate('nav_about')),
            ),
            TextButton(
              onPressed: () => context.go('/experience'),
              child: Text(loc.translate('nav_experience')),
            ),
            TextButton(
              onPressed: () => context.go('/contact'),
              child: Text(loc.translate('nav_contact')),
            ),
            const SizedBox(width: 16),
          ],
          const ThemeToggle(),
          const LanguageToggle(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text(loc.translate('nav_home')),
              onTap: () => context.go('/'),
            ),
            ListTile(
              title: Text(loc.translate('nav_projects')),
              onTap: () => context.go('/projects'),
            ),
            ListTile(
              title: Text(loc.translate('nav_about')),
              onTap: () => context.go('/about'),
            ),
            ListTile(
              title: Text(loc.translate('nav_experience')),
              onTap: () => context.go('/experience'),
            ),
            ListTile(
              title: Text(loc.translate('nav_contact')),
              onTap: () => context.go('/contact'),
            ),
            // Add other links...
          ],
        ),
      ),
      body: child,
    );
  }
}
