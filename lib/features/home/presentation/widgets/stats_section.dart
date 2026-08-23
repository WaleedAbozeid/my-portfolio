import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/responsive.dart';
import 'animated_counter.dart';

/// A premium stats section displayed on the Home page.
/// Shows key portfolio metrics with scroll-triggered animated counters.
class StatsSection extends StatefulWidget {
  const StatsSection({super.key});

  @override
  State<StatsSection> createState() => _StatsSectionState();
}

class _StatsSectionState extends State<StatsSection> {
  final ScrollController _scrollController = ScrollController();
  bool _animationTriggered = false;
  final GlobalKey _sectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Trigger after first frame in case it's already visible
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkVisibility();
    });
  }

  void _checkVisibility() {
    if (_animationTriggered) return;
    final context = _sectionKey.currentContext;
    if (context == null) return;

    final box = context.findRenderObject() as RenderBox?;
    if (box == null) return;

    final position = box.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;

    if (position.dy < screenHeight * 0.95) {
      if (mounted) {
        setState(() => _animationTriggered = true);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final stats = _buildStats();

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _checkVisibility();
        return false;
      },
      child: Container(
        key: _sectionKey,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: responsive.isMobile ? 48 : 72,
          horizontal: responsive.horizontalPadding,
        ),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xff0d1b2e) : const Color(0xfff0f7ff),
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
            child: Column(
              children: [
                // Section Header
                Text(
                  'By the Numbers',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: responsive.isMobile ? 26 : null,
                    color: isDark ? Colors.white : const Color(0xff111827),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Real metrics that reflect my work & experience',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isDark ? Colors.white54 : Colors.black45,
                    fontSize: responsive.isMobile ? 14 : null,
                  ),
                ),
                SizedBox(height: responsive.isMobile ? 36 : 56),

                // Stats Grid
                responsive.isMobile
                    ? _buildMobileGrid(stats, isDark, context)
                    : _buildDesktopGrid(stats, isDark, context, responsive),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileGrid(
    List<_StatItem> stats,
    bool isDark,
    BuildContext context,
  ) {
    return Column(
      children: [
        // 2-column grid for mobile
        for (int i = 0; i < stats.length; i += 2)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: _StatCard(
                    stat: stats[i],
                    isDark: isDark,
                    animate: _animationTriggered,
                  ),
                ),
                if (i + 1 < stats.length) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      stat: stats[i + 1],
                      isDark: isDark,
                      animate: _animationTriggered,
                    ),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildDesktopGrid(
    List<_StatItem> stats,
    bool isDark,
    BuildContext context,
    Responsive responsive,
  ) {
    final columns = responsive.isTablet ? 3 : 4;
    final rows = <Widget>[];

    for (int i = 0; i < stats.length; i += columns) {
      final rowItems = stats.sublist(
        i,
        (i + columns).clamp(0, stats.length),
      );
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              for (int j = 0; j < rowItems.length; j++) ...[
                if (j > 0) const SizedBox(width: 20),
                Expanded(
                  child: _StatCard(
                    stat: rowItems[j],
                    isDark: isDark,
                    animate: _animationTriggered,
                    delay: Duration(milliseconds: j * 120),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return Column(children: rows);
  }

  List<_StatItem> _buildStats() {
    return [
      _StatItem(
        icon: FontAwesomeIcons.calendarCheck,
        iconColor: const Color(0xff06B6D4),
        value: 3,
        suffix: '+',
        label: 'Years of Experience',
        labelAr: 'سنوات خبرة',
      ),
      _StatItem(
        icon: FontAwesomeIcons.diagramProject,
        iconColor: const Color(0xff8B5CF6),
        value: 8,
        suffix: '+',
        label: 'Completed Projects',
        labelAr: 'مشروع مكتمل',
      ),
      _StatItem(
        icon: FontAwesomeIcons.microchip,
        iconColor: const Color(0xffF59E0B),
        value: 94,
        suffix: '%+',
        label: 'AI Model Accuracy',
        labelAr: 'دقة نموذج الذكاء الاصطناعي',
      ),
      _StatItem(
        icon: FontAwesomeIcons.server,
        iconColor: const Color(0xff10B981),
        value: 100,
        suffix: '+',
        label: 'API Endpoints Built',
        labelAr: 'API Endpoints مبنية',
      ),
      _StatItem(
        icon: FontAwesomeIcons.layerGroup,
        iconColor: const Color(0xffEF4444),
        value: 17,
        suffix: '+',
        label: 'Database Tables Designed',
        labelAr: 'جدول بيانات مُصمَّم',
      ),
      _StatItem(
        icon: FontAwesomeIcons.mobile,
        iconColor: const Color(0xff3B82F6),
        value: 25,
        suffix: '+',
        label: 'Interactive Screens',
        labelAr: 'شاشة تفاعلية',
      ),
      _StatItem(
        icon: FontAwesomeIcons.code,
        iconColor: const Color(0xff06B6D4),
        value: 0,
        suffix: '',
        label: 'Dart Analyze Errors',
        labelAr: 'أخطاء Dart Analyze',
        isZeroBadge: true,
      ),
      _StatItem(
        icon: FontAwesomeIcons.globe,
        iconColor: const Color(0xffF59E0B),
        value: 2,
        suffix: '',
        label: 'Languages Supported',
        labelAr: 'لغتان مدعومتان',
        customDisplay: 'AR & EN',
      ),
    ];
  }
}

// ─────────────────────────────────────────────
// Data model for each stat
// ─────────────────────────────────────────────

class _StatItem {
  final FaIconData icon;
  final Color iconColor;
  final int value;
  final String suffix;
  final String label;
  final String labelAr;
  final bool isZeroBadge;
  final String? customDisplay;

  const _StatItem({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.suffix,
    required this.label,
    required this.labelAr,
    this.isZeroBadge = false,
    this.customDisplay,
  });
}

// ─────────────────────────────────────────────
// Individual stat card
// ─────────────────────────────────────────────

class _StatCard extends StatefulWidget {
  final _StatItem stat;
  final bool isDark;
  final bool animate;
  final Duration delay;

  const _StatCard({
    required this.stat,
    required this.isDark,
    required this.animate,
    this.delay = Duration.zero,
  });

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    if (widget.animate) {
      Future.delayed(widget.delay, () {
        if (mounted) _fadeController.forward();
      });
    }
  }

  @override
  void didUpdateWidget(_StatCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate && !oldWidget.animate) {
      Future.delayed(widget.delay, () {
        if (mounted) _fadeController.forward();
      });
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stat = widget.stat;
    final isDark = widget.isDark;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xff12213D)
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _isHovered
                    ? stat.iconColor.withValues(alpha: 0.5)
                    : Colors.transparent,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? stat.iconColor.withValues(alpha: 0.15)
                      : (isDark
                          ? Colors.black.withValues(alpha: 0.2)
                          : Colors.black.withValues(alpha: 0.06)),
                  blurRadius: _isHovered ? 24 : 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon badge
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: stat.iconColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: FaIcon(
                      stat.icon,
                      color: stat.iconColor,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Value display
                if (stat.customDisplay != null)
                  Text(
                    stat.customDisplay!,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: stat.iconColor,
                      letterSpacing: -0.5,
                    ),
                  )
                else if (stat.isZeroBadge)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff10B981).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '0 Errors ✓',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff10B981),
                      ),
                    ),
                  )
                else
                  AnimatedCounterWidget(
                    targetValue: stat.value,
                    suffix: stat.suffix,
                    duration: const Duration(milliseconds: 1800),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: stat.iconColor,
                      letterSpacing: -1,
                    ),
                  ),

                const SizedBox(height: 8),

                // Label
                Text(
                  stat.label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white60 : Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
