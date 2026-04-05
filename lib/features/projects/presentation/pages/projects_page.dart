import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../data/projects_data.dart';
import '../../../../shared/widgets/cards/project_card.dart';
import 'package:animate_do/animate_do.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    ...sampleProjects.map((p) => p.category).toSet().toList()
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final loc = AppLocalizations.of(context);

    // Filter projects
    final filteredProjects = _selectedCategory == 'All'
        ? sampleProjects
        : sampleProjects.where((p) => p.category == _selectedCategory).toList();

    final crossAxisCount = responsive.getGridColumns(
      mobile: 1,
      tablet: 2,
      desktop: 3,
    );

    return SingleChildScrollView(
      padding: responsive.padding,
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: responsive.getMaxWidth(
              mobile: double.infinity,
              tablet: 900,
              desktop: 1200,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                loc.translate('projects_title'),
                textAlign: responsive.isMobile ? TextAlign.center : null,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontSize: responsive.isMobile ? 28 : null,
                ),
              ),
              SizedBox(height: responsive.isMobile ? 24 : 32),

              // Filter Chips
              Center(
                child: Wrap(
                  alignment: responsive.isMobile 
                      ? WrapAlignment.center 
                      : WrapAlignment.start,
                  spacing: responsive.isMobile ? 8 : 12,
                  runSpacing: responsive.isMobile ? 8 : 12,
                  children: _categories.map((category) {
                    final isSelected = _selectedCategory == category;
                    return ChoiceChip(
                      label: Text(
                        category,
                        style: TextStyle(
                          fontSize: responsive.isMobile ? 14 : null,
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedCategory = category;
                          });
                        }
                      },
                      selectedColor: AppColors.primary,
                      labelStyle: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Theme.of(context).textTheme.bodyMedium?.color,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      backgroundColor: Theme.of(context).cardColor,
                      side: isSelected
                          ? BorderSide.none
                          : BorderSide(color: Colors.grey.withOpacity(0.3)),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: responsive.isMobile ? 32 : 48),

              // Grid
              filteredProjects.isEmpty
                  ? SizedBox(
                      height: 300,
                      child: Center(
                        child: Text(
                          "No projects found in this category.",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: responsive.isMobile ? 14 : null,
                          ),
                        ),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: responsive.isMobile ? 16 : 24,
                        mainAxisSpacing: responsive.isMobile ? 16 : 24,
                        childAspectRatio: responsive.isMobile ? 0.75 : 0.85,
                      ),
                      itemCount: filteredProjects.length,
                      itemBuilder: (context, index) {
                        return FadeInUp(
                          duration: const Duration(milliseconds: 500),
                          delay: Duration(milliseconds: 100 * index),
                          child: ProjectCard(
                            project: filteredProjects[index],
                            onTap: () {
                              context.go('/projects/${filteredProjects[index].id}');
                            },
                          ),
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
