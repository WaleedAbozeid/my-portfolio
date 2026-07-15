import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../data/models/project.dart';
import '../../../../data/projects_data.dart';
import '../../../../shared/widgets/footer.dart';

class ProjectDetailsPage extends StatelessWidget {
  final String projectId;

  const ProjectDetailsPage({super.key, required this.projectId});

  Project? get project {
    try {
      return sampleProjects.firstWhere((p) => p.id == projectId);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final proj = project;

    if (proj == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Project Not Found')),
        body: const Center(child: Text('Project not found')),
      );
    }

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: isDark ? const Color(0xff091122) : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton.icon(
            icon: Icon(
              Icons.arrow_back,
              color: isDark ? Colors.white70 : Colors.black87,
              size: 18,
            ),
            label: Text(
              "Back to Projects",
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.black87,
                fontSize: 13,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: isDark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.05),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () => context.go('/projects'),
          ),
        ),
        leadingWidth: 200,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Hero Section
            _buildHeroSection(context, proj, isDark, responsive),

            // 2. Content Section (3-Column Layout on Desktop)
            Container(
              constraints: BoxConstraints(
                maxWidth: responsive.getMaxWidth(
                  mobile: double.infinity,
                  tablet: 900,
                  desktop: 1200, // wider for 3 columns
                ),
              ),
              padding: responsive.padding.copyWith(top: 16, bottom: 64),
              child: responsive.isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Column 1: Key Tech Stack
                        Expanded(
                          flex: 1,
                          child: FadeInUp(
                            duration: const Duration(milliseconds: 600),
                            child: _buildKeyTechStack(context, proj, isDark),
                          ),
                        ),
                        const SizedBox(width: 48),

                        // Column 2: Key Features & Action Buttons
                        Expanded(
                          flex: 1,
                          child: FadeInUp(
                            duration: const Duration(milliseconds: 600),
                            delay: const Duration(milliseconds: 100),
                            child: _buildKeyFeatures(context, proj, isDark),
                          ),
                        ),
                        const SizedBox(width: 48),

                        // Column 3: Overview & Technologies Used
                        Expanded(
                          flex: 1,
                          child: FadeInUp(
                            duration: const Duration(milliseconds: 600),
                            delay: const Duration(milliseconds: 200),
                            child: _buildOverviewColumn(context, proj, isDark),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInUp(
                          duration: const Duration(milliseconds: 600),
                          child: _buildOverviewColumn(context, proj, isDark),
                        ),
                        const SizedBox(height: 48),

                        FadeInUp(
                          duration: const Duration(milliseconds: 600),
                          delay: const Duration(milliseconds: 100),
                          child: _buildKeyTechStack(context, proj, isDark),
                        ),
                        const SizedBox(height: 48),

                        FadeInUp(
                          duration: const Duration(milliseconds: 600),
                          delay: const Duration(milliseconds: 200),
                          child: _buildKeyFeatures(context, proj, isDark),
                        ),
                      ],
                    ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(
    BuildContext context,
    Project proj,
    bool isDark,
    Responsive responsive,
  ) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          // 1. Cinematic Blurred Background (Fills the sides)
          if (proj.images.isNotEmpty)
            Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Image.asset(proj.images.first, fit: BoxFit.cover),
              ),
            ),

          // 2. Dimming overlay to make the blur look like a sleek reflection
          Positioned.fill(
            child: Container(
              color: (isDark ? const Color(0xff091122) : const Color(0xfff0f2f5))
                  .withOpacity(0.6),
            ),
          ),

