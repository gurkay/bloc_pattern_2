import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key, this.appBarText});
  final String? appBarText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarText ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 300,
                color: Colors.blue,
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              height: 200,
              color: Colors.red,
            ),
            Padding(
              padding: ProjectPaddingSize.pagePaddingVertical,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
            ),
            Padding(
              padding: ProjectPaddingSize.pagePaddingRightOnly +
                  ProjectPaddingSize.pagePaddingVertical,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectPaddingSize {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 10);
  static const pagePaddingRightOnly = EdgeInsets.only(right: 20);
}
