import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../data/models/project.dart';
import '../../../../data/projects_data.dart';

class ProjectDetailsPage extends StatelessWidget {
  final String projectId;

  const ProjectDetailsPage({
    super.key,
    required this.projectId,
  });

  Project? get project {
    try {
      return sampleProjects.firstWhere((p) => p.id == projectId);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final project = this.project;

    if (project == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Project Not Found')),
        body: const Center(child: Text('Project not found')),
      );
    }

    return SingleChildScrollView(
      padding: responsive.padding,
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: responsive.getMaxWidth(
              mobile: double.infinity,
              tablet: 900,
              desktop: 1000,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Images
              if (project.images.isNotEmpty) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    project.images.first,
                    width: double.infinity,
                    height: responsive.isMobile ? 250 : 400,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: responsive.isMobile ? 24 : 32),
              ],

              // Title
              Text(
                project.title,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.isMobile ? 28 : null,
                ),
              ),
              SizedBox(height: responsive.isMobile ? 16 : 24),

              // Description
              Text(
                project.fullDescription,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.8,
                  fontSize: responsive.isMobile ? 14 : null,
                ),
              ),
              SizedBox(height: responsive.isMobile ? 24 : 32),

              // Tech Stack
              Text(
                'Technologies Used',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.isMobile ? 20 : null,
                ),
              ),
              SizedBox(height: responsive.isMobile ? 12 : 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: project.techStack.map((tech) {
                  return Chip(
                    label: Text(tech),
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    side: BorderSide(
                      color: AppColors.primary.withOpacity(0.3),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: responsive.isMobile ? 32 : 48),

              // Download & Links Section
              Container(
                padding: EdgeInsets.all(responsive.isMobile ? 20 : 24),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Download & Links',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: responsive.isMobile ? 20 : null,
                      ),
                    ),
                    SizedBox(height: responsive.isMobile ? 16 : 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        if (project.downloadUrl != null)
                          ElevatedButton.icon(
                            onPressed: () => _launchUrl(project.downloadUrl!),
                            icon: const Icon(Icons.download, size: 20),
                            label: const Text('Download APK'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: responsive.isMobile ? 20 : 24,
                                vertical: responsive.isMobile ? 14 : 16,
                              ),
                            ),
                          ),
                        if (project.playStoreUrl != null)
                          OutlinedButton.icon(
                            onPressed: () => _launchUrl(project.playStoreUrl!),
                            icon: const Icon(Icons.android, size: 20),
                            label: const Text('Play Store'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              side: const BorderSide(color: AppColors.primary),
                              padding: EdgeInsets.symmetric(
                                horizontal: responsive.isMobile ? 20 : 24,
                                vertical: responsive.isMobile ? 14 : 16,
                              ),
                            ),
                          ),
                        if (project.appStoreUrl != null)
                          OutlinedButton.icon(
                            onPressed: () => _launchUrl(project.appStoreUrl!),
                            icon: const Icon(Icons.phone_iphone, size: 20),
                            label: const Text('App Store'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              side: const BorderSide(color: AppColors.primary),
                              padding: EdgeInsets.symmetric(
                                horizontal: responsive.isMobile ? 20 : 24,
                                vertical: responsive.isMobile ? 14 : 16,
                              ),
                            ),
                          ),
                        if (project.githubUrl != null)
                          OutlinedButton.icon(
                            onPressed: () => _launchUrl(project.githubUrl!),
                            icon: const Icon(Icons.code, size: 20),
                            label: const Text('GitHub'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              side: const BorderSide(color: AppColors.primary),
                              padding: EdgeInsets.symmetric(
                                horizontal: responsive.isMobile ? 20 : 24,
                                vertical: responsive.isMobile ? 14 : 16,
                              ),
                            ),
                          ),
                        if (project.liveUrl != null)
                          OutlinedButton.icon(
                            onPressed: () => _launchUrl(project.liveUrl!),
                            icon: const Icon(Icons.open_in_browser, size: 20),
                            label: const Text('Live Demo'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              side: const BorderSide(color: AppColors.primary),
                              padding: EdgeInsets.symmetric(
                                horizontal: responsive.isMobile ? 20 : 24,
                                vertical: responsive.isMobile ? 14 : 16,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: responsive.isMobile ? 32 : 48),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
