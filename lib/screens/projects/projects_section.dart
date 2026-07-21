import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/colors.dart';
import '../../widgets/section_heading.dart';
import '../../widgets/glass_container.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/project.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProjectsSection extends StatelessWidget {
  final PortfolioController controller = Get.find<PortfolioController>();

  ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
    int crossAxisCount = isMobile ? 1 : 2;
    if (ResponsiveBreakpoints.of(context).isDesktop) crossAxisCount = 3;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(title: 'Projects'),
              const SizedBox(height: 60),
              AnimationLimiter(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: controller.projects.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      columnCount: crossAxisCount,
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: _ProjectCardHoverWrapper(project: controller.projects[index]),
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

class _ProjectCardHoverWrapper extends StatefulWidget {
  final Project project;
  const _ProjectCardHoverWrapper({required this.project});

  @override
  State<_ProjectCardHoverWrapper> createState() => _ProjectCardHoverWrapperState();
}

class _ProjectCardHoverWrapperState extends State<_ProjectCardHoverWrapper> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()..scale(_isHovered ? 1.03 : 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: _isHovered
              ? [BoxShadow(color: AppColors.primary.withOpacity(0.4), blurRadius: 30, offset: const Offset(0, 10))]
              : [],
        ),
        child: GlassContainer(
          padding: const EdgeInsets.all(24),
          enableHover: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    color: AppColors.surface,
                    width: double.infinity,
                    child: Center(
                      child: Icon(Icons.image, size: 60, color: AppColors.textBody.withOpacity(0.3)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                widget.project.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.project.technologies.take(3).map((t) => Text(
                  t,
                  style: const TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.bold),
                )).toList(),
              ),
              const SizedBox(height: 16),
              Expanded(
                flex: 3,
                child: Text(
                  widget.project.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.visibility, size: 16),
                    label: const Text('Live Demo'),
                    style: TextButton.styleFrom(foregroundColor: AppColors.secondary),
                    onPressed: () {
                       if(widget.project.liveDemoUrl != null) launchUrl(Uri.parse(widget.project.liveDemoUrl!));
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.github, size: 20),
                    color: AppColors.textBody,
                    onPressed: () {
                       if(widget.project.githubUrl != null) launchUrl(Uri.parse(widget.project.githubUrl!));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
