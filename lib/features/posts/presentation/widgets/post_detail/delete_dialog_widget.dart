import 'package:article/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_textstyles.dart';
import '../../../../../core/constants/windows.dart';


class DeleteDialogWidget extends StatelessWidget {
  final int postId;

  const DeleteDialogWidget({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Window.getRadiusSize(12)),
      ),
      backgroundColor: AppColors.neutral10, // White background, replaced Colors.white
      title: Text(
        'Delete Post',
        style: AppTextStyles.titleBold.copyWith(
          color: AppColors.primaryBlue100, // Replaced Color(0xFF1A237E)
          fontSize: Window.getFontSize(18),
        ),
      ),
      content: Text(
        'Are you sure you want to delete this post?',
        style: AppTextStyles.bodyRegular.copyWith(
          color: AppColors.neutral90, // Dark gray for readability
          fontSize: Window.getFontSize(16),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            'Cancel',
            style: AppTextStyles.bodyRegular.copyWith(
              color: AppColors.neutral50, // Gray, replaced Colors.grey[600]
              fontSize: Window.getFontSize(14),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<AddDeleteUpdatePostBloc>(context).add(
              DeletePostEvent(postId: postId),
            );
          },
          child: Text(
            'Delete',
            style: AppTextStyles.bodySemiBold.copyWith(
              color: Colors.redAccent, // Replaced Colors.redAccent
              fontSize: Window.getFontSize(14),
            ),
          ),
        ),
      ],
    );
  }
}