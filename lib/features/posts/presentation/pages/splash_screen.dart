import 'dart:async';
import 'package:flutter/material.dart';
import 'package:article/core/constants/app_colors.dart';
import 'package:article/core/constants/app_textstyles.dart';
import 'package:article/core/constants/windows.dart';
import 'package:article/features/posts/presentation/pages/posts_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const PostsPage(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryBlue100,
              AppColors.secondaryPurple100,
              AppColors.secondaryGreen100,
            ],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Icon (Replace with your custom icon)
                Icon(
                  Icons.article_rounded, // Default icon representing article
                  size: Window.getSize(80), // Adjust the size based on your design
                  color: AppColors.neutral10,
                ),
                SizedBox(height: Window.getVerticalSize(16)),
                // App Name
                Text(
                  'Article Hub', // App name
                  style: AppTextStyles.heading3Bold.copyWith(
                    color: AppColors.neutral10,
                    fontSize: Window.getFontSize(32), // Adjust size as needed
                  ),
                ),
                SizedBox(height: Window.getVerticalSize(8)),
                // Tagline or description
                Text(
                  'Discover, Read, and Share Articles',
                  style: AppTextStyles.bodyRegular.copyWith(
                    color: AppColors.neutral20,
                    fontSize: Window.getFontSize(16),
                  ),
                ),
                SizedBox(height: Window.getVerticalSize(24)),
                // Tap to continue prompt
              ],
            ),
          ),
        ),
      ),
    );
  }
}
