import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/domain/exceptions.dart';
import 'package:test_task/presentation/features/posts/bloc/posts_event.dart';
import 'package:test_task/presentation/features/posts/bloc/posts_state.dart';
import 'package:test_task/domain/repository.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final Repository repository;

  PostsBloc({required this.repository}) : super(const PostsState(loading: Loading.loading)) {
    on<GetPosts>(_mapGetPostsEventToState);
  }

  Future<void> _mapGetPostsEventToState(GetPosts event, Emitter<PostsState> emit) async {
    emit(state.copyWith(loading: Loading.loading));
    try {
      var posts = await repository.getPosts();
      emit(state.copyWith(loading: Loading.loaded, posts: posts, error: null));
    } on DataRetrieveException catch (error) {
      emit(state.copyWith(loading: Loading.loaded, error: error));
    } on NoConnectionException catch (error) {
      emit(state.copyWith(loading: Loading.loaded, error: error));
    } catch (error) {
      rethrow;
    }
  }
}
