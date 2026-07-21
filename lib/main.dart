import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/breakpoints.dart';
import 'core/constants/colors.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Balaji Kanna | Flutter Developer & QA Engineer',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Container(
        color: AppColors.background,
        child: ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: AppBreakpoints.mobile, name: MOBILE),
            const Breakpoint(start: AppBreakpoints.mobile + 1, end: AppBreakpoints.tablet, name: TABLET),
            const Breakpoint(start: AppBreakpoints.tablet + 1, end: AppBreakpoints.laptop, name: 'LAPTOP'),
            const Breakpoint(start: AppBreakpoints.laptop + 1, end: AppBreakpoints.desktop, name: DESKTOP),
          ],
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
