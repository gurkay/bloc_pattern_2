import 'package:bloc_pattern_2/bacik/demos/basic_demo_father.dart';
import 'package:flutter/material.dart';

class MyCollectionDemo extends StatefulWidget {
  const MyCollectionDemo({super.key});

  @override
  State<MyCollectionDemo> createState() => _MyCollectionDemoState();
}

class _MyCollectionDemoState extends State<MyCollectionDemo> {
  // late kullanılmasinin sebebi sonradan
  // deger gelecek constructor zamaninda
  // final olmasi consturctor olusturulunca deger
  // alacak ve bir daha degismeyecek
  late final List<CollectionModel> _items;

  @override
  void initState() {
    // StatefullWidget constructor burasi
    _items = CollectionItems().items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _MyCollectionCard(collectionModel: _items[index]);
        },
        itemCount: _items.length,
      ),
    );
  }
}

class _MyCollectionCard extends StatelessWidget {
  const _MyCollectionCard({
    super.key,
    required CollectionModel collectionModel,
  }) : _item = collectionModel;

  final CollectionModel _item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: _MarginUtility().marginSymetric,
      shadowColor: _CardUtility().shadowColor,
      elevation: _CardUtility().elevationValue,
      child: Column(
        children: [
          PngImage(name: _item.imagePath),
          Padding(
            padding: _PaddingUtility().paddingTop,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_item.title),
                Text('${_item.price} Eth'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CollectionItems {
  late final List<CollectionModel> items;
  CollectionItems() {
    items = [
      CollectionModel(
        imagePath: ImageItems().appleBookWitoutPath,
        title: 'Abstruct Art0',
        price: 6.0,
      ),
      CollectionModel(
        imagePath: ImageItems().appleBookWitoutPath,
        title: 'Abstruct Art1',
        price: 3.0,
      ),
      CollectionModel(
        imagePath: ImageItems().appleBookWitoutPath,
        title: 'Abstruct Art2',
        price: 5.0,
      ),
    ];
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel({
    required this.imagePath,
    required this.title,
    required this.price,
  });
}

class _PaddingUtility {
  final EdgeInsets paddingTop = const EdgeInsets.only(bottom: 8.0);
}

class _MarginUtility {
  final EdgeInsets marginSymetric =
      const EdgeInsets.symmetric(horizontal: 10, vertical: 4);
}

class _CardUtility {
  final double elevationValue = 4.0;
  final Color shadowColor = Colors.black;
}
