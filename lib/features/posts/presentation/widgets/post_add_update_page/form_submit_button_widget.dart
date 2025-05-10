import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_textstyles.dart';
import '../../../../../core/constants/windows.dart';

class FormSubmitButtonWidget extends StatelessWidget {
  final bool isEditMode;
  final VoidCallback onSubmit;

  const FormSubmitButtonWidget({
    super.key,
    required this.isEditMode,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedScale(
      scale: 1.0,
      duration: const Duration(milliseconds: 200),
      child: ElevatedButton.icon(
        onPressed: onSubmit,
        icon: Icon(
          isEditMode ? Icons.update : Icons.add,
          size: Window.getSize(20), // Responsive icon size
          color: AppColors.neutral10, // White icon for contrast
        ),
        label: Text(
          isEditMode ? 'Update' : 'Submit',
          style: AppTextStyles.bodySemiBold.copyWith(
            color: AppColors.neutral10,
            fontSize: Window.getFontSize(14),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryGreen100,
          padding: Window.getSymmetricPadding(
            horizontal: 24,
            vertical: 16,
          ), // Responsive padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Window.getRadiusSize(12)),
          ),
          elevation: 2, // Subtle shadow for depth
        ),
      ),
    );
  }
}