import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/responsive.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: responsive.isMobile ? 60 : 100,
        horizontal: responsive.horizontalPadding,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.1),
            Theme.of(context).scaffoldBackgroundColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: responsive.getMaxWidth(
              mobile: double.infinity,
              tablet: 900,
              desktop: 800,
            ),
          ),
          child: Column(
            children: [
              Text(
                "Let's Work Together",
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.isMobile ? 28 : responsive.isTablet ? 32 : null,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: responsive.isMobile ? 12 : 16),
              Text(
                "Have a project in mind? Let's discuss how I can help bring your ideas to life.",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(
                  color: Colors.grey,
                  fontSize: responsive.isMobile ? 14 : null,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: responsive.isMobile ? 32 : 40),
              ElevatedButton.icon(
                onPressed: () => context.go('/contact'),
                icon: Icon(
                  Icons.arrow_forward,
                  size: responsive.isMobile ? 18 : 20,
                ),
                label: Text(
                  'Get in Touch',
                  style: TextStyle(
                    fontSize: responsive.isMobile ? 14 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.isMobile ? 24 : 32,
                    vertical: responsive.isMobile ? 16 : 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
