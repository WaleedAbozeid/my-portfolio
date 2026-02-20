import 'package:flutter/material.dart';

/// Responsive breakpoints
class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
  static const double largeDesktop = 1600;
}

/// Responsive utility class
class Responsive {
  final BuildContext context;
  final Size size;

  Responsive(this.context) : size = MediaQuery.of(context).size;

  /// Check if current screen is mobile
  bool get isMobile => size.width < Breakpoints.mobile;

  /// Check if current screen is tablet
  bool get isTablet =>
      size.width >= Breakpoints.mobile && size.width < Breakpoints.desktop;

  /// Check if current screen is desktop
  bool get isDesktop => size.width >= Breakpoints.desktop;

  /// Check if current screen is large desktop
  bool get isLargeDesktop => size.width >= Breakpoints.largeDesktop;

  /// Get responsive padding
  EdgeInsets get padding => EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : isTablet ? 32 : 48,
        vertical: isMobile ? 24 : 32,
      );

  /// Get responsive horizontal padding
  double get horizontalPadding =>
      isMobile ? 16 : isTablet ? 32 : isDesktop ? 48 : 64;

  /// Get responsive vertical padding
  double get verticalPadding => isMobile ? 24 : 32;

  /// Get responsive font size multiplier
  double get fontSizeMultiplier => isMobile ? 1.0 : isTablet ? 1.1 : 1.2;

  /// Get responsive grid columns
  int getGridColumns({int? mobile, int? tablet, int? desktop}) {
    if (isMobile) return mobile ?? 1;
    if (isTablet) return tablet ?? 2;
    return desktop ?? 3;
  }

  /// Get responsive max width
  double getMaxWidth({double? mobile, double? tablet, double? desktop}) {
    if (isMobile) return mobile ?? size.width;
    if (isTablet) return tablet ?? 900;
    return desktop ?? 1200;
  }

  /// Get responsive spacing
  double getSpacing({double? mobile, double? tablet, double? desktop}) {
    if (isMobile) return mobile ?? 16;
    if (isTablet) return tablet ?? 24;
    return desktop ?? 32;
  }
}

/// Extension to easily access Responsive from BuildContext
extension ResponsiveExtension on BuildContext {
  Responsive get responsive => Responsive(this);
}
