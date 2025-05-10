import 'package:article/core/error/failures.dart';
import 'package:article/core/strings/messages.dart';
import 'package:article/features/posts/domain/entities/post.dart';
import 'package:article/features/posts/domain/usecases/add_post.dart';
import 'package:article/features/posts/domain/usecases/delete_post.dart';
import 'package:article/features/posts/domain/usecases/update_post.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddPostUseCase addPost;
  final UpdatePostUseCase updatePost;
  final DeletePostUseCase deletePost;

  AddDeleteUpdatePostBloc({
    required this.addPost,
    required this.updatePost,
    required this.deletePost,
  }) : super(AddDeleteUpdatePostInitial()) {
    on<AddPostEvent>(_onAddPost);
    on<UpdatePostEvent>(_onUpdatePost);
    on<DeletePostEvent>(_onDeletePost);
  }

  Future<void> _onAddPost(
      AddPostEvent event,
      Emitter<AddDeleteUpdatePostState> emit,
      ) async {
    emit(AddDeleteUpdatePostLoading());
    final result = await addPost(event.post);
    emit(_mapResultToState(result, ADD_SUCCESS_MESSAGE));
  }

  Future<void> _onUpdatePost(
      UpdatePostEvent event,
      Emitter<AddDeleteUpdatePostState> emit,
      ) async {
    emit(AddDeleteUpdatePostLoading());
    final result = await updatePost(event.post);
    emit(_mapResultToState(result, UPDATE_SUCCESS_MESSAGE));
  }

  Future<void> _onDeletePost(
      DeletePostEvent event,
      Emitter<AddDeleteUpdatePostState> emit,
      ) async {
    emit(AddDeleteUpdatePostLoading());
    final result = await deletePost(event.postId);
    emit(_mapResultToState(result, DELETE_SUCCESS_MESSAGE));
  }

  AddDeleteUpdatePostState _mapResultToState(
      Either<Failure, Unit> result,
      String successMessage,
      ) {
    return result.fold(
          (failure) => AddDeleteUpdatePostError(message: _mapFailureToMessage(failure)),
          (_) => AddDeleteUpdatePostLoaded(message: successMessage),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return UNEXPECTED_ERROR;
    }
  }
}
