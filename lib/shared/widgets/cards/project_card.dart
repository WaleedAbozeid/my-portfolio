import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../data/models/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback? onTap;

  const ProjectCard({super.key, required this.project, this.onTap});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            else if (!isDark)
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: InkWell(
          onTap: widget.onTap ?? () {
            // Navigate to project details if no custom onTap provided
            // This will be handled by the parent widget
          },
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Placeholder
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[800] : Colors.grey[200],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  image: widget.project.images.isNotEmpty
                      ? DecorationImage(
                          image: AssetImage(widget.project.images.first),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: widget.project.images.isEmpty
                    ? const Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.grey,
                      )
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.project.description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.textTheme.bodyMedium?.color?.withOpacity(
                          0.7,
                        ),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.techStack.take(3).map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            tech,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    // Download buttons
                    if (widget.project.downloadUrl != null ||
                        widget.project.playStoreUrl != null ||
                        widget.project.appStoreUrl != null) ...[
                      const SizedBox(height: 16),
                      _buildDownloadButtons(context),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadButtons(BuildContext context) {
    final responsive = Responsive(context);
    final project = widget.project;
    
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        if (project.downloadUrl != null)
          ElevatedButton.icon(
            onPressed: () => _launchUrl(project.downloadUrl!),
            icon: const Icon(Icons.download, size: 18),
            label: Text(
              'Download APK',
              style: TextStyle(
                fontSize: responsive.isMobile ? 12 : 14,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: responsive.isMobile ? 12 : 16,
                vertical: responsive.isMobile ? 8 : 10,
              ),
            ),
          ),
        if (project.playStoreUrl != null)
          OutlinedButton.icon(
            onPressed: () => _launchUrl(project.playStoreUrl!),
            icon: const Icon(Icons.android, size: 18),
            label: Text(
              'Play Store',
              style: TextStyle(
                fontSize: responsive.isMobile ? 12 : 14,
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary),
              padding: EdgeInsets.symmetric(
                horizontal: responsive.isMobile ? 12 : 16,
                vertical: responsive.isMobile ? 8 : 10,
              ),
            ),
          ),
        if (project.appStoreUrl != null)
          OutlinedButton.icon(
            onPressed: () => _launchUrl(project.appStoreUrl!),
            icon: const Icon(Icons.phone_iphone, size: 18),
            label: Text(
              'App Store',
              style: TextStyle(
                fontSize: responsive.isMobile ? 12 : 14,
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary),
              padding: EdgeInsets.symmetric(
                horizontal: responsive.isMobile ? 12 : 16,
                vertical: responsive.isMobile ? 8 : 10,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
