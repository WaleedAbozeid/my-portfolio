import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: responsive.isMobile ? 48 : 80,
        horizontal: responsive.horizontalPadding,
      ),
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Colors.grey[50],
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
            children: [
              Text(
                'Skills & Technologies',
                textAlign: responsive.isMobile ? TextAlign.center : null,
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.isMobile ? 28 : responsive.isTablet ? 32 : null,
                ),
              ),
              SizedBox(height: responsive.isMobile ? 8 : 12),
              Text(
                'Technologies and tools I work with',
                textAlign: responsive.isMobile ? TextAlign.center : null,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(
                  color: Colors.grey,
                  fontSize: responsive.isMobile ? 14 : null,
                ),
              ),
              SizedBox(height: responsive.isMobile ? 32 : 60),
              responsive.isMobile
                  ? Column(
                      children: const [
                        _SkillCard(
                          icon: FontAwesomeIcons.mobile,
                          title: 'Mobile Development',
                          subtitle: 'Flutter, Dart, iOS, Android',
                        ),
                        SizedBox(height: 16),
                        _SkillCard(
                          icon: FontAwesomeIcons.globe,
                          title: 'Web Development',
                          subtitle: 'Flutter Web, PWA, REST APIs',
                        ),
                        SizedBox(height: 16),
                        _SkillCard(
                          icon: FontAwesomeIcons.chartLine,
                          title: 'Data Analysis',
                          subtitle: 'Python, Data Visualization, Analytics',
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        _SkillCard(
                          icon: FontAwesomeIcons.mobile,
                          title: 'Mobile Development',
                          subtitle: 'Flutter, Dart, iOS, Android',
                        ),
                        _SkillCard(
                          icon: FontAwesomeIcons.globe,
                          title: 'Web Development',
                          subtitle: 'Flutter Web, PWA, REST APIs',
                        ),
                        _SkillCard(
                          icon: FontAwesomeIcons.chartLine,
                          title: 'Data Analysis',
                          subtitle: 'Python, Data Visualization, Analytics',
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

class _SkillCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SkillCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: responsive.isMobile ? 0 : 12,
      ),
      padding: EdgeInsets.all(
        responsive.isMobile ? 24 : 32,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Container(
            width: responsive.isMobile ? 60 : 80,
            height: responsive.isMobile ? 60 : 80,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: responsive.isMobile ? 28 : 36,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: responsive.isMobile ? 16 : 24),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: responsive.isMobile ? 18 : null,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: responsive.isMobile ? 8 : 12),
          Text(
            subtitle,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
              fontSize: responsive.isMobile ? 12 : null,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
