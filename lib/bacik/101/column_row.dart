import 'package:flutter/material.dart';

class ColumnRow extends StatelessWidget {
  const ColumnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(child: Container(color: Colors.amber)),
        Expanded(child: Container(color: Colors.red)),
        Expanded(
            child: Row(
          children: [
            Expanded(child: Container(color: Colors.amber)),
            Expanded(child: Container(color: Colors.black)),
            Expanded(child: Container(color: Colors.orange)),
            Expanded(child: Container(color: Colors.blue)),
          ],
        )),
        Expanded(child: Container(color: Colors.green)),
      ]),
    );
  }
}
