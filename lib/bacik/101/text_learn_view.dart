import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({
    super.key,
    this.userName,
  });

  final String name = 'Gurkay';
  final String? userName;
  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Learn View'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (' Welcome $name ${name.length}' * 10),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.lightBlue,
              wordSpacing: 2,
              letterSpacing: 2,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            (' Hello $name ${name.length}' * 10),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: ProjectStyles.welcomeStyle,
          ),
          Text(
            (' Hello2 $name ${name.length}' * 10),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: ProjectColors.welcomeColor,
                ),
          ),
          Text(userName ?? ''),
          Text(keys.welcome),
        ],
      ),
    );
  }
}

class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
    fontStyle: FontStyle.italic,
    color: Colors.lightBlue,
    wordSpacing: 2,
    letterSpacing: 2,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
  );
}

class ProjectColors {
  static Color welcomeColor = Colors.yellow;
}

class ProjectKeys {
  final String welcome = 'Merhaba';
}
