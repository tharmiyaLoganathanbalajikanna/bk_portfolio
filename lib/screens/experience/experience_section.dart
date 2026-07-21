import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/colors.dart';
import '../../widgets/section_heading.dart';
import '../../widgets/glass_container.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/experience.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ExperienceSection extends StatelessWidget {
  ExperienceSection({super.key});
  final PortfolioController controller = Get.find<PortfolioController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(title: 'Experience'),
              const SizedBox(height: 60),
              AnimationLimiter(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.experiences.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 600),
                      child: SlideAnimation(
                        verticalOffset: 60.0,
                        child: FadeInAnimation(
                          child: _TimelineItem(
                            exp: controller.experiences[index],
                            isLast: index == controller.experiences.length - 1,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final Experience exp;
  final bool isLast;
  const _TimelineItem({required this.exp, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline left column
          Column(
            children: [
              // Glowing dot
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.5),
                      blurRadius: 12,
                      spreadRadius: 3,
                    )
                  ],
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary.withOpacity(0.8),
                          AppColors.accent.withOpacity(0.2),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 24),
          // Card content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: GlassContainer(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exp.duration,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(exp.role, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 4),
                    Text(
                      exp.company,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.accent,
                          ),
                    ),
                    if (exp.projects.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      Text('Projects:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.textBody, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: exp.projects
                            .map((p) => Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                                  ),
                                  child: Text(p,
                                      style: const TextStyle(
                                          color: AppColors.primary, fontSize: 13, fontWeight: FontWeight.w600)),
                                ))
                            .toList(),
                      ),
                    ],
                    if (exp.achievements.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      ...exp.achievements.map((a) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.arrow_forward_ios, color: AppColors.primary, size: 14),
                                const SizedBox(width: 8),
                                Expanded(
                                    child: Text(a, style: Theme.of(context).textTheme.bodyMedium)),
                              ],
                            ),
                          )),
                    ],
                    if (exp.responsibilities.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      Text('Responsibilities:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.textBody, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: exp.responsibilities
                            .map((r) => Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: AppColors.accent.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: AppColors.accent.withOpacity(0.3)),
                                  ),
                                  child: Text(r,
                                      style: const TextStyle(
                                          color: AppColors.accent, fontSize: 12, fontWeight: FontWeight.w600)),
                                ))
                            .toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
