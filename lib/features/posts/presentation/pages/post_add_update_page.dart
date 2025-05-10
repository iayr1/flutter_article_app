import 'package:article/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_textstyles.dart';
import '../../../../core/constants/windows.dart';
import '../../../../core/util/snackbar_message.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/entities/post.dart';
import '../widgets/post_add_update_page/form_widget.dart';

class PostAddUpdatePage extends StatelessWidget {
  final Post? post;

  const PostAddUpdatePage({super.key, this.post});

  @override
  Widget build(BuildContext context) {
    Window().adaptDeviceScreenSize(view: WidgetsBinding.instance.window);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.chevron_left,
          color: AppColors.neutral10,
          size: Window.getSize(24),
        ),
        padding: Window.getPadding(all: 8),
      ),
      title: Text(
        post == null ? 'Add Post' : 'Update Post',
        style: AppTextStyles.titleBold.copyWith(
          color: AppColors.neutral10,
          fontSize: Window.getFontSize(18),
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryBlue100,
              AppColors.secondaryGreen100,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: Window.getPadding(all: 16.0),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Window.getHorizontalSize(600),
          ),
          child: Card(
            color: AppColors.neutral10, // White background for card
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Window.getRadiusSize(12)),
            ),
            child: Padding(
              padding: Window.getPadding(all: 16.0),
              child: BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
                listener: (BuildContext context, AddDeleteUpdatePostState state) {
                  if (state is AddDeleteUpdatePostLoaded) {
                    SnackBarMessage.showSuccessMessage(
                        message: state.message, context: context);
                    Navigator.of(context).pop();
                  } else if (state is AddDeleteUpdatePostError) {
                    SnackBarMessage.showErrorMessage(
                        message: state.message, context: context);
                  }
                },
                builder: (BuildContext context, AddDeleteUpdatePostState state) {
                  if (state is AddDeleteUpdatePostLoading) {
                    return const LoadingWidget();
                  }
                  return FormWidget(post: post);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}