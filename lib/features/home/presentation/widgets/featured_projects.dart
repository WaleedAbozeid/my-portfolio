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

    // Grid columns based on screen width
    final crossAxisCount = responsive.getGridColumns(
      mobile: 1,
      tablet: 2,
      desktop: 3,
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
            "Featured Projects",
            textAlign: responsive.isMobile ? TextAlign.center : null,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              fontSize: responsive.isMobile ? 24 : null,
            ),
          ),
          SizedBox(height: responsive.isMobile ? 12 : 16),
          Text(
            "Check out some of my recent work",
            textAlign: responsive.isMobile ? TextAlign.center : null,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: responsive.isMobile ? 14 : null,
            ),
          ),
          SizedBox(height: responsive.isMobile ? 32 : 48),

          // Grid or Column based on screen size
          responsive.isMobile
              ? Column(
                  children: sampleProjects
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
                    childAspectRatio: responsive.isMobile ? 0.75 : 0.8,
                  ),
                  itemCount: sampleProjects.length,
                  itemBuilder: (context, index) {
                    return ProjectCard(
                      project: sampleProjects[index],
                      onTap: () => context.go('/projects/${sampleProjects[index].id}'),
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
              style: TextStyle(
                fontSize: responsive.isMobile ? 14 : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
