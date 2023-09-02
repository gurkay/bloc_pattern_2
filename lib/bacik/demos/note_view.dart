import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/image_items.dart';
import '../core/png_image.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});
  final _title = 'Create your first note';
  final _description = 'Add a note';
  final _createNote = 'Create a Note';
  final _importNotes = 'Import Notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            PngImage(name: ImageItems().appleBookWitoutPath),
            _titleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubtitleWidget(description: _description * 50),
            ),
            const Spacer(),
            _createElevatedButton(context),
            TextButton(
              onPressed: () {},
              child: Text(_importNotes),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton _createElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: SizedBox(
        height: ButtonSizedView.buttonNormalHeight,
        child: Center(
          child: Text(
            _createNote,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}

class ButtonSizedView {
  static const double buttonNormalHeight = 50;
}

class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget({
    super.key,
    required String description,
    this.titleColor = Colors.black,
    this.titleFontWeight = FontWeight.normal,
    this.subtitleTextAlign = TextAlign.center,
  }) : _description = description;
  final Color titleColor;
  final FontWeight titleFontWeight;
  final TextAlign subtitleTextAlign;

  final String _description;

  @override
  Widget build(BuildContext context) {
    return Text(
      _description,
      textAlign: subtitleTextAlign,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: titleColor,
            fontWeight: titleFontWeight,
          ),
    );
  }
}

class _titleWidget extends StatelessWidget {
  const _titleWidget({
    super.key,
    required String title,
    this.titleColor = Colors.black,
    this.titleFontWeight = FontWeight.bold,
  }) : _title = title;

  final String _title;
  final Color titleColor;
  final FontWeight titleFontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: titleColor,
            fontWeight: titleFontWeight,
          ),
    );
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 20);
}
