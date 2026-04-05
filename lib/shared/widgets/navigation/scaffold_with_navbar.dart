import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/utils/responsive.dart';
import '../buttons/theme_toggle.dart';
import '../buttons/language_toggle.dart';

class _NavItem {
  final String titleKey;
  final String path;
  final IconData icon;

  const _NavItem({
    required this.titleKey,
    required this.path,
    required this.icon,
  });
}

class ScaffoldWithNavbar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavbar({super.key, required this.child});

  static const List<_NavItem> _navItems = [
    _NavItem(titleKey: 'nav_home', path: '/', icon: Icons.home),
    _NavItem(titleKey: 'nav_projects', path: '/projects', icon: Icons.work),
    _NavItem(titleKey: 'nav_about', path: '/about', icon: Icons.person),
    _NavItem(titleKey: 'nav_experience', path: '/experience', icon: Icons.timeline),
    _NavItem(titleKey: 'nav_contact', path: '/contact', icon: Icons.contact_mail),
  ];

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
            ..._navItems.map((item) => TextButton(
                  onPressed: () {
                    context.go(item.path);
                  },
                  child: Text(loc.translate(item.titleKey)),
                )),
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
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'WMA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
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
                    ..._navItems.map((item) => ListTile(
                          leading: Icon(item.icon),
                          title: Text(loc.translate(item.titleKey)),
                          onTap: () {
                            context.go(item.path);
                            Navigator.of(context).pop();
                          },
                        )),
                    const Divider(),
                    const ListTile(
                      leading: Icon(Icons.brightness_6),
                      title: Text('Theme'),
                      trailing: ThemeToggle(),
                    ),
                    const ListTile(
                      leading: Icon(Icons.language),
                      title: Text('Language'),
                      trailing: LanguageToggle(),
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
