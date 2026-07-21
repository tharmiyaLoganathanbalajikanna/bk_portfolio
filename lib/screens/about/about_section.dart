import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../widgets/section_heading.dart';
import '../../widgets/glass_container.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(title: 'About Me'),
              const SizedBox(height: 60),
              GlassContainer(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2+ Years of Experience',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'I am a Software Engineer with 2+ years of experience in Flutter Development and Software Testing. I specialize in Flutter Mobile, Flutter Web, Responsive UI Development, REST APIs, SQLite, Supabase, Firebase, GetX State Management, BLE Integration, and Digital Signage Solutions.\n\nRecently, I have expanded my expertise into Manual Testing, API Testing, Functional Testing, Test Case Design, Bug Reporting, Regression Testing, and QA Processes.\n\nI enjoy building scalable applications and ensuring software quality through efficient testing methodologies.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.8),
                    ),
                    const SizedBox(height: 40),
                    Wrap(
                      spacing: 40,
                      runSpacing: 20,
                      children: [
                        _stat(context, '2+', 'Years Experience'),
                        _stat(context, '5+', 'Enterprise Projects'),
                        _stat(context, '100%', 'Code Quality'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stat(BuildContext context, String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
          ).createShader(bounds),
          child: Text(
            value,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 48),
          ),
        ),
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
