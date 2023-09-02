import 'package:flutter/material.dart';

class NavigationDetailLearn extends StatefulWidget {
  const NavigationDetailLearn({super.key, this.isOk = false});
  final bool isOk;

  @override
  State<NavigationDetailLearn> createState() => _NavigationDetailLearnState();
}

class _NavigationDetailLearnState extends State<NavigationDetailLearn> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop(!widget.isOk);
          },
          label: widget.isOk ? Text('Cancel') : Text('Ok'),
          icon: widget.isOk ? Icon(Icons.cancel) : Icon(Icons.check),
        ),
      ),
    );
  }
}
