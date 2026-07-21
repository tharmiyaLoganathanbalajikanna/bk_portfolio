import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../core/constants/colors.dart';
import '../../widgets/animated_hover_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      constraints: const BoxConstraints(minHeight: 800),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 80,
      ),
      child: Center(
        child: _buildTextContent(context, isMobile),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hello 👋 I'm",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.secondary,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "BALAJI KANNA T L",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: isMobile ? 52 : 72,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 60,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'Flutter Developer',
                textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.primary,
                ),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'QA Engineer',
                textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.primary,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            "Building high-performance Flutter applications with beautiful UI, scalable architecture, and seamless user experiences.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 48),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            AnimatedHoverButton(
              text: 'Download Resume',
              icon: Icons.download,
              onPressed: () {},
            ),
            AnimatedHoverButton(
              text: 'Contact Me',
              isPrimary: false,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
