import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});
  final String _statelessLearnTitle = 'Stateless Learn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_statelessLearnTitle),
      ),
      body: const Column(
        children: [
          ProjectTextWidget(text: 'Gurkay'),
          ProjectTextWidget(text: 'Siddika'),
          ProjectTextWidget(),
          ProjectTextWidget(),
          ProjectTextWidget(),
          _ProjectContainerWidget(containerText: 'Container Text'),
        ],
      ),
    );
  }
}

class _ProjectContainerWidget extends StatelessWidget {
  const _ProjectContainerWidget({
    super.key,
    this.containerText,
  });
  final String? containerText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      constraints: const BoxConstraints(
        maxWidth: 200,
        minWidth: 100,
        maxHeight: 100,
      ),
      decoration: ProjectContainerDecoration(),
      child: ProjectTextWidget(text: (containerText ?? '')),
    );
  }
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

class ProjectTextWidget extends StatelessWidget {
  const ProjectTextWidget({
    super.key,
    this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      (text ?? ''),
      style: const ProjectTextStyles(),
    );
  }
}

class ProjectTextStyles extends TextStyle {
  const ProjectTextStyles() : super(fontSize: 16);
}
