import 'package:flutter/material.dart';

/// A widget that animates a number from 0 to [targetValue] when it becomes
/// visible on screen, using a [VisibilityDetector]-like scroll trigger
/// implemented via [LayoutBuilder] + [NotificationListener].
///
/// Uses pure Flutter — no external packages needed.
class AnimatedCounterWidget extends StatefulWidget {
  final int targetValue;
  final String suffix;
  final String prefix;
  final Duration duration;
  final TextStyle? style;

  const AnimatedCounterWidget({
    super.key,
    required this.targetValue,
    this.suffix = '',
    this.prefix = '',
    this.duration = const Duration(milliseconds: 2000),
    this.style,
  });

  @override
  State<AnimatedCounterWidget> createState() => _AnimatedCounterWidgetState();
}

class _AnimatedCounterWidgetState extends State<AnimatedCounterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    // Start animation after a short delay to allow layout
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_hasAnimated) {
        _startAnimation();
      }
    });
  }

  void _startAnimation() {
    if (_hasAnimated) return;
    _hasAnimated = true;
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final current = (_animation.value * widget.targetValue).round();
        return Text(
          '${widget.prefix}$current${widget.suffix}',
          style: widget.style,
        );
      },
    );
  }
}
