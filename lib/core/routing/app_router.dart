import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/projects/presentation/pages/projects_page.dart';
import '../../features/contact/presentation/pages/contact_page.dart';
import '../../features/about/presentation/pages/about_page_new.dart';
import '../../features/experience/presentation/pages/experience_page.dart';
import '../../shared/widgets/navigation/scaffold_with_navbar.dart';

// Private navigator keys
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithNavbar(child: child);
        },
        routes: [
          GoRoute(path: '/', builder: (context, state) => const HomePage()),
          GoRoute(
            path: '/projects',
            builder: (context, state) => const ProjectsPage(),
          ),
          GoRoute(
            path: '/case-studies',
            builder: (context, state) =>
                const Center(child: Text("Case Studies Page")),
          ),
          GoRoute(
            path: '/about',
            builder: (context, state) => const AboutPageNew(),
          ),
          GoRoute(
            path: '/experience',
            builder: (context, state) => ExperiencePage(),
          ),
          GoRoute(
            path: '/contact',
            builder: (context, state) => const ContactPage(),
          ),
        ],
      ),
    ],
  );
}
