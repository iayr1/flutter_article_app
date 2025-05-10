import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_textstyles.dart';
import '../../../../../core/constants/windows.dart';
import '../../../domain/entities/post.dart';
import '../../pages/post_add_update_page.dart';
import 'package:flutter/material.dart';


class UpdatePostButtonWidget extends StatelessWidget {
  final Post post;

  const UpdatePostButtonWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: 1.0,
      duration: const Duration(milliseconds: 200),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PostAddUpdatePage(post: post),
            ),
          );
        },
        icon: Icon(
          Icons.edit,
          size: Window.getSize(20),
          color: AppColors.neutral10,
        ),
        label: Text(
          'Edit',
          style: AppTextStyles.bodyBold.copyWith(
            color: AppColors.neutral10,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryGreen100, // Replaced teal color
          foregroundColor: AppColors.neutral10,
          padding: Window.getSymmetricPadding(
            horizontal: 16,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Window.getRadiusSize(12)),
          ),
        ),
      ),
    );
  }
}