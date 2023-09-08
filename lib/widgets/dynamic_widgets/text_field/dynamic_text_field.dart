import 'package:bloc_pattern_2/bacik/product/theme_bloc/bloc/theme_bloc.dart';
import 'package:bloc_pattern_2/widgets/dynamic_widgets/text_field/bloc/text_field_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bacik/product/constants/duration_items.dart';
import '../../../bacik/product/extension/lottie_paths_extension.dart';
import '../../../bacik/product/theme_bloc/theme_manager.dart';

class DynamicTextField extends StatefulWidget {
  const DynamicTextField({super.key});

  @override
  State<DynamicTextField> createState() => _DynamicTextFieldState();
}

class _DynamicTextFieldState extends State<DynamicTextField>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  static List<String> friendsList = [''];
  late AnimationController _animationThemeController;
  final double _darkThemeButtonValue = 1.00;
  final double _lightThemeButtonValue = 0.50;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _animationThemeController = AnimationController(
      vsync: this,
      duration: DurationItems.durationNormal(),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _animateThemeTo(double value) {
    _animationThemeController.animateTo(value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextFieldBloc(),
      child: BlocBuilder<TextFieldBloc, TextFieldBlocState>(
        builder: (textFieldBlocContext, textFieldBlocState) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (themeBlocContext, themeState) => Scaffold(
              appBar: AppBar(
                title: const Text('Dynamic TextFormFields'),
                actions: [
                  _inWellThemeButton(context, themeState),
                ],
              ),
              body: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // name textfield
                      Padding(
                        padding: const EdgeInsets.only(right: 32.0),
                        child: TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                              hintText: 'Enter your name'),
                          validator: (v) {
                            if (v!.trim().isEmpty)
                              return 'Please enter something';
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Add Friends'),
                      ..._getFriends(),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 5),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState?.save();
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// get firends text-fields
  List<Widget> _getFriends() {
    List<Widget> friendsTextFields = [];

    for (int i = 0; i < friendsList.length; i++) {
      friendsTextFields.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Expanded(child: FriendTextFields(i)),
              const SizedBox(
                width: 16,
              ),
              // we need add button at last friends row
              _addRemoveButton(i == friendsList.length - 1, i),
            ],
          ),
        ),
      );
    }

    return friendsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          friendsList.insert(0, '');
        } else {
          friendsList.removeAt(index);
        }
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add)
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }

  InkWell _inWellThemeButton(BuildContext context, ThemeState themeState) {
    IThemeManager themeManager = ThemeManager();

    return InkWell(
      onTap: () {
        switch (themeState.themeName) {
          case 'initial':
            themeManager.lightTheme(context);
            _animateThemeTo(_lightThemeButtonValue);
          case 'dark':
            themeManager.lightTheme(context);
            _animateThemeTo(_lightThemeButtonValue);
          case 'light':
            themeManager.darkTheme(context);
            _animateThemeTo(_darkThemeButtonValue);
        }
      },
      child: LottiePaths.animation_theme_button.toWidget(
        false,
        _animationThemeController,
      ),
    );
  }
}

class FriendTextFields extends StatefulWidget {
  FriendTextFields(this.index);
  final int index;
  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}

class _FriendTextFieldsState extends State<FriendTextFields> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = _DynamicTextFieldState.friendsList[widget.index];
    });

    return TextFormField(
      controller: _nameController,
      onChanged: (v) => _DynamicTextFieldState.friendsList[widget.index] = v,
      decoration: const InputDecoration(hintText: 'Enter your friend\'s name'),
      validator: (v) {
        if (v!.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}
