import 'package:bloc_pattern_2/bacik/202/cache/shared_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearnView extends StatefulWidget {
  const SharedLearnView({super.key});

  @override
  State<SharedLearnView> createState() => _SharedLearnViewState();
}

class _SharedLearnViewState extends LoadingStatefull<SharedLearnView> {
  late final SharedManager _sharedManager;
  @override
  void initState() {
    super.initState();
    _sharedManager = SharedManager();
    _initiliaze();
  }

  int _currenValue = 0;

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currenValue = _value;
      });
    }
  }

  Future<void> getDefaultPrefsValue() async {
    _onChangeValue(_sharedManager.getPreferences(SharedKeys.counter) ?? '');
  }

  Future<void> _initiliaze() async {
    changeIsLoading();
    await _sharedManager.init();
    changeIsLoading();
    getDefaultPrefsValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currenValue.toString()),
        actions: [
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
      body: TextField(
        onChanged: (value) {
          _onChangeValue(value);
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _saveFloatingActionButton(),
          _deleteFloatingActionButton(),
        ],
      ),
    );
  }

  FloatingActionButton _saveFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeIsLoading();
        await _sharedManager.savePreferences(
            SharedKeys.counter, _currenValue.toString());
        changeIsLoading();
      },
      child: const Icon(Icons.save),
    );
  }

  FloatingActionButton _deleteFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeIsLoading();
        _sharedManager.removePreferences(SharedKeys.counter);
        changeIsLoading();
      },
      child: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
    );
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
