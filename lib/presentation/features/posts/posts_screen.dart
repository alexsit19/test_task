import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/data/post_repository.dart';
import 'package:test_task/presentation/features/posts/bloc/posts_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:test_task/presentation/features/posts/bloc/posts_event.dart';
import 'package:test_task/presentation/features/posts/bloc/posts_state.dart';
import 'package:test_task/presentation/widgets/center_progress_indicator.dart';
import 'package:test_task/presentation/widgets/posts_list.dart';
import 'package:test_task/utils.dart';
import 'package:test_task/presentation/widgets/error_page.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
      ),
      body: BlocProvider(
        create: (_) => PostsBloc(repository: PostRepository(httpClient: http.Client()))..add(GetPosts()),
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            Widget child = const CenterProgressIndicator();
            if (state.posts.isNotEmpty) {
              child = PostsList(posts: state.posts);
            }
            if (state.error != null) {
              child = const ErrorPage();
              var snackBar = makeSnackBar(
                  error: context.translateException(state.error),
                  action: () {
                    context.read<PostsBloc>().add(GetPosts());
                  });
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            );
          },
        ),
      ),
    );
  }
}
