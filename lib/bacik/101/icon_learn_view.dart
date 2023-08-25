import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});
  final IconSizes _iconSize = IconSizes(40.0);
  final IconColors _iconColors = IconColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Learn View'),
      ),
      body: Column(children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              size: _iconSize.iconSmall,
              color: _iconColors.froly,
            ))
      ]),
    );
  }
}

class IconSizes {
  final double iconSmall;
  IconSizes(this.iconSmall);
}

class IconColors {
  final Color froly = const Color(0xffED617A);
}
