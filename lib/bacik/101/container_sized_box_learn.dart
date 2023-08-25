import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Sized Box'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: 300,
            child: Text(('a' * 500)),
          ),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 100,
            child: Text('b' * 100),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            constraints: const BoxConstraints(
              maxWidth: 200,
              minWidth: 100,
              maxHeight: 100,
            ),
            child: Text('cc' * 1),
            decoration: ProjectUtility.boxDecoration,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            height: 50,
            constraints: const BoxConstraints(
              maxWidth: 200,
              minWidth: 100,
              maxHeight: 100,
            ),
            child: Text('dd' * 1),
            decoration: ProjectContainerDecoration(),
          ),
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(
      colors: [Colors.red, Colors.blueAccent],
    ),
    boxShadow: const [
      BoxShadow(
        color: Colors.green,
        offset: Offset(0.1, 1),
        blurRadius: 0.5,
      ),
    ],
    border: Border.all(width: 10, color: Colors.white12),
  );
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [Colors.red, Colors.blueAccent],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.green,
              offset: Offset(0.1, 1),
              blurRadius: 0.5,
            ),
          ],
          border: Border.all(width: 10, color: Colors.white12),
        );
}
