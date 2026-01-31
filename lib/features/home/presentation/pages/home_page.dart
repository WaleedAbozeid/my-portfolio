import 'package:flutter/material.dart';

import '../widgets/hero_section.dart';
import '../widgets/featured_projects.dart';
import '../widgets/skills_section.dart';
import '../widgets/cta_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeroSection(),
          FeaturedProjects(),
          SkillsSection(),
          CtaSection(),
        ],
      ),
    );
  }
}
