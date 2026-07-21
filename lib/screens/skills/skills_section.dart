import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../widgets/section_heading.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  final List<String> skills = [
    'Flutter', 'Dart', 'Firebase', 'Supabase', 'SQLite', 'REST API',
    'GetX', 'BLE', 'Git', 'GitHub', 'Figma', 'Android', 'QA Testing'
  ];

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
              const SectionHeading(title: 'Skills'),
              const SizedBox(height: 60),
              AnimationLimiter(
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 500),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: skills.map((skill) => SkillPill(skill: skill)).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillPill extends StatefulWidget {
  final String skill;
  const SkillPill({super.key, required this.skill});
  @override
  State<SkillPill> createState() => _SkillPillState();
}

class _SkillPillState extends State<SkillPill> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.primary : AppColors.glassBackground,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: _isHovered ? AppColors.secondary : AppColors.glassBorder),
          boxShadow: _isHovered
              ? [BoxShadow(color: AppColors.primary.withOpacity(0.5), blurRadius: 12, spreadRadius: 2)]
              : [],
        ),
        child: Text(
          widget.skill,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: _isHovered ? Colors.white : AppColors.textBody,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
