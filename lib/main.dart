import 'package:article/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:article/features/posts/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_theme.dart';
import 'core/constants/windows.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Window().adaptDeviceScreenSize(view: WidgetsBinding.instance.window);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<PostsBloc>()..add(GetAllPostsEvent()),
        ),
        BlocProvider(create: (_) => locator<AddDeleteUpdatePostBloc>()),
      ],
      child: MaterialApp(
        title: 'POST APP',
        theme: appTheme,
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
