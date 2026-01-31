import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../data/models/experience.dart';
import '../../../../shared/widgets/cards/timeline_item.dart';

class ExperiencePage extends StatelessWidget {
  ExperiencePage({super.key});

  final List<Experience> _experiences = [
    Experience(
      title: 'Flutter Developer',
      organization: 'Freelance',
      description:
          'Developed and maintained multiple mobile applications for clients using Flutter and Firebase. Implemented REST APIs and integrated payment gateways.',
      startDate: DateTime(2023, 1),
      skills: ['Flutter', 'Dart', 'Firebase', 'REST API'],
    ),
    Experience(
      title: 'Data Analyst Intern',
      organization: 'Tech Solutions Inc.',
      description:
          'Analyzed large datasets using Python and SQL to identify key business trends. Created interactive dashboards using Power BI.',
      startDate: DateTime(2022, 6),
      endDate: DateTime(2022, 12),
      skills: ['Python', 'SQL', 'Power BI', 'Excel'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                loc.translate('nav_experience'),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 48),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _experiences.length,
                itemBuilder: (context, index) {
                  return TimelineItem(
                    experience: _experiences[index],
                    isLast: index == _experiences.length - 1,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
