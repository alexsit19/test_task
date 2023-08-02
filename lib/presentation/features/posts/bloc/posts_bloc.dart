import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/domain/exceptions.dart';
import 'package:test_task/presentation/features/posts/bloc/posts_event.dart';
import 'package:test_task/presentation/features/posts/bloc/posts_state.dart';
import 'package:test_task/domain/repository.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final Repository repository;

  PostsBloc({required this.repository}) : super(Loading()) {
    on<GetPostsEvent>(_mapGetPostsEventToState);
  }

  Future<void> _mapGetPostsEventToState(GetPostsEvent event, Emitter<PostsState> emit) async {
    emit(Loading());
    try {
      var posts = await repository.getPosts();
      emit(Success(posts: posts));
    } on DataRetrieveException catch (error) {
      emit(Error(error: error));
    } on NoConnectionException catch (error) {
      emit(Error(error: error));
    } catch (error) {
      rethrow;
    }
  }
}
