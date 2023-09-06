import 'package:flutter/material.dart';

class ReqResViewDetail extends StatelessWidget {
  const ReqResViewDetail({super.key, this.title, this.image});

  final String? title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Boş Geldi'),
      ),
      body: Image.network(image ?? ''),
    );
  }
}
