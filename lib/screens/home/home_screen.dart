import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/portfolio_controller.dart';
import '../../core/constants/colors.dart';
import '../../widgets/aurora_background.dart';
import 'hero_section.dart';
import '../about/about_section.dart';
import '../skills/skills_section.dart';
import '../experience/experience_section.dart';
import '../projects/projects_section.dart';
import '../contact/contact_section.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'dart:ui';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PortfolioController controller = Get.put(PortfolioController());
    bool isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: AppBar(
              backgroundColor: AppColors.background.withOpacity(0.6),
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'BK.',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.textHeading),
                ),
              ),
              actions: isMobile ? [] : [
                _buildNavItem('Home', controller.homeKey),
                _buildNavItem('About', controller.aboutKey),
                _buildNavItem('Experience', controller.experienceKey),
                _buildNavItem('Projects', controller.projectsKey),
                _buildNavItem('Skills', controller.skillsKey),
                //_buildNavItem('QA Journey', controller.qaKey),
                _buildNavItem('Contact', controller.contactKey),
                const SizedBox(width: 40),
              ],
            ),
          ),
        ),
      ),
      drawer: isMobile ? _buildDrawer(controller, context) : null,
      body: AuroraBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(key: controller.homeKey),
              AboutSection(key: controller.aboutKey),
              ExperienceSection(key: controller.experienceKey),
              ProjectsSection(key: controller.projectsKey),
              SkillsSection(key: controller.skillsKey),
              // QA Journey section placeholder (can be implemented as a separate component)
              Container(key: controller.qaKey, height: 1), 
              ContactSection(key: controller.contactKey),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, GlobalKey key) {
    final PortfolioController controller = Get.find<PortfolioController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () => controller.scrollToSection(key),
        child: Text(
          title,
          style: const TextStyle(color: AppColors.textBody, fontWeight: FontWeight.w500, fontSize: 15),
        ),
      ),
    );
  }

  Widget _buildDrawer(PortfolioController controller, BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background.withOpacity(0.9),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.surface),
            child: Text('Navigation', style: Theme.of(context).textTheme.titleLarge),
          ),
          _drawerItem('Home', controller.homeKey, controller),
          _drawerItem('About', controller.aboutKey, controller),
          _drawerItem('Experience', controller.experienceKey, controller),
          _drawerItem('Projects', controller.projectsKey, controller),
          _drawerItem('Skills', controller.skillsKey, controller),
          _drawerItem('QA Journey', controller.qaKey, controller),
          _drawerItem('Contact', controller.contactKey, controller),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, GlobalKey key, PortfolioController controller) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: AppColors.textBody)),
      onTap: () { Get.back(); controller.scrollToSection(key); },
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.blue.shade900, // Let Aurora background shine through
      child: Center(
        child: Column(
          children: [
            const Text(
              "Let's Build Something Amazing Together", 
              style: TextStyle(color: AppColors.textHeading, fontSize: 24, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 30),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 24,
              children: [
                _footerLink('balajikanna456@gmail.com'),
                _footerLink('LinkedIn'),
                _footerLink('Instagram'),
                _footerLink('Resume'),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              '© 2026 Balaji Kanna',
              style: TextStyle(color: AppColors.textBody, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _footerLink(String text) {
    return TextButton(
      onPressed: (){}, 
      child: Text(text, style: const TextStyle(color: AppColors.textBody, fontSize: 16))
    );
  }
}
