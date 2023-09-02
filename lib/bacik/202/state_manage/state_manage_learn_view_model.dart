import 'package:bloc_pattern_2/bacik/202/state_manage/state_manage_learn_view.dart';
import 'package:flutter/material.dart';

abstract class StateManageLearnViewModel extends State<StateManageLearnView> {
  bool isVisible = true;
  bool isOpasity = true;

  void changeIsVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeIsOpasity() {
    setState(() {
      isOpasity = !isOpasity;
    });
  }
}
