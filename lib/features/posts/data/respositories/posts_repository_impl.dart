import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';
import '../models/post_model.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/posts_repisitory.dart';
import 'package:dartz/dartz.dart';

typedef AddOrUpdateOrDeletePost = Future<Unit> Function();

class PostsRepositoryImpl implements PostsRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  PostsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    try {
      final remotePosts = await remoteDataSource.getAllPosts();
      localDataSource.cachePosts(remotePosts);
      return Right(remotePosts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    final postModel = PostModel(
      title: post.title,
      body: post.body,
    );

    return await _getMessage(() => remoteDataSource.addPost(postModel));
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    return await _getMessage(() => remoteDataSource.deletePost(postId));
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );

    return await _getMessage(() => remoteDataSource.updatePost(postModel));
  }

  Future<Either<Failure, Unit>> _getMessage(
      AddOrUpdateOrDeletePost addOrDeleteOrUpdate,
      ) async {
    try {
      await addOrDeleteOrUpdate();
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    } on TimeoutException {
      return Left(TimeoutFailure());
    } on ConnectionException {
      return Left(ConnectionFailure());
    } on Exception catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
