import 'package:bloc_pattern_2/bacik/202/service/comment_model.dart';
import 'package:bloc_pattern_2/bacik/202/service/post_service.dart';
import 'package:flutter/material.dart';

class CommentGetLists extends StatefulWidget {
  const CommentGetLists({super.key, this.postId});
  final int? postId;

  @override
  State<CommentGetLists> createState() => _CommentGetListsState();
}

class _CommentGetListsState extends State<CommentGetLists> {
  List<CommentModel>? _items;
  late final IPostService _postService;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _postService = PostService();
    fetchCommentItemsAdvance();
  }

  Future<void> fetchCommentItemsAdvance() async {
    _changeLoading();

    _items = await _postService.fetchCommentsWithPostId(widget.postId ?? 0);

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
      appBar: AppBar(),
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
    required CommentModel? item,
  }) : _item = item;

  final CommentModel? _item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(_item?.name ?? ''),
          subtitle: Text(_item?.body ?? ''),
        ),
      ),
    );
  }
}
