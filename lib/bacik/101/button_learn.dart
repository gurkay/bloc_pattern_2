import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});
  final String? textButtonName = 'Text Button';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
                return Colors.red;
              }),
            ),
            child: Text(
              textButtonName ?? '',
              style: const ButtonTextUtilityStyle(),
            ),
          ),
          const ElevatedButton(
            onPressed: null,
            child: Text('Elevate Button'),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.all(10),
              shape: const StadiumBorder(),
            ),
            child: const Text('OutlinedButton'),
          ),
          InkWell(
            onTap: () {},
            child: const Text('InkWell'),
            onLongPress: () {
              AlertDialog(
                title: const Text('InkWell'),
                icon: TextButton(
                  onPressed: () {},
                  child: const Text('Ok'),
                ),
              );
            },
          ),
          Container(
            height: 200,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
                right: 40,
                left: 40,
              ),
              child: Text(
                'Place Pid',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonTextUtilityStyle extends TextStyle {
  const ButtonTextUtilityStyle()
      : super(
          fontStyle: FontStyle.normal,
          color: Colors.lightBlue,
          wordSpacing: 2,
          letterSpacing: 2,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
        );
}
