import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.headlineLarge,
              maxLines: 1,
            ),
          ),
          Container(
            height: 300,
            color: Colors.red,
          ),
          const Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 100,
                  color: Colors.green,
                ),
                Container(
                  width: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  color: Colors.blue,
                ),
                Container(
                  width: 100,
                  color: Colors.white,
                ),
                Container(
                  width: 100,
                  color: Colors.yellow,
                ),
                Container(
                  width: 100,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
}

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({super.key});

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {});
  }
}
