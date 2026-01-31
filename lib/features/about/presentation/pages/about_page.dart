import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../data/models/skill.dart';
import '../../../../shared/widgets/animations/skill_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  final List<Skill> _skills = const [
    Skill(name: 'Flutter', proficiency: 0.95, category: 'Mobile'),
    Skill(name: 'Dart', proficiency: 0.95, category: 'Mobile'),
    Skill(name: 'Firebase', proficiency: 0.85, category: 'Backend'),
    Skill(name: 'Python', proficiency: 0.80, category: 'Data'),
    Skill(name: 'SQL', proficiency: 0.75, category: 'Data'),
    Skill(name: 'Power BI', proficiency: 0.70, category: 'Data'),
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                loc.translate('nav_about'),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 48),
              Flex(
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: isDesktop ? 5 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Who I am",
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "I am a passionate Flutter Developer and Data Analyst with a strong background in building intelligent mobile/web solutions. My journey began with a curiosity for how things work, which led me to dive deep into software development and data science.", // Placeholder
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(height: 1.6),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Currently, I am a student at the Faculty of Computer Science and Information, Beni-Suef National University, specializing in Medical Informatics. This program combines my passion for technology with healthcare innovation, allowing me to explore the intersection of data science and medical applications.",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(height: 1.6),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "With expertise in Flutter for cross-platform development and Python for data analysis, I bridge the gap between user-friendly interfaces and data-driven insights.",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(height: 1.6),
                        ),
                      ],
                    ),
                  ),
                  if (isDesktop) const SizedBox(width: 64),
                  if (!isDesktop) const SizedBox(height: 48),

                  // Skills
                  Expanded(
                    flex: isDesktop ? 5 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Technical Skills",
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 24),
                        ..._skills.map(
                          (skill) => SkillBar(
                            label: skill.name,
                            proficiency: skill.proficiency,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
