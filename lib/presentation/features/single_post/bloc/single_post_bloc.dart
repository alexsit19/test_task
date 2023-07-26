import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/domain/repository.dart';
import 'package:test_task/presentation/features/single_post/bloc/single_post_event.dart';
import 'package:test_task/presentation/features/single_post/bloc/single_post_state.dart';
import 'package:test_task/presentation/features/posts/bloc/posts_state.dart';
import 'package:test_task/domain/exceptions.dart';

class SinglePostBloc extends Bloc<SinglePostEvent, SinglePostState> {
  final Repository repository;

  SinglePostBloc({required this.repository}) : super(const SinglePostState(loading: Loading.loading)) {
    on<GetPost>(_mapGetPostEventToState);
  }

  Future<void> _mapGetPostEventToState(GetPost event, Emitter<SinglePostState> emit) async {
    emit(state.copyWith(loading: Loading.loading));
    try {
      var post = await repository.getPostById(event.id);
      emit(state.copyWith(loading: Loading.loaded, post: post, error: null));
    } on DataRetrieveException catch (error) {
      emit(state.copyWith(loading: Loading.loaded, error: error));
    } on NoConnectionException catch (error) {
      emit(state.copyWith(loading: Loading.loaded, error: error));
    } on UnknownException catch (error) {
      (state.copyWith(loading: Loading.loaded, error: error));
    } catch (error) {
      rethrow;
    }
  }
}
