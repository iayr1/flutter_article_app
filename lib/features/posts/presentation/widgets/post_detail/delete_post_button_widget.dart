import 'package:article/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_textstyles.dart';
import '../../../../../core/constants/windows.dart';
import '../../../../../core/util/snackbar_message.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../pages/posts_page.dart';
import 'delete_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DeletePostButtonWidget extends StatelessWidget {
  final int postId;

  const DeletePostButtonWidget({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: 1.0,
      duration: const Duration(milliseconds: 200),
      child: ElevatedButton.icon(
        onPressed: () => deleteDialog(context),
        icon: Icon(
          Icons.delete,
          size: Window.getSize(20),
          color: AppColors.neutral10,
        ),
        label: Text(
          'Delete',
          style: AppTextStyles.bodyBold.copyWith(
            color: AppColors.neutral10,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryPurple100, // Replaced redAccent
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

  void deleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
          listener: (BuildContext context, AddDeleteUpdatePostState state) {
            if (state is AddDeleteUpdatePostLoaded) {
              SnackBarMessage.showSuccessMessage(
                message: state.message,
                context: context,
              );
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const PostsPage(),
                ),
                    (route) => false,
              );
            } else if (state is AddDeleteUpdatePostError) {
              SnackBarMessage.showErrorMessage(
                message: state.message,
                context: context,
              );
              Navigator.of(context).pop();
            }
          },
          builder: (BuildContext context, AddDeleteUpdatePostState state) {
            if (state is AddDeleteUpdatePostLoading) {
              return AlertDialog(
                content: const LoadingWidget(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Window.getRadiusSize(12)),
                ),
              );
            }
            return DeleteDialogWidget(postId: postId);
          },
        );
      },
    );
  }
}