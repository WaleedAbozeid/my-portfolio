import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/constants/colors.dart';
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

class ScaffoldWithNavbar extends StatefulWidget {
  final Widget child;

  const ScaffoldWithNavbar({super.key, required this.child});

  @override
  State<ScaffoldWithNavbar> createState() => _ScaffoldWithNavbarState();
}

class _ScaffoldWithNavbarState extends State<ScaffoldWithNavbar> {
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTop = false;

  static const List<_NavItem> _navItems = [
    _NavItem(titleKey: 'nav_home', path: '/', icon: Icons.home),
    _NavItem(titleKey: 'nav_projects', path: '/projects', icon: Icons.work),
    _NavItem(titleKey: 'nav_about', path: '/about', icon: Icons.person),
    _NavItem(titleKey: 'nav_experience', path: '/experience', icon: Icons.timeline),
    _NavItem(titleKey: 'nav_contact', path: '/contact', icon: Icons.contact_mail),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final show = _scrollController.offset > 300;
      if (show != _showBackToTop) {
        setState(() {
          _showBackToTop = show;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final responsive = Responsive(context);

    return PrimaryScrollController(
      controller: _scrollController,
      child: Scaffold(
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
              const SizedBox(width: 8),
              PopupMenuButton<String>(
                onSelected: _launchUrl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        loc.translate('nav_freelance'),
                        style: TextStyle(
                          color: Theme.of(context).textTheme.labelLarge?.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down, size: 20),
                    ],
                  ),
                ),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'https://mostaql.com/u/Waleed_Mohamed99',
                    child: Text('مستقل | Mostaql'),
                  ),
                  const PopupMenuItem(
                    value: 'https://nafedhly.com',
                    child: Text('نفذلي | Nafedhly'),
                  ),
                  const PopupMenuItem(
                    value: 'https://kafeel.co',
                    child: Text('كفيل | Kfeel'),
                  ),
                  const PopupMenuItem(
                    value: 'https://khamsat.com',
                    child: Text('خمسات | Khamsat'),
                  ),
                  const PopupMenuItem(
                    value: 'https://upwork.com',
                    child: Text('Upwork'),
                  ),
                  const PopupMenuItem(
                    value: 'https://freelanceyard.com',
                    child: Text('فيلانس يارد | FreelanceYard'),
                  ),
                ],
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
                      ExpansionTile(
                        leading: const Icon(Icons.work_outline),
                        title: Text(loc.translate('nav_freelance')),
                        children: [
                          ListTile(
                            title: const Text('مستقل | Mostaql'),
                            onTap: () {
                              _launchUrl('https://mostaql.com/u/Waleed_Mohamed99');
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: const Text('نفذلي | Nafedhly'),
                            onTap: () {
                              _launchUrl('https://nafedhly.com');
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: const Text('كفيل | Kfeel'),
                            onTap: () {
                              _launchUrl('https://kafeel.co');
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: const Text('خمسات | Khamsat'),
                            onTap: () {
                              _launchUrl('https://khamsat.com');
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: const Text('Upwork'),
                            onTap: () {
                              _launchUrl('https://upwork.com');
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: const Text('فيلانس يارد | FreelanceYard'),
                            onTap: () {
                              _launchUrl('https://freelanceyard.com');
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
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
        body: widget.child,
        floatingActionButton: _showBackToTop
            ? FloatingActionButton(
                onPressed: _scrollToTop,
                backgroundColor: AppColors.primary,
                mini: responsive.isMobile,
                child: const Icon(Icons.arrow_upward, color: Colors.white),
              )
            : null,
      ),
    );
  }
}
