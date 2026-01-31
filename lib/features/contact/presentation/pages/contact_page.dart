import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/l10n/app_localizations.dart';

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

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Message sent successfully!'),
          ), // Localize later
        );
        _formKey.currentState?.reset();
      }
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
    final loc = AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 768;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              Text(
                loc.translate('contact_title'),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 48),

              Flex(
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Contact Info
                  Expanded(
                    flex: isDesktop ? 4 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ContactItem(
                          icon: Icons.email,
                          label: "waleedabozeid995@gmail.com",
                          onTap: () =>
                              _launchUrl("mailto:waleed.abouzeid@email.com"),
                        ),
                        const SizedBox(height: 24),
                        _ContactItem(
                          icon: Icons.phone,
                          label: "+20 1030649525",
                          onTap: () => _launchUrl("tel:+200000000000"),
                        ),
                        const SizedBox(height: 24),
                        const _ContactItem(
                          icon: Icons.location_on,
                          label: "Egypt",
                        ),
                        const SizedBox(height: 48),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            IconButton(
                              onPressed: () => _launchUrl("https://github.com"),
                              icon: const FaIcon(FontAwesomeIcons.github),
                              tooltip: "GitHub",
                            ),
                            IconButton(
                              onPressed: () =>
                                  _launchUrl("https://linkedin.com"),
                              icon: const FaIcon(FontAwesomeIcons.linkedin),
                              tooltip: "LinkedIn",
                            ),
                            IconButton(
                              onPressed: () =>
                                  _launchUrl("https://twitter.com"),
                              icon: const FaIcon(FontAwesomeIcons.twitter),
                              tooltip: "Twitter",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  if (isDesktop) const SizedBox(width: 48),
                  if (!isDesktop) const SizedBox(height: 48),

                  // Contact Form
                  Expanded(
                    flex: isDesktop ? 6 : 0,
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'name',
                            decoration: InputDecoration(
                              labelText: loc.translate('contact_name'),
                              border: const OutlineInputBorder(),
                            ),
                            validator: FormBuilderValidators.required(),
                          ),
                          const SizedBox(height: 16),
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
                          const SizedBox(height: 16),
                          FormBuilderTextField(
                            name: 'subject',
                            decoration: InputDecoration(
                              labelText: loc.translate('contact_subject'),
                              border: const OutlineInputBorder(),
                            ),
                            validator: FormBuilderValidators.required(),
                          ),
                          const SizedBox(height: 16),
                          FormBuilderTextField(
                            name: 'message',
                            decoration: InputDecoration(
                              labelText: loc.translate('contact_message'),
                              border: const OutlineInputBorder(),
                            ),
                            validator: FormBuilderValidators.required(),
                            maxLines: 5,
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _submitForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                              ),
                              child: _isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(loc.translate('contact_submit')),
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
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 16),
          Text(label, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
