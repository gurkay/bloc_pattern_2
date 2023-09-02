import 'dart:io';

import 'package:bloc_pattern_2/bacik/202/service/comment_get_lists.dart';
import 'package:bloc_pattern_2/bacik/202/service/post_model.dart';
import 'package:bloc_pattern_2/bacik/202/service/post_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ServiceViewLearn extends StatefulWidget {
  const ServiceViewLearn({super.key});

  @override
  State<ServiceViewLearn> createState() => _ServiceViewLearnState();
}

class _ServiceViewLearnState extends State<ServiceViewLearn> {
  List<PostModel>? _items;
  bool _isLoading = false;
  late final Dio _networkManager;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    fetchPostItemsAdvance();
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == HttpStatus.ok) {
      print(response);
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    } else if (response.statusCode == HttpStatus.notFound) {
      print('Not Found');
    }
    _changeLoading();
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();

    _items = await _postService.fetchPostItemsAdvance();

    _changeLoading();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()
        ],
      ),
      body: _items == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: _PostCard(item: _items?[index]),
                );
              },
            ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    super.key,
    required PostModel? item,
  }) : _item = item;

  final PostModel? _item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return CommentGetLists(postId: _item?.id);
                },
              ),
            );
          },
          title: Text(_item?.title ?? ''),
          subtitle: Text(_item?.body ?? ''),
        ),
      ),
    );
  }
}
