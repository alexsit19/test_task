import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/data/post_repository.dart';
import 'package:test_task/presentation/features/single_post/bloc/single_post_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:test_task/presentation/widgets/single_post_content.dart';
import 'package:test_task/utils.dart';
import 'package:test_task/presentation/widgets/center_progress_indicator.dart';
import 'package:test_task/presentation/widgets/error_page.dart';
import 'package:test_task/presentation/features/single_post/bloc/single_post_event.dart';
import 'package:test_task/presentation/features/single_post/bloc/single_post_state.dart';

class SinglePostScreen extends StatefulWidget {
  const SinglePostScreen({Key? key}) : super(key: key);

  @override
  State<SinglePostScreen> createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {
  var appBarTitleText = const Text("");

  @override
  Widget build(BuildContext context) {
    final postId = int.tryParse(ModalRoute.of(context)!.settings.arguments.toString());
    return Scaffold(
      appBar: AppBar(
        title: appBarTitleText,
      ),
      body: BlocProvider(
        create: (_) =>
            SinglePostBloc(repository: PostRepository(httpClient: http.Client()))..add(GetSinglePostEvent(id: postId)),
        child: BlocListener<SinglePostBloc, SinglePostState>(
          listener: (context, state) {
            if (state is Error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(context.translateException(state.error)),
                ),
              );
            }
          },
          child: BlocBuilder<SinglePostBloc, SinglePostState>(
            builder: (context, state) {
              if (state is Success) {
                Future.delayed(
                  Duration.zero,
                  () {
                    setState(
                      () {
                        appBarTitleText = Text(state.post?.title ?? "");
                      },
                    );
                  },
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: switch (state) {
                  Loading() => const CenterProgressIndicator(),
                  Success() => SinglePostContent(post: state.post),
                  Error() => ErrorPage(
                      action: () {
                        context.read<SinglePostBloc>().add(GetSinglePostEvent(id: postId));
                      },
                    ),
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