          // Subtle Bottom Gradient to blend into background
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 150,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),

          // 3. Main Sharp Image(s) with dynamic height
          // We let this padding determine the overall height of the Stack
          if (proj.images.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(
                top: responsive.isMobile ? 240 : 280, // Push down below title block
                bottom: responsive.isMobile ? 60 : 80,
              ),
              child: _buildHeroImages(context, proj, responsive),
            ),

          // Central Glassmorphism Title Box
          Positioned(
            top: responsive.isMobile ? 80 : 100,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsive.isMobile ? 32 : 64,
                        vertical: responsive.isMobile ? 24 : 32,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            proj.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 2.0,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            proj.description,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: Colors.white.withOpacity(0.9),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImages(
    BuildContext context,
    Project proj,
    Responsive responsive,
  ) {
    final images = proj.images;
    if (images.isEmpty) return const SizedBox();

    // Determine target height based on category. mobile apps get massive heights to see them clearly!
    final isMobileApp = proj.category == 'Mobile Apps';
    final targetHeight = isMobileApp 
        ? (responsive.isMobile ? 550.0 : 700.0) 
        : (responsive.isMobile ? 250.0 : 400.0);

    if (images.length == 1) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () => _showImageDialog(context, images.first),
            child: SizedBox(
              height: targetHeight,
              child: Image.asset(images.first, fit: BoxFit.contain),
            ),
          ),
        ),
      );
    }

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: responsive.isMobile ? 10 : 40,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.map((img) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsive.isMobile ? 8 : 16,
              ),
              child: GestureDetector(
                onTap: () => _showImageDialog(context, img),
                child: SizedBox(
                  height: targetHeight,
                  child: Image.asset(
                    img,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // --- Column 1: Key Tech Stack ---
  Widget _buildKeyTechStack(BuildContext context, Project proj, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Key Technology Stack', isDark),
        const SizedBox(height: 26),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: proj.techStack.take(4).map((tech) {
            return _buildLargeTechIconCard(tech, isDark);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildLargeTechIconCard(String tech, bool isDark) {
    // Determine icon and color based on tech string
    IconData icon = FontAwesomeIcons.code;
    Color color = AppColors.primary;
    String t = tech.toLowerCase();

    if (t.contains('flutter')) {
      icon = FontAwesomeIcons.flutter;
      color = const Color(0xff45D1FD);
    } else if (t.contains('firebase')) {
      icon = FontAwesomeIcons.fire;
      color = const Color(0xffFFCA28);
    } else if (t.contains('python')) {
      icon = FontAwesomeIcons.python;
      color = const Color(0xff3776AB);
    } else if (t.contains('api') || t.contains('rest')) {
      icon = FontAwesomeIcons.cloud;
      color = const Color(0xffA8B9CC);
    } else if (t.contains('provider') || t.contains('state')) {
      icon = FontAwesomeIcons.cubes;
      color = const Color(0xff00E676);
    }

    // Highlight first item (e.g. Flutter) like the screenshot
    bool isPrimary = t.contains('flutter') || t.contains('react');

    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff12213D) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isPrimary ? color.withOpacity(0.5) : Colors.transparent,
          width: 2,
        ),
        boxShadow: isPrimary
            ? [
                BoxShadow(
                  color: color.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ]
            : (isDark
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                      ),
                    ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: color),
          const SizedBox(height: 16),
          Text(
            tech,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // --- Column 2: Key Features & Buttons ---
  Widget _buildKeyFeatures(BuildContext context, Project proj, bool isDark) {
    // Generate some mock/placeholder feature lines if we don't have explicit ones.
    // In a real app we'd map over `proj.features`
    final List<String> extractedFeatures = [
      'Real-time data synchronization',
      'Multi-platform support (iOS, Android, Web)',
      'Comprehensive Admin Dashboard',
      'High-performance & intuitive UI',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Key Features', isDark),
        const SizedBox(height: 24),
        ...extractedFeatures.map((feature) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: isDark ? Colors.white54 : Colors.black54,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    feature,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: 32),
        // Price Display for Paid Apps
        if (proj.isPaid) ...[
          _buildPriceDisplay(context, proj, isDark),
          const SizedBox(height: 32),
        ],
        // Action Buttons from the screenshot (Orange & Blue)
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            if (proj.isPaid)
              _buildModernButton(
                context,
                'تواصل الآن عبر الواتساب',
                const Color(0xff00d166), // Vibrant Green
                () => _launchWhatsApp(proj.whatsappNumber!, proj),
              ),
            if (proj.liveUrl != null)
              _buildModernButton(
                context,
                'View Live Demo',
                const Color(0xffFF7000), // Vibrant Orange
                () => _launchUrl(proj.liveUrl!),
              ),
            if (proj.downloadUrl != null && !proj.isPaid)
              _buildModernButton(
                context,
                'Download APK',
                const Color(0xff00d166), // Vibrant Green
                () => _launchUrl(proj.downloadUrl!),
              ),
            if (proj.githubUrl != null)
              _buildModernButton(
                context,
                'View Github Repo',
                const Color(0xff1E88E5), // Vibrant Blue
                () => _launchUrl(proj.githubUrl!),
              ),
            if (proj.playStoreUrl != null)
              _buildModernButton(
                context,
                'Play Store',
                const Color(0xff3D5AFE), // Indigo
                () => _launchUrl(proj.playStoreUrl!),
              ),
            if (proj.appStoreUrl != null)
              _buildModernButton(
                context,
                'App Store',
                const Color(0xff1f2937), // Dark Gray
                () => _launchUrl(proj.appStoreUrl!),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceDisplay(BuildContext context, Project proj, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff12213D) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xff00d166).withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff00d166).withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (proj.discount != null && proj.discount! > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.withOpacity(0.5)),
              ),
              child: Text(
                '💥 خصم خاص ${proj.discount?.toStringAsFixed(0)}%',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          const SizedBox(height: 16),
          Text(
            'تواصل معنا عبر الواتساب لمعرفة السعر بعد الخصم والحصول على التطبيق',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.5,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<void> _launchWhatsApp(String phoneNumber, Project proj) async {
    final message = 'مرحبا، أنا مهتم بشراء تطبيق ${proj.title}';
    final whatsappUrl =
        'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';
    final uri = Uri.parse(whatsappUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // Fallback to opening WhatsApp app directly
      final whatsappAppUrl =
          'whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}';
      final appUri = Uri.parse(whatsappAppUrl);
      if (await canLaunchUrl(appUri)) {
        await launchUrl(appUri, mode: LaunchMode.externalApplication);
      }
    }
  }

  Widget _buildModernButton(
    BuildContext context,
    String text,
    Color bgColor,
    VoidCallback onPressed,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: bgColor.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  // --- Column 3: Overview & Tech Chips ---
  Widget _buildOverviewColumn(BuildContext context, Project proj, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Overview', isDark),
        const SizedBox(height: 24),
        Text(
          proj.fullDescription,
          style: TextStyle(
            fontSize: 14,
            height: 1.6,
            color: isDark ? Colors.white70 : Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildSectionTitle(context, 'Technologies Used', isDark),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: proj.techStack.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withOpacity(0.08)
                    : Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                tech,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, bool isDark) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: isDark ? Colors.white : Colors.black,
        fontSize: 20,
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            InteractiveViewer(
              panEnabled: true,
              minScale: 0.5,
              maxScale: 4,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.of(context).pop(),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
