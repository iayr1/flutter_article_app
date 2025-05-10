import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/entities/post.dart';
import '../bloc/posts/posts_bloc.dart';
import '../widgets/posts_page/message_display_widget.dart';
import '../widgets/posts_page/posts_list_widge.dart';
import 'post_add_update_page.dart';
import '../../../../core/constants/app_colors.dart'; // Adjust path as needed
import '../../../../core/constants/app_textstyles.dart'; // Adjust path as needed
import '../../../../core/constants/windows.dart'; // Adjust path as needed

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Post> _allPosts = [];
  List<Post> _filteredPosts = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostsBloc>(context).add(GetAllPostsEvent());
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPosts = _allPosts.where((post) {
        return post.title.toLowerCase().contains(query) ||
            post.body.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize Window for responsive sizing
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: _buildAppBar(context), // Pass context to _buildAppBar
        body: _buildBody(),
        floatingActionButton: _buildFloatingBtn(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Posts',
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
    return Padding(
      padding: Window.getPadding(all: 16.0),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: TextField(
              controller: _searchController,
              style: AppTextStyles.bodyRegular.copyWith(
                color: AppColors.neutral90, // Dark text for readability
                fontSize: Window.getFontSize(16),
              ),
              decoration: InputDecoration(
                hintText: 'Search by title or body...',
                hintStyle: AppTextStyles.bodyRegular.copyWith(
                  color: AppColors.neutral50, // Gray hint text
                  fontSize: Window.getFontSize(16),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.secondaryGreen100, // Replaced Color(0xFF26A69A)
                  size: Window.getSize(20),
                ),
                filled: true,
                fillColor: AppColors.neutral10, // White background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Window.getRadiusSize(12)),
                  borderSide: BorderSide.none,
                ),
                contentPadding: Window.getPadding(all: 12),
              ),
            ),
          ),
          SizedBox(height: Window.getVerticalSize(16.0)),
          Expanded(
            child: BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) {
                if (state is PostsLoading) {
                  return const LoadingWidget();
                } else if (state is PostsLoaded) {
                  _allPosts = state.posts;
                  final postsToShow = _searchController.text.isEmpty
                      ? _allPosts
                      : _filteredPosts;

                  if (postsToShow.isEmpty) {
                    return Center(
                      child: Lottie.asset(
                        'assets/lottie/emptyContent.json', // Make sure to include your animation file in assets
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () => _onRefresh(context),
                    color: AppColors.secondaryGreen100, // Replaced Color(0xFF26A69A)
                    child: PostsListWidget(posts: postsToShow),
                  );
                } else if (state is PostsError) {
                  return MessageDisplayWidget(state.message);
                }
                return const LoadingWidget();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PostAddUpdatePage(),
          ),
        );
      },
      tooltip: 'Add Post',
      backgroundColor: AppColors.primaryBlue100, // Primary color for FAB
      child: Icon(
        Icons.add,
        color: AppColors.neutral10, // White icon for contrast
        size: Window.getSize(24),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(GetAllPostsEvent());
  }
}