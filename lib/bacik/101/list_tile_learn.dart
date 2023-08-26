import 'package:flutter/material.dart';

import '../core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});
  final String listTileTitle = 'My Card';
  final String listTileSubtitle = 'How do you use your card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: ListTileLeadingView(),
                title: RandomImage(
                  imageHeight: 100,
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
