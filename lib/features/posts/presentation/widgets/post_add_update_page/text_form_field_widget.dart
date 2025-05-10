import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_textstyles.dart';
import '../../../../../core/constants/windows.dart';


class TextFormFieldWidget extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final bool multiLine;

  const TextFormFieldWidget({
    super.key,
    required this.name,
    required this.controller,
    required this.multiLine,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Window.getSymmetricPadding(vertical: 8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: name,
            labelStyle: AppTextStyles.bodyRegular.copyWith(
              color: AppColors.neutral50, // Gray label for subtle contrast
              fontSize: Window.getFontSize(16),
            ),
            filled: true,
            fillColor: AppColors.neutral10, // White background, replaced Colors.white
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Window.getRadiusSize(12)),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Window.getRadiusSize(12)),
              borderSide: BorderSide(color: AppColors.neutral30, width: 1), // Subtle border
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Window.getRadiusSize(12)),
              borderSide: BorderSide(color: AppColors.secondaryGreen100, width: 2), // Green focus
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Window.getRadiusSize(12)),
              borderSide: BorderSide(color: AppColors.primaryBlue10, width: 1), // Red for errors
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Window.getRadiusSize(12)),
              borderSide: BorderSide(color: AppColors.primaryBlue10, width: 2),
            ),
            alignLabelWithHint: true,
            contentPadding: Window.getPadding(all: 12),
          ),
          style: AppTextStyles.bodyRegular.copyWith(
            color: AppColors.neutral90, // Dark text for readability
            fontSize: Window.getFontSize(16),
          ),
          maxLines: multiLine ? 5 : 1,
          keyboardType: multiLine ? TextInputType.multiline : TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$name cannot be empty';
            }
            return null;
          },
        ),
      ),
    );
  }
}