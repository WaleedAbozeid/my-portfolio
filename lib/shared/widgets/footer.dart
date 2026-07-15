import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/colors.dart';
import '../../core/utils/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: responsive.isMobile ? 32 : 48,
        horizontal: responsive.horizontalPadding,
      ),
      color: isDark ? const Color(0xff091122) : Colors.grey[100],
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
              if (responsive.isMobile) ...[
                _buildBrand(context, isDark),
                const SizedBox(height: 24),
                _buildSocials(),
              ] else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBrand(context, isDark),
                    _buildSocials(),
                  ],
                ),
              const Divider(height: 48, thickness: 1),
              Text(
                '© ${DateTime.now().year} Waleed Abouzeid. All rights reserved.',
                style: TextStyle(
                  color: isDark ? Colors.grey[500] : Colors.grey[600],
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrand(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'WMA',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Flutter Developer & Data Analyst',
          style: TextStyle(
            color: isDark ? Colors.grey[400] : Colors.grey[700],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildSocials() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => _launchUrl('https://github.com/WaleedAbozeid'),
          icon: const FaIcon(FontAwesomeIcons.github, size: 20),
          tooltip: 'GitHub',
        ),
        IconButton(
          onPressed: () => _launchUrl('https://linkedin.com'),
          icon: const FaIcon(FontAwesomeIcons.linkedin, size: 20),
          tooltip: 'LinkedIn',
        ),
        IconButton(
          onPressed: () => _launchUrl('https://x.com'),
          icon: const FaIcon(FontAwesomeIcons.xTwitter, size: 20),
          tooltip: 'Twitter',
        ),
      ],
    );
  }
}
