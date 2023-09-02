import 'dart:io';

import 'package:bloc_pattern_2/bacik/202/service/comment_model.dart';
import 'package:bloc_pattern_2/bacik/202/service/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum _PostServicePaths { posts, comments }

enum _PostServiceQueryPaths { postId }

abstract class IPostService {
  Future<bool> addPostToService(PostModel model);
  Future<bool> updatePostToService(PostModel model, int id);
  Future<bool> deletePostToService(int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<List<CommentModel>?> fetchCommentsWithPostId(int postId);
}

class _DioService {
  final Dio dio =
      Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
}

class PostService implements IPostService {
  @override
  Future<bool> addPostToService(PostModel model) async {
    try {
      final response = await _DioService()
          .dio
          .post('/${_PostServicePaths.posts.name}', data: model);

      return (response.statusCode == HttpStatus.created);
    } catch (e) {
      _ShowDebug().showDebugError(e);
    }
    return false;
  }

  @override
  Future<bool> updatePostToService(PostModel model, int id) async {
    try {
      final response = await _DioService()
          .dio
          .put('/${_PostServicePaths.posts.name}/$id', data: model);

      return (response.statusCode == HttpStatus.ok);
    } catch (e) {
      _ShowDebug().showDebugError(e);
    }
    return false;
  }

  @override
  Future<bool> deletePostToService(int id) async {
    try {
      final response =
          await _DioService().dio.put('/${_PostServicePaths.posts.name}/$id');

      return (response.statusCode == HttpStatus.ok);
    } catch (e) {
      _ShowDebug().showDebugError(e);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response =
          await _DioService().dio.get('/${_PostServicePaths.posts.name}');

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      _ShowDebug().showDebugError(e);
    }
    return null;
  }

  @override
  Future<List<CommentModel>?> fetchCommentsWithPostId(int postId) async {
    try {
      final response = await _DioService().dio.get(
          '/${_PostServicePaths.comments.name}',
          queryParameters: {_PostServiceQueryPaths.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      _ShowDebug().showDebugError(e);
    }
    return null;
  }
}

class _ShowDebug {
  void showDebugError(Object e) {
    if (kDebugMode) {
      print('Error : $e');
    }
  }
}
