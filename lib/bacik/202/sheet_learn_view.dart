import 'dart:developer';

import 'package:flutter/material.dart';

class SheetLearnView extends StatefulWidget {
  const SheetLearnView({super.key});

  @override
  State<SheetLearnView> createState() => _SheetLearnViewState();
}

class _SheetLearnViewState extends State<SheetLearnView>
    with ProductSheetMixin {
  Color _backgroundColor = Colors.greenAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: TextButton(
                onPressed: () async {
                  final result = await _showCustomSheet(
                    context,
                    _CustomSheetForm(),
                  );
                },
                child: Text('New Sheet')),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await _showCustomSheet(
            context,
            _CustomSheet(),
          );
          print('floatingActionButton: $result');
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

mixin ProductSheetMixin {
  Future<T?> _showCustomSheet<T>(BuildContext context, Widget widget) async {
    final result = await showModalBottomSheet<T>(
      isScrollControlled: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return _CustomMainSheet(child: widget);
      },
    );
    return result;
  }
}

class _CustomSheetForm extends StatefulWidget {
  const _CustomSheetForm();

  @override
  State<_CustomSheetForm> createState() => _CustomSheetFormState();
}

class _CustomSheetFormState extends State<_CustomSheetForm> {
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          TextFormField(
            validator: FormFieldValidator().isNotEmpty,
          ),
          TextFormField(
            validator: FormFieldValidator().isNotEmpty,
          ),
          DropdownButtonFormField<String>(
            value: 'a value',
            validator: FormFieldValidator().isNotEmpty,
            items: [
              DropdownMenuItem(
                child: Text('a'),
                value: 'a value',
              ),
              DropdownMenuItem(
                child: Text('b'),
                value: 'b value',
              ),
              DropdownMenuItem(
                child: Text('c'),
                value: 'c value',
              ),
            ],
            onChanged: (value) {},
          ),
          ElevatedButton(
            onPressed: () {
              if (_key.currentState?.validate() ?? false) {
                print('Ok');
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage()._notEmpty;
  }
}

class ValidatorMessage {
  final String _notEmpty = 'Boş Geçilemez';
}

class _CustomMainSheet extends StatelessWidget {
  final Widget child;

  const _CustomMainSheet({required this.child});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const _CustomHeadSheet(),
          child,
        ],
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet();

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgroundColor = Colors.amberAccent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
          ),
        ],
      ),
    );
  }
}

class _CustomHeadSheet extends StatelessWidget {
  const _CustomHeadSheet();

  final _gripHeight = 32.0;
  final Color _iconColor = Colors.red;
  final Color _dividerColor = Colors.black;
  final _mediaQueryPersent = 0.4;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: _gripHeight,
          child: Stack(
            children: [
              Divider(
                color: _dividerColor,
                indent: MediaQuery.of(context).size.width * _mediaQueryPersent,
                endIndent:
                    MediaQuery.of(context).size.width * _mediaQueryPersent,
              ),
              Positioned(
                top: 5,
                right: 8,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.cancel_outlined,
                    color: _iconColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
