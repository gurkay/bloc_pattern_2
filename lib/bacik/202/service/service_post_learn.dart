import 'dart:io';

import 'package:bloc_pattern_2/bacik/202/service/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  bool _isLoading = false;
  late final Dio _networkManager;
  String? _successful;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addPostToService(PostModel model) async {
    final response = await _networkManager.post('/posts', data: model);
    _changeLoading();
    if (response.statusCode == HttpStatus.created) {
      setState(() {
        _successful = 'Basarili';
      });
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_successful ?? ''),
        actions: [
          _isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: _bodyController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Body'),
          ),
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
            autofillHints: [AutofillHints.creditCardNumber],
            decoration: InputDecoration(labelText: 'UserId'),
          ),
          TextButton(
            onPressed: _isLoading
                ? null
                : () {
                    if (_titleController.text.isNotEmpty &&
                        _bodyController.text.isNotEmpty &&
                        _userIdController.text.isNotEmpty) {
                      final model = PostModel(
                        title: _titleController.text,
                        body: _bodyController.text,
                        userId: int.tryParse(_userIdController.text),
                      );
                      _addPostToService(model);
                    }
                  },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    super.key,
    required PostModel? items,
  }) : _items = items;

  final PostModel? _items;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(_items?.title ?? ''),
          subtitle: Text(_items?.body ?? ''),
        ),
      ),
    );
  }
}
