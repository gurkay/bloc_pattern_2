import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomeFoodButton(
                title: title ?? 'Food',
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 50),
          CustomeFoodButton(
            title: title ?? 'Food',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

mixin _ColorUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

mixin _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(8.0);
}

class CustomeFoodButton extends StatelessWidget
    with _ColorUtility, _PaddingUtility {
  CustomeFoodButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        shape: const StadiumBorder(),
      ),
      child: Padding(
        padding: normal2xPadding,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
