import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/domain/repository.dart';
import 'package:test_task/presentation/features/single_post/bloc/single_post_event.dart';
import 'package:test_task/presentation/features/single_post/bloc/single_post_state.dart';
import 'package:test_task/domain/exceptions.dart';

class SinglePostBloc extends Bloc<SinglePostEvent, SinglePostState> {
  final Repository repository;

  SinglePostBloc({required this.repository}) : super(Loading()) {
    on<GetSinglePostEvent>(_mapGetPostEventToState);
  }

  Future<void> _mapGetPostEventToState(GetSinglePostEvent event, Emitter<SinglePostState> emit) async {
    emit(Loading());

    try {
      var post = await repository.getPostById(event.id);
      emit(Success(post: post));
    } on DataRetrieveException catch (error) {
        emit(Error(error: error));
    } on NoConnectionException catch (error) {
        emit(Error(error: error));
    } catch (error) {
      rethrow;
    }
  }
}
