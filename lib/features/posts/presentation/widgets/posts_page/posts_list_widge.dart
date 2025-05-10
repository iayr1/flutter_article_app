import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_textstyles.dart';
import '../../../../../core/constants/windows.dart';
import '../../../domain/entities/post.dart';
import '../../pages/post_detail_page.dart';
import 'package:flutter/material.dart';


class PostsListWidget extends StatelessWidget {
  final List<Post> posts;

  const PostsListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 300),
          child: Card(
            elevation: 2,
            color: AppColors.neutral10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Window.getRadiusSize(8)),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.secondaryGreen100,
                foregroundColor: AppColors.neutral10,
                radius: Window.getSize(20),
                child: Text(
                  post.id.toString(),
                  style: AppTextStyles.captionBold.copyWith(
                    color: AppColors.neutral10,
                  ),
                ),
              ),
              title: Text(
                post.title,
                style: AppTextStyles.titleBold.copyWith(
                  color: AppColors.neutral90,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                post.body,
                style: AppTextStyles.bodyRegular.copyWith(
                  color: AppColors.neutral70,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              contentPadding: Window.getPadding(all: 16),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PostDetailPage(post: post),
                  ),
                );
              },
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: Window.getVerticalSize(8));
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}