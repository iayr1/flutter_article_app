import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_textstyles.dart';
import '../../../../../core/constants/windows.dart';
import '../../../domain/entities/post.dart';
import 'delete_post_button_widget.dart';
import 'update_post_button_widget.dart';


class PostDetailWidget extends StatelessWidget {
  final Post post;

  const PostDetailWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 300),
          child: Text(
            post.title,
            style: AppTextStyles.heading4Bold.copyWith(
              color: AppColors.primaryBlue100, // Replaced deep indigo
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
        ),
        SizedBox(height: Window.getVerticalSize(16)),
        Divider(color: AppColors.neutral50),
        AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 300),
          child: Text(
            post.body,
            style: AppTextStyles.bodyRegular.copyWith(
              fontSize: Window.getFontSize(18),
              color: AppColors.neutral90,
            ),
          ),
        ),
        SizedBox(height: Window.getVerticalSize(16)),
        Divider(color: AppColors.neutral50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UpdatePostButtonWidget(post: post),
            SizedBox(width: Window.getHorizontalSize(16)),
            DeletePostButtonWidget(postId: post.id!),
          ],
        ),
      ],
    );
  }
}