import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/colors.dart';
import '../../core/services/visit_tracker.dart';
import '../../core/utils/responsive.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _visitorCount = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadVisitorCount();
  }

  Future<void> _loadVisitorCount() async {
    final count = await VisitTrackerService.trackAndGetCount();
    if (mounted) {
      setState(() {
        _visitorCount = count;
        _isLoading = false;
      });
    }
  }

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
                const SizedBox(height: 24),
                _buildVisitorBadge(isDark),
              ] else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildBrand(context, isDark),
                    _buildVisitorBadge(isDark),
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

  Widget _buildVisitorBadge(bool isDark) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: _isLoading
          ? _buildLoadingBadge(isDark)
          : _buildCountBadge(isDark),
    );
  }

  Widget _buildLoadingBadge(bool isDark) {
    return Container(
      key: const ValueKey('loading'),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.06)
            : Colors.black.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.06),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            FontAwesomeIcons.eye,
            size: 13,
            color: isDark ? Colors.white38 : Colors.black38,
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountBadge(bool isDark) {
    return Container(
      key: const ValueKey('count'),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: isDark ? 0.12 : 0.08),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Pulsing dot
          _PulsingDot(),
          const SizedBox(width: 8),
          FaIcon(
            FontAwesomeIcons.eye,
            size: 13,
            color: AppColors.primary,
          ),
          const SizedBox(width: 6),
          TweenAnimationBuilder<int>(
            tween: IntTween(begin: 0, end: _visitorCount),
            duration: const Duration(milliseconds: 1400),
            curve: Curves.easeOutCubic,
            builder: (context, value, _) {
              return Text(
                '$value visits',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                  letterSpacing: 0.3,
                ),
              );
            },
          ),
        ],
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

// ─────────────────────────────────────────────
// Animated pulsing green dot indicator
// ─────────────────────────────────────────────
class _PulsingDot extends StatefulWidget {
  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  late Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _scaleAnim = Tween<double>(begin: 0.7, end: 1.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _opacityAnim = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) => Transform.scale(
        scale: _scaleAnim.value,
        child: Opacity(
          opacity: _opacityAnim.value,
          child: Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff10B981), // green — "live" indicator
            ),
          ),
        ),
      ),
    );
  }
}
