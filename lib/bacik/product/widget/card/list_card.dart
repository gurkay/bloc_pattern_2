import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(
        items.join(','),
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
