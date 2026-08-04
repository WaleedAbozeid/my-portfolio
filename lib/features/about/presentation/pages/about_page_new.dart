import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../shared/widgets/footer.dart';
import '../../../../core/l10n/app_localizations.dart';

class AboutPageNew extends StatelessWidget {
  const AboutPageNew({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.symmetric(
              vertical: responsive.isMobile ? 40 : 60,
              horizontal: responsive.horizontalPadding,
            ),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context).translate('about_title'),
                  textAlign: responsive.isMobile ? TextAlign.center : null,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: responsive.isMobile ? 32 : responsive.isTablet ? 40 : null,
                  ),
                ),
                SizedBox(height: responsive.isMobile ? 8 : 12),
                Text(
                  AppLocalizations.of(context).translate('about_subtitle'),
                  textAlign: responsive.isMobile ? TextAlign.center : null,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[400],
                    fontSize: responsive.isMobile ? 16 : null,
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Container(
            constraints: BoxConstraints(
              maxWidth: responsive.getMaxWidth(
                mobile: double.infinity,
                tablet: 900,
                desktop: 1200,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: responsive.horizontalPadding,
              vertical: responsive.isMobile ? 40 : 60,
            ),
            child: Flex(
              direction: responsive.isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Image
                Container(
                  width: responsive.isMobile ? 200 : responsive.isTablet ? 250 : 300,
                  height: responsive.isMobile ? 200 : responsive.isTablet ? 250 : 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primary,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.2),
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
                        return Center(
                          child: Text(
                            'WMA',
                            style: TextStyle(
                              fontSize: responsive.isMobile ? 40 : responsive.isTablet ? 50 : 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(
                  width: responsive.isMobile ? 0 : responsive.isTablet ? 40 : 80,
                  height: responsive.isMobile ? 32 : 0,
                ),

                // Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: responsive.isMobile 
                        ? CrossAxisAlignment.center 
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('about_greeting'),
                        textAlign: responsive.isMobile ? TextAlign.center : null,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: responsive.isMobile ? 24 : responsive.isTablet ? 28 : null,
                            ),
                      ),
                      SizedBox(height: responsive.isMobile ? 16 : 24),
                      Text(
                        AppLocalizations.of(context).translate('about_description_1'),
                        textAlign: responsive.isMobile ? TextAlign.center : null,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.8,
                          color: Colors.grey[400],
                          fontSize: responsive.isMobile ? 14 : null,
                        ),
                      ),
                      SizedBox(height: responsive.isMobile ? 12 : 16),
                      Text(
                        AppLocalizations.of(context).translate('about_description_2'),
                        textAlign: responsive.isMobile ? TextAlign.center : null,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.8,
                          color: Colors.grey[400],
                          fontSize: responsive.isMobile ? 14 : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Stats Section
          Container(
            constraints: BoxConstraints(
              maxWidth: responsive.getMaxWidth(
                mobile: double.infinity,
                tablet: 900,
                desktop: 1200,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: responsive.horizontalPadding,
              vertical: responsive.isMobile ? 24 : 40,
            ),
            child: responsive.isMobile
                ? Column(
                    children: [
                      _StatCard(
                        value: '2+',
                        label: AppLocalizations.of(context).translate('about_exp_label'),
                        subtitle: AppLocalizations.of(context).translate('about_exp_sub'),
                      ),
                      const SizedBox(height: 16),
                      _StatCard(
                        value: '10+',
                        label: AppLocalizations.of(context).translate('about_projects_label'),
                        subtitle: AppLocalizations.of(context).translate('about_projects_sub'),
                      ),
                      const SizedBox(height: 16),
                      _StatCard(
                        value: '-',
                        label: AppLocalizations.of(context).translate('about_satisfaction_label'),
                        subtitle: AppLocalizations.of(context).translate('about_satisfaction_sub'),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: _StatCard(
                          value: '2+',
                          label: AppLocalizations.of(context).translate('about_exp_label'),
                          subtitle: AppLocalizations.of(context).translate('about_exp_sub'),
                        ),
                      ),
                      SizedBox(width: responsive.getSpacing()),
                      Expanded(
                        child: _StatCard(
                          value: '10+',
                          label: AppLocalizations.of(context).translate('about_projects_label'),
                          subtitle: AppLocalizations.of(context).translate('about_projects_sub'),
                        ),
                      ),
                      SizedBox(width: responsive.getSpacing()),
                      Expanded(
                        child: _StatCard(
                          value: '-',
                          label: AppLocalizations.of(context).translate('about_satisfaction_label'),
                          subtitle: AppLocalizations.of(context).translate('about_satisfaction_sub'),
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(height: responsive.isMobile ? 40 : 60),
          const Footer(),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final String subtitle;

  const _StatCard({
    required this.value,
    required this.label,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: responsive.isMobile ? 0 : 8,
      ),
      padding: EdgeInsets.all(
        responsive.isMobile ? 20 : 24,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: responsive.isMobile ? 32 : 40,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: responsive.isMobile ? 6 : 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: responsive.isMobile ? 16 : null,
            ),
          ),
          SizedBox(height: responsive.isMobile ? 4 : 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(
              color: Colors.grey,
              fontSize: responsive.isMobile ? 12 : null,
            ),
          ),
        ],
      ),
    );
  }
}
