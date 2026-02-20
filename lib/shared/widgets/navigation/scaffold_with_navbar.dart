import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/utils/responsive.dart';
import '../buttons/theme_toggle.dart';
import '../buttons/language_toggle.dart';

class ScaffoldWithNavbar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavbar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final responsive = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WMA',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          // Desktop Navigation
          if (responsive.isDesktop) ...[
            TextButton(
              onPressed: () {
                context.go('/');
                Navigator.of(context).pop(); // Close drawer if open
              },
              child: Text(loc.translate('nav_home')),
            ),
            TextButton(
              onPressed: () {
                context.go('/projects');
                Navigator.of(context).pop();
              },
              child: Text(loc.translate('nav_projects')),
            ),
            TextButton(
              onPressed: () {
                context.go('/about');
                Navigator.of(context).pop();
              },
              child: Text(loc.translate('nav_about')),
            ),
            TextButton(
              onPressed: () {
                context.go('/experience');
                Navigator.of(context).pop();
              },
              child: Text(loc.translate('nav_experience')),
            ),
            TextButton(
              onPressed: () {
                context.go('/contact');
                Navigator.of(context).pop();
              },
              child: Text(loc.translate('nav_contact')),
            ),
            const SizedBox(width: 16),
          ],
          // Show theme and language toggles on all screen sizes
          const ThemeToggle(),
          SizedBox(width: responsive.isMobile ? 8 : 16),
          const LanguageToggle(),
          SizedBox(width: responsive.isMobile ? 8 : 16),
        ],
      ),
      drawer: responsive.isMobile || responsive.isTablet
          ? Drawer(
              child: SafeArea(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'WMA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Portfolio',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: Text(loc.translate('nav_home')),
                      onTap: () {
                        context.go('/');
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.work),
                      title: Text(loc.translate('nav_projects')),
                      onTap: () {
                        context.go('/projects');
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(loc.translate('nav_about')),
                      onTap: () {
                        context.go('/about');
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.timeline),
                      title: Text(loc.translate('nav_experience')),
                      onTap: () {
                        context.go('/experience');
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.contact_mail),
                      title: Text(loc.translate('nav_contact')),
                      onTap: () {
                        context.go('/contact');
                        Navigator.of(context).pop();
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.brightness_6),
                      title: const Text('Theme'),
                      trailing: const ThemeToggle(),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: const Text('Language'),
                      trailing: const LanguageToggle(),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: child,
    );
  }
}
