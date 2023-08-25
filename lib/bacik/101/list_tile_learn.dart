import 'package:flutter/material.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});
  final String listTileTitle = 'My Card';
  final String listTileSubtitle = 'How do you use your card';
  final imageUrl = 'https://picsum.photos/seed/picsum/200/300';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: ListTileLeadingView(),
                title: Image.network(
                  imageUrl,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                subtitle: Text(listTileSubtitle),
                trailing: Container(
                  color: Colors.red,
                  child: const Icon(
                    Icons.chevron_right,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileLeadingView extends Icon {
  ListTileLeadingView()
      : super(
          Icons.money,
        );
}
