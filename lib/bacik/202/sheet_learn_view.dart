import 'dart:developer';

import 'package:bloc_pattern_2/bacik/101/image_learn.dart';
import 'package:bloc_pattern_2/bacik/202/image_learn_view.dart';
import 'package:flutter/material.dart';

class SheetLearnView extends StatefulWidget {
  const SheetLearnView({super.key});

  @override
  State<SheetLearnView> createState() => _SheetLearnViewState();
}

class _SheetLearnViewState extends State<SheetLearnView> {
  Color _backgroundColor = Colors.greenAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      body: Text('data'),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (context) {
              return _CustomSheet();
            },
          );
          inspect(result);
          if (result is Color) {
            setState(() {
              _backgroundColor = result;
            });
          }
        },
        label: const Text('Sheet'),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    super.key,
  });

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgroundColor = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _CustomMainSheet(child: child)
          const Text('Image'),
          ImagePaths.ic_apple_with_scholl.toWidget(),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _backgroundColor = Colors.red;
              });
              Navigator.of(context).pop<Color>(_backgroundColor);
            },
            child: const Text('Ok'),
          )
        ],
      ),
    );
  }
}

class _CustomMainSheet extends StatelessWidget {
  _CustomMainSheet({super.key, required this.child});
  final Widget child;
  final _gripHeight = 24.0;
  final Color _iconColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        children: [
          Divider(
            color: Colors.black,
            indent: MediaQuery.of(context).size.width * 0.4,
            endIndent: MediaQuery.of(context).size.width * 0.4,
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.cancel_outlined,
                color: _iconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum ImagePaths {
  ic_apple_with_scholl,
}

extension ImagePathsExtension on ImagePaths {
  String toPath() {
    return 'assets/png/$name.png';
  }

  Widget toWidget() {
    return Image.asset(toPath());
  }
}
