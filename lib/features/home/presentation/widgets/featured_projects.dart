import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../data/projects_data.dart';
import '../../../../shared/widgets/cards/project_card.dart';

class FeaturedProjects extends StatelessWidget {
  const FeaturedProjects({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final responsive = Responsive(context);

    // Top 4 flagship projects for home page
    final featuredProjects = [
      sampleProjects.firstWhere((p) => p.id == '3', orElse: () => sampleProjects[0]),
      sampleProjects.firstWhere((p) => p.id == '1', orElse: () => sampleProjects[1]),
      sampleProjects.firstWhere((p) => p.id == '6', orElse: () => sampleProjects[2]),
      sampleProjects.firstWhere((p) => p.id == '8', orElse: () => sampleProjects[3]),
    ];

    // Grid columns based on screen width
    final crossAxisCount = responsive.getGridColumns(
      mobile: 1,
      tablet: 2,
      desktop: 2,
    );

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: responsive.isMobile ? 48 : 64,
        horizontal: responsive.horizontalPadding,
      ),
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkSecondaryBackground
          : AppColors.lightSecondaryBackground,
      child: Column(
        children: [
          Text(
            loc.locale.languageCode == 'ar'
                ? "مشاريع مميزة"
                : "Featured Projects",
            textAlign: responsive.isMobile ? TextAlign.center : null,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              fontSize: responsive.isMobile ? 24 : null,
            ),
          ),
          SizedBox(height: responsive.isMobile ? 12 : 16),
          Text(
            loc.locale.languageCode == 'ar'
                ? "نماذج مختارة من أحدث أعمالي في تطبيقات الجوال والذكاء الاصطناعي وتحليل البيانات"
                : "A selection of my recent work across Mobile Apps, AI & Data Analytics",
            textAlign: responsive.isMobile ? TextAlign.center : null,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: responsive.isMobile ? 14 : null,
            ),
          ),
          SizedBox(height: responsive.isMobile ? 32 : 48),

          // Grid or Column based on screen size
          responsive.isMobile
              ? Column(
                  children: featuredProjects
                      .map(
                        (project) => Padding(
                          padding: EdgeInsets.only(
                            bottom: responsive.isMobile ? 20.0 : 24.0,
                          ),
                          child: ProjectCard(
                            project: project,
                            onTap: () => context.go('/projects/${project.id}'),
                          ),
                        ),
                      )
                      .toList(),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: responsive.isMobile ? 16 : 24,
                    mainAxisSpacing: responsive.isMobile ? 16 : 24,
                    childAspectRatio: 0.82,
                  ),
                  itemCount: featuredProjects.length,
                  itemBuilder: (context, index) {
                    return ProjectCard(
                      project: featuredProjects[index],
                      onTap: () => context.go('/projects/${featuredProjects[index].id}'),
                    );
                  },
                ),

          SizedBox(height: responsive.isMobile ? 32 : 48),
          OutlinedButton(
            onPressed: () => context.go('/projects'),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: responsive.isMobile ? 24 : 32,
                vertical: responsive.isMobile ? 14 : 16,
              ),
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary),
            ),
            child: Text(
              loc.translate('home_cta_projects'),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
