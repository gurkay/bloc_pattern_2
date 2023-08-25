import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({
    super.key,
    this.cardLearnTitle,
    this.cardBodyText,
  });
  final String? cardLearnTitle;
  final String? cardBodyText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cardLearnTitle ?? ''),
      ),
      body: Column(
        children: [
          Card(
            color: Theme.of(context).primaryColor,
            shape: const StadiumBorder(),
            child: const SizedBox(
              height: 100,
              width: 500,
            ),
          ),
          _CustomeCardWidget(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Center(child: Text(cardBodyText ?? '')),
            ),
          ),
          Card(
            margin: ProjectCardMargins.cardMarginAll,
            color: Theme.of(context).primaryColorLight,
            child: const SizedBox(
              height: 100,
              width: 400,
              child: Center(child: Text('Deneme')),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomeCardWidget extends StatelessWidget {
  const _CustomeCardWidget({
    required this.child,
  });
  final Widget child;
  final circleBorder = const CircleBorder();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectCardMargins.cardMarginAll,
      shape: circleBorder,
      color: Theme.of(context).primaryColorDark,
      child: child,
    );
  }
}

class ProjectCardMargins {
  static const cardMarginAll = EdgeInsets.all(8.0);
}
