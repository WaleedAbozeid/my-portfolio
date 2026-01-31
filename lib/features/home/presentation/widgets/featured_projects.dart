import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../data/projects_data.dart';
import '../../../../shared/widgets/cards/project_card.dart';

class FeaturedProjects extends StatelessWidget {
  const FeaturedProjects({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    final isTablet = size.width > 768 && size.width <= 1024;

    // Grid columns based on screen width
    int crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkSecondaryBackground
          : AppColors.lightSecondaryBackground,
      child: Column(
        children: [
          Text(
            "Featured Projects", // Add to localizations 'home_featured_projects'
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Check out some of my recent work", // Add to localizations
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 48),

          // Grid or Wrap
          isDesktop || isTablet
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.8, // Adjust as needed
                  ),
                  itemCount: sampleProjects.length,
                  itemBuilder: (context, index) {
                    return ProjectCard(
                      project: sampleProjects[index],
                      onTap: () => context.go(
                        '/projects',
                      ), // or specific project details
                    );
                  },
                )
              : Column(
                  children: sampleProjects
                      .map(
                        (project) => Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: ProjectCard(
                            project: project,
                            onTap: () => context.go('/projects'),
                          ),
                        ),
                      )
                      .toList(),
                ),

          const SizedBox(height: 48),
          OutlinedButton(
            onPressed: () => context.go('/projects'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary),
            ),
            child: Text(loc.translate('home_cta_projects')),
          ),
        ],
      ),
    );
  }
}
