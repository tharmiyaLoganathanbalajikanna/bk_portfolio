import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/project.dart';
import '../models/experience.dart';
import '../models/skill.dart';

class PortfolioController extends GetxController {
  // Navigation State
  final RxInt currentSectionIndex = 0.obs;

  // Theme State
  final RxBool isDarkMode = true.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  // Navigation Keys
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey qaKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  final List<Experience> experiences = [
    Experience(
      company: 'Thought Mobile Technologies',
      role: 'Software Engineer',
      duration: 'April 2024 – April 2025',
      projects: ['Veromatic'],
      achievements: [
        'Developed scalable Flutter applications.',
        'Built responsive user interfaces.',
        'Implemented BLE communication.',
        'Integrated APIs.'
      ],
    ),
    Experience(
      company: 'Thought Mobile Technologies',
      role: 'Software Engineer',
      duration: 'April 2025 – June 2026',
      projects: ['VChek', 'Digital Signage Web', 'MDM Web', 'Safe Digi Wallet'],
    ),
    Experience(
      company: 'Current Position',
      role: 'QA Engineer',
      duration: 'June 2026 – Present',
      responsibilities: [
        'Manual Testing',
        'Functional Testing',
        'Regression Testing',
        'Smoke Testing',
        'API Testing using Postman',
        'Test Case Design',
        'Bug Reporting',
        'JIRA',
        'Agile Methodology',
        'Cross Browser Testing',
        'Mobile Testing',
        'Flutter Application Testing'
      ],
    ),
  ];

  final List<Project> projects = [
    Project(
      title: 'Veromatic',
      description: 'Vehicle inspection application.',
      imageUrl: 'assets/images/project1.png',
      technologies: ['Flutter', 'REST APIs', 'GetX', 'BLE', 'SQLite'],
      features: ['Offline Support', 'API Integration', 'Responsive UI'],
    ),
    Project(
      title: 'VChek',
      description: 'Vehicle verification platform.',
      imageUrl: 'assets/images/project2.png',
      technologies: ['Flutter', 'Supabase', 'GetX'],
      features: ['Camera', 'Image Upload', 'Forms', 'Reports'],
    ),
    Project(
      title: 'Digital Signage Web',
      description: 'Media upload and scheduling dashboard.',
      imageUrl: 'assets/images/project3.png',
      technologies: ['Flutter Web'],
      features: ['Media Upload', 'Playlist', 'Scheduling', 'Dashboard', 'Device Monitoring'],
    ),
    Project(
      title: 'MDM Web',
      description: 'Mobile Device Management Web Dashboard.',
      imageUrl: 'assets/images/project4.png',
      technologies: ['Flutter Web'],
      features: ['Device Management', 'Remote Commands', 'Analytics'],
    ),
    Project(
      title: 'Safe Digi Wallet',
      description: 'Secure digital wallet mobile app.',
      imageUrl: 'assets/images/project5.png',
      technologies: ['Flutter Mobile', 'Secure APIs'],
      features: ['Authentication', 'Wallet', 'QR Payments'],
    ),
  ];

  final List<Skill> testingSkills = [
    Skill(name: 'Manual Testing'),
    Skill(name: 'API Testing'),
    Skill(name: 'Regression Testing'),
    Skill(name: 'Smoke Testing'),
    Skill(name: 'Sanity Testing'),
    Skill(name: 'Functional Testing'),
    Skill(name: 'Test Cases'),
    Skill(name: 'Bug Reporting'),
    Skill(name: 'JIRA'),
    Skill(name: 'Postman'),
    Skill(name: 'Agile'),
    Skill(name: 'Automation Basics'),
  ];
}
