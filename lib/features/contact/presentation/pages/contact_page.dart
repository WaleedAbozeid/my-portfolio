import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/services/contact_service.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../shared/widgets/footer.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      setState(() => _isLoading = true);

      final values = _formKey.currentState!.value;
      final name = values['name']?.toString() ?? '';
      final email = values['email']?.toString() ?? '';
      final subject = values['subject']?.toString() ?? '';
      final message = values['message']?.toString() ?? '';
      final botcheck = values['botcheck']?.toString() ?? '';

      // Anti-spam honeypot verification
      if (botcheck.trim().isNotEmpty) {
        setState(() => _isLoading = false);
        return;
      }

      bool isSent = false;
      try {
        isSent = await ContactService.sendMessage(
          name: name,
          email: email,
          subject: subject,
          message: message,
          botcheck: botcheck,
        );
      } catch (_) {
        isSent = false;
      }

      if (mounted) {
        final loc = AppLocalizations.of(context);
        final messenger = ScaffoldMessenger.of(context);
        if (isSent) {
          messenger.showSnackBar(
            SnackBar(
              backgroundColor: const Color(0xff10B981),
              behavior: SnackBarBehavior.floating,
              content: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      loc.translate('contact_success'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
          _formKey.currentState?.reset();
        } else {
          // Graceful fallback to email client if Web3Forms key is not yet set or offline
          final mailtoUri = Uri(
            scheme: 'mailto',
            path: ContactService.receiverEmail,
            queryParameters: {
              'subject': subject,
              'body': 'Name: $name\nEmail: $email\n\nMessage:\n$message',
            },
          );
          if (await canLaunchUrl(mailtoUri)) {
            await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
          } else {
            messenger.showSnackBar(
              SnackBar(
                backgroundColor: Colors.redAccent,
                behavior: SnackBarBehavior.floating,
                content: Text(
                  loc.translate('contact_error'),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }
        }
        setState(() => _isLoading = false);
      }
    }
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final responsive = Responsive(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: responsive.padding,
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: responsive.getMaxWidth(
                    mobile: double.infinity,
                    tablet: 900,
                    desktop: 1000,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      loc.translate('contact_title'),
                      textAlign: responsive.isMobile ? TextAlign.center : null,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        fontSize: responsive.isMobile ? 28 : null,
                      ),
                    ),
                    SizedBox(height: responsive.isMobile ? 32 : 48),

                    Flex(
                      direction: responsive.isMobile ? Axis.vertical : Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Contact Info
                        Expanded(
                          flex: responsive.isMobile ? 0 : 4,
                          child: Column(
                            crossAxisAlignment: responsive.isMobile 
                                ? CrossAxisAlignment.center 
                                : CrossAxisAlignment.start,
                            children: [
                              _ContactItem(
                                icon: Icons.email,
                                label: "waleedabozeid995@gmail.com",
                                onTap: () =>
                                    _launchUrl("mailto:waleedabozeid995@gmail.com"),
                              ),
                              SizedBox(height: responsive.isMobile ? 20 : 24),
                              _ContactItem(
                                icon: Icons.phone,
                                label: "+20 1030649525",
                                onTap: () => _launchUrl("tel:+201030649525"),
                              ),
                              SizedBox(height: responsive.isMobile ? 20 : 24),
                              const _ContactItem(
                                icon: Icons.location_on,
                                label: "Egypt",
                              ),
                              SizedBox(height: responsive.isMobile ? 32 : 48),
                              Wrap(
                                alignment: responsive.isMobile 
                                    ? WrapAlignment.center 
                                    : WrapAlignment.start,
                                spacing: responsive.isMobile ? 12 : 16,
                                runSpacing: responsive.isMobile ? 12 : 16,
                                children: [
                                  IconButton(
                                    onPressed: () => _launchUrl("https://github.com/WaleedAbozeid"),
                                    icon: const FaIcon(FontAwesomeIcons.github),
                                    tooltip: "GitHub",
                                    iconSize: responsive.isMobile ? 24 : 28,
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        _launchUrl("https://linkedin.com/in/waleedabozeid"),
                                    icon: const FaIcon(FontAwesomeIcons.linkedin),
                                    tooltip: "LinkedIn",
                                    iconSize: responsive.isMobile ? 24 : 28,
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        _launchUrl("https://x.com/WaleedAbozeid"),
                                    icon: const FaIcon(FontAwesomeIcons.xTwitter),
                                    tooltip: "Twitter",
                                    iconSize: responsive.isMobile ? 24 : 28,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: responsive.isMobile ? 0 : responsive.isTablet ? 32 : 48,
                          height: responsive.isMobile ? 32 : 0,
                        ),

                        // Contact Form
                        Expanded(
                          flex: responsive.isMobile ? 0 : 6,
                          child: FormBuilder(
                            key: _formKey,
                            child: Column(
                              children: [
                                // Hidden honeypot field to trap spam bots
                                Visibility(
                                  visible: false,
                                  maintainState: true,
                                  child: FormBuilderTextField(
                                    name: 'botcheck',
                                  ),
                                ),
                                FormBuilderTextField(
                                  name: 'name',
                                  decoration: InputDecoration(
                                    labelText: loc.translate('contact_name'),
                                    border: const OutlineInputBorder(),
                                  ),
                                  validator: FormBuilderValidators.required(),
                                ),
                                SizedBox(height: responsive.isMobile ? 12 : 16),
                                FormBuilderTextField(
                                  name: 'email',
                                  decoration: InputDecoration(
                                    labelText: loc.translate('contact_email'),
                                    border: const OutlineInputBorder(),
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.email(),
                                  ]),
                                ),
                                SizedBox(height: responsive.isMobile ? 12 : 16),
                                FormBuilderTextField(
                                  name: 'subject',
                                  decoration: InputDecoration(
                                    labelText: loc.translate('contact_subject'),
                                    border: const OutlineInputBorder(),
                                  ),
                                  validator: FormBuilderValidators.required(),
                                ),
                                SizedBox(height: responsive.isMobile ? 12 : 16),
                                FormBuilderTextField(
                                  name: 'message',
                                  decoration: InputDecoration(
                                    labelText: loc.translate('contact_message'),
                                    border: const OutlineInputBorder(),
                                  ),
                                  validator: FormBuilderValidators.required(),
                                  maxLines: responsive.isMobile ? 4 : 5,
                                ),
                                SizedBox(height: responsive.isMobile ? 24 : 32),
                                SizedBox(
                                  width: double.infinity,
                                  height: responsive.isMobile ? 48 : 50,
                                  child: ElevatedButton(
                                    onPressed: _isLoading ? null : _submitForm,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: _isLoading
                                        ? const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: Colors.white,
                                            ),
                                          )
                                        : Text(
                                            loc.translate('contact_submit'),
                                            style: TextStyle(
                                              fontSize: responsive.isMobile ? 16 : null,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _ContactItem({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          mainAxisSize: responsive.isMobile ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: responsive.isMobile 
              ? MainAxisAlignment.center 
              : MainAxisAlignment.start,
          children: [
            Icon(
              icon, 
              color: AppColors.primary,
              size: responsive.isMobile ? 20 : 24,
            ),
            SizedBox(width: responsive.isMobile ? 12 : 16),
            Flexible(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: responsive.isMobile ? 14 : null,
                ),
                textAlign: responsive.isMobile ? TextAlign.center : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
