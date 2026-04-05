import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/utils/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final responsive = Responsive(context);

    return Container(
      constraints: BoxConstraints(
        minHeight: responsive.isMobile 
            ? MediaQuery.of(context).size.height * 0.8 
            : MediaQuery.of(context).size.height - 60,
      ),
      padding: responsive.padding.copyWith(
        top: responsive.isMobile ? 32 : 48,
        bottom: responsive.isMobile ? 48 : 64,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: responsive.getMaxWidth(
              mobile: double.infinity,
              tablet: 900,
              desktop: 1200,
            ),
          ),
          child: Flex(
            direction: responsive.isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hero Image (Mobile - shown at top)
              if (responsive.isMobile) ...[
                FadeInRight(
                  duration: const Duration(milliseconds: 1000),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final imageSize = _calculateProfileImageSize(responsive, constraints.maxWidth);
                      return Container(
                        height: imageSize,
                        width: imageSize,
                        margin: const EdgeInsets.only(bottom: 32),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/Profile/profile2.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(
                                  Icons.person,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],

              // Text Content
              Expanded(
                flex: responsive.isMobile ? 0 : 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: responsive.isMobile 
                      ? CrossAxisAlignment.center 
                      : CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      duration: const Duration(milliseconds: 800),
                      child: Text(
                        loc.translate('home_greeting'),
                        textAlign: responsive.isMobile ? TextAlign.center : null,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: responsive.isMobile ? 18 : null,
                            ),
                      ),
                    ),
                    SizedBox(height: responsive.isMobile ? 12 : 16),
                    FadeInLeft(
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 800),
                      child: Text(
                        "Waleed Mohamed\nAbouzeid",
                        textAlign: responsive.isMobile ? TextAlign.center : null,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                          fontSize: responsive.isMobile ? 32 : responsive.isTablet ? 40 : null,
                        ),
                      ),
                    ),
                    SizedBox(height: responsive.isMobile ? 12 : 16),
                    FadeInLeft(
                      delay: const Duration(milliseconds: 400),
                      duration: const Duration(milliseconds: 800),
                      child: Text(
                        loc.translate('home_tagline'),
                        textAlign: responsive.isMobile ? TextAlign.center : null,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.color?.withOpacity(0.8),
                              fontSize: responsive.isMobile ? 16 : null,
                            ),
                      ),
                    ),
                    SizedBox(height: responsive.isMobile ? 24 : 32),
                    FadeInUp(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 800),
                      child: Wrap(
                        alignment: responsive.isMobile ? WrapAlignment.center : WrapAlignment.start,
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              context.go('/projects');
                            },
                            icon: const Icon(Icons.work_outline, size: 18),
                            label: Text(loc.translate('home_cta_projects')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: responsive.isMobile ? 20 : 24,
                                vertical: responsive.isMobile ? 14 : 16,
                              ),
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {
                              // Download CV logic
                            },
                            icon: const Icon(Icons.download, size: 18),
                            label: Text(
                              loc.translate('home_cta_cv'),
                            ),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: responsive.isMobile ? 20 : 24,
                                vertical: responsive.isMobile ? 14 : 16,
                              ),
                              side: const BorderSide(color: AppColors.primary),
                              foregroundColor: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: responsive.isMobile ? 32 : 48),
                    FadeInUp(
                      delay: const Duration(milliseconds: 800),
                      child: Wrap(
                        alignment: responsive.isMobile ? WrapAlignment.center : WrapAlignment.start,
                        spacing: responsive.isMobile ? 8 : 16,
                        runSpacing: responsive.isMobile ? 8 : 16,
                        children: [
                          _TechBadge(
                            icon: FontAwesomeIcons.flutter,
                            label: 'Flutter',
                          ),
                          _TechBadge(
                            icon: FontAwesomeIcons.database,
                            label: 'Firebase',
                          ),
                          _TechBadge(
                            icon: FontAwesomeIcons.python,
                            label: 'Python',
                          ),
                          _TechBadge(
                            icon: FontAwesomeIcons.chartBar,
                            label: 'Power BI',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!responsive.isMobile) ...[
                SizedBox(width: responsive.isTablet ? 32 : 48),
                // Hero Image
                Expanded(
                  flex: responsive.isTablet ? 3 : 4,
                  child: FadeInRight(
                    duration: const Duration(milliseconds: 1000),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final imageSize = _calculateProfileImageSize(responsive, constraints.maxWidth);
                        return Center(
                          child: Container(
                            height: imageSize,
                            width: imageSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.primary,
                                width: responsive.isTablet ? 3 : 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.2),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/Profile/profile2.jpg',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(
                                      Icons.person,
                                      size: 100,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

  double _calculateProfileImageSize(Responsive responsive, double maxWidth) {
    if (responsive.isMobile) {
      return maxWidth.clamp(60.0, 160.0);
    }
    if (responsive.isTablet) {
      return maxWidth.clamp(160.0, 260.0);
    }
    return maxWidth.clamp(220.0, 320.0);
  }


class _TechBadge extends StatelessWidget {
  final IconData icon;
  final String label;

  const _TechBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: FaIcon(icon, size: 16),
      label: Text(label),
      backgroundColor: Theme.of(context).cardColor,
      side: BorderSide(color: Colors.grey.withOpacity(0.2)),
    );
  }
}
