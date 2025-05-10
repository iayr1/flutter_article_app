import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_textstyles.dart';
import '../../../../../core/constants/windows.dart';

class MessageDisplayWidget extends StatelessWidget {
  final String message;

  const MessageDisplayWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Window.getVerticalSize(812 / 3), // Responsive height (1/3 of design height)
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: AppTextStyles.heading4Medium.copyWith(
              color: AppColors.secondaryPurple100, // Replaced redAccent with purple
              fontSize: Window.getFontSize(24), // Responsive font size
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}