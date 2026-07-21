import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/colors.dart';
import '../../widgets/section_heading.dart';
import '../../widgets/glass_container.dart';
import '../../widgets/animated_hover_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SectionHeading(title: 'Contact Me'),
              const SizedBox(height: 20),
              Text(
                "Have a project in mind? Let's talk.",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              GlassContainer(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    _buildTextField(label: 'Name', icon: Icons.person_outline),
                    const SizedBox(height: 20),
                    _buildTextField(label: 'Email', icon: Icons.email_outlined),
                    const SizedBox(height: 20),
                    _buildTextField(label: 'Message', icon: Icons.message_outlined, maxLines: 5),
                    const SizedBox(height: 32),
                    AnimatedHoverButton(
                      text: 'Send Message',
                      icon: Icons.send,
                      onPressed: () => launchUrl(Uri.parse('mailto:balajikanna456@gmail.com')),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 30,
                runSpacing: 16,
                children: [
                  _contactDetail(Icons.email_outlined, 'balajikanna456@gmail.com'),
                  _contactDetail(Icons.phone_outlined, '+91 6369364630'),
                  _contactDetail(Icons.location_on_outlined, 'Bangalore, India'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required IconData icon, int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      style: const TextStyle(color: AppColors.textHeading),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.textBody),
        prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.glassBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.glassBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }

  Widget _contactDetail(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: AppColors.textBody, fontSize: 15)),
      ],
    );
  }
}
