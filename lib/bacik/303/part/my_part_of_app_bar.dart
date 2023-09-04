part of 'part_of_learn.dart';

class _MyPartOfAppBar extends StatefulWidget implements PreferredSizeWidget {
  final widthPreferredSize = 100;
  const _MyPartOfAppBar({super.key});

  @override
  State<_MyPartOfAppBar> createState() => _MyPartOfAppBarState();

  @override
  Size get preferredSize => const Size(100, 56);
}

class _MyPartOfAppBarState extends State<_MyPartOfAppBar> {
  String _appBartitle = 'Halim Başyiğit';

  void changeAppBarTitle(String title) {
    setState(() {
      _appBartitle = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(_appBartitle),
      actions: [
        _app_bar_icon_button(_appBartitle, const Icon(Icons.add)),
        _app_bar_icon_button('Siddika Başyiğit', const Icon(Icons.save)),
        _app_bar_icon_button('Halim Başyiğit', const Icon(Icons.delete)),
      ],
    );
  }

  IconButton _app_bar_icon_button(String? label, Widget widget) {
    return IconButton(
      onPressed: () {
        if (label == 'Halim Başyiğit') {
          changeAppBarTitle('Siddika Başyiğit');
        } else {
          changeAppBarTitle('Halim Başyiğit');
        }
      },
      icon: widget,
    );
  }
}
