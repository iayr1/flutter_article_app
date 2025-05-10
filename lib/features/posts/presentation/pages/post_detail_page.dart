import 'package:flutter/material.dart';
import '../../domain/entities/post.dart';
import '../widgets/post_detail/post_detail_widget.dart';
import '../../../../core/constants/app_colors.dart'; // Adjust path as needed
import '../../../../core/constants/app_textstyles.dart'; // Adjust path as needed
import '../../../../core/constants/windows.dart'; // Adjust path as needed

class PostDetailPage extends StatelessWidget {
  final Post post;

  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context); // Context is now defined
        },
        icon: Icon(
          Icons.chevron_left,
          color: AppColors.neutral10, // White icon for contrast
          size: Window.getSize(24), // Responsive icon size
        ),
        padding: Window.getPadding(all: 8), // Responsive padding
      ),
      title: Text(
        'Post Detail',
        style: AppTextStyles.titleBold.copyWith(
          color: AppColors.neutral10, // White text for contrast
          fontSize: Window.getFontSize(18),
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryBlue100, // Replaced Color(0xFF1A237E)
              AppColors.secondaryGreen100, // Replaced Color(0xFF26A69A)
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
              child: PostDetailWidget(post: post),
            ),
          ),
        ),
      ),
    );
  }
}