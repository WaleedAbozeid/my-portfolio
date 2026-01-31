import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../data/projects_data.dart';
import '../../../../shared/widgets/cards/project_card.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Mobile Apps',
    'Data Analytics',
    'Web', // As per prompt requirements
  ];

  @override
  Widget build(BuildContext context) {
    // Filter projects
    final filteredProjects = _selectedCategory == 'All'
        ? sampleProjects
        : sampleProjects.where((p) => p.category == _selectedCategory).toList();

    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    final isTablet = size.width > 768 && size.width <= 1024;
    final int crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);

    final loc = AppLocalizations.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            loc.translate('projects_title'), // "My Projects"
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 32),

          // Filter Chips
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _categories.map((category) {
              final isSelected = _selectedCategory == category;
              return ChoiceChip(
                label: Text(category),
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

          const SizedBox(height: 48),

          // Grid
          filteredProjects.isEmpty
              ? SizedBox(
                  height: 300,
                  child: Center(
                    child: Text(
                      "No projects found in this category.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: filteredProjects.length,
                  itemBuilder: (context, index) {
                    return ProjectCard(
                      project: filteredProjects[index],
                      onTap: () {
                        // Navigate to details if needed
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }
}
