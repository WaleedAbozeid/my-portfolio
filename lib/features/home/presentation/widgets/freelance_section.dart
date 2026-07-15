import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/responsive.dart';

class FreelanceSection extends StatelessWidget {
  const FreelanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final platforms = [
      _FreelancePlatform(
        name: 'مستقل | Mostaql',
        description:
            'وظفني لتنفيذ مشاريعك البرمجية وتحليل البيانات عبر منصة مستقل للمحترفين.',
        icon: FontAwesomeIcons.briefcase,
        color: const Color(0xff2386c8),
        url: 'https://mostaql.com/u/Waleed_Mohamed99',
      ),
      _FreelancePlatform(
        name: 'نفذلي | Nafedhly',
        description:
            'يمكنك توظيفي لمشاريع البرمجة وتطوير التطبيقات وتحليل البيانات عبر منصة نفذلي.',
        icon: FontAwesomeIcons.laptopCode,
        color: const Color(0xff185adb),
        url: 'https://nafezly.com/u/waleed_abozeid',
      ),
      _FreelancePlatform(
        name: 'كفيل | Kfeel',
        description:
            'تواصل معي واطلب خدماتي البرمجية وتحليل البيانات الاحترافية عبر منصة كفيل.',
        icon: FontAwesomeIcons.bolt,
        color: const Color(0xff00d2c4),
        url: 'https://kafiil.com/u/waleed_abozeid',
      ),
      _FreelancePlatform(
        name: 'خمسات | Khamsat',
        description:
            'اشترِ خدماتي المصغرة في تطوير التطبيقات وتحليل البيانات بجودة عالية.',
        icon: FontAwesomeIcons.store,
        color: const Color(0xff4caf50),
        url: 'https://khamsat.com/user/waleidma14587',
      ),
      _FreelancePlatform(
        name: 'Upwork',
        description:
            'Hire me for contract work, mobile app development, and database systems globally.',
        icon: FontAwesomeIcons
            .upwork, // قد لا يتوفر في بعض النسخ القديمة، سنقوم بعمل fallback له
        color: const Color(0xff14a800),
        url:
            'https://www.upwork.com/freelancers/~01e74d9ed0c92cdb88?mp_source=share',
      ),
      _FreelancePlatform(
        name: 'فيلانس يارد | FreelanceYard',
        description:
            'تواصل معي لتنفيذ مشاريعك البرمجية وتحليل البيانات عبر منصة فيلانس يارد.',
        icon: FontAwesomeIcons.handshake,
        color: const Color(0xffff6b00),
        url: 'https://freelanceyard.com/en/account/profile',
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: responsive.isMobile ? 48 : 80,
        horizontal: responsive.horizontalPadding,
      ),
      color: isDark ? AppColors.darkBackground : Colors.white,
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
                'Hire Me on Freelance Platforms',
                textAlign: responsive.isMobile ? TextAlign.center : null,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.isMobile
                      ? 26
                      : responsive.isTablet
                      ? 30
                      : null,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'يمكنك توظيفي مباشرة عبر منصات العمل الحر المفضلة لديك',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey,
                  fontSize: responsive.isMobile ? 14 : null,
                ),
              ),
              SizedBox(height: responsive.isMobile ? 32 : 48),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: responsive.isMobile
                      ? 1
                      : responsive.isTablet
                      ? 2
                      : 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: responsive.isMobile ? 1.6 : 1.2,
                ),
                itemCount: platforms.length,
                itemBuilder: (context, index) {
                  final platform = platforms[index];
                  return _PlatformCard(platform: platform, isDark: isDark);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FreelancePlatform {
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final String url;

  _FreelancePlatform({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.url,
  });
}

class _PlatformCard extends StatefulWidget {
  final _FreelancePlatform platform;
  final bool isDark;

  const _PlatformCard({required this.platform, required this.isDark});

  @override
  State<_PlatformCard> createState() => _PlatformCardState();
}

class _PlatformCardState extends State<_PlatformCard> {
  bool _isHovered = false;

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.isDark
              ? AppColors.darkSecondaryBackground
              : Colors.grey[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? widget.platform.color
                : Colors.grey.withOpacity(0.1),
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.platform.color.withOpacity(0.15),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: InkWell(
          onTap: () => _launchUrl(widget.platform.url),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: widget.platform.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: FaIcon(
                        widget.platform.icon,
                        color: widget.platform.color,
                        size: 24,
                      ),
                    ),
                    Icon(
                      Icons.arrow_outward,
                      color: _isHovered ? widget.platform.color : Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  widget.platform.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Text(
                    widget.platform.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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
