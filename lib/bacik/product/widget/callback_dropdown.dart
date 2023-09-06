import 'package:flutter/material.dart';

import '../../303/call_back_learn.dart';

class CallbackDropdown extends StatefulWidget {
  const CallbackDropdown({super.key, required this.onUserSelected});
  final void Function(CallBackUser user) onUserSelected;
  @override
  State<CallbackDropdown> createState() => _CallbackDropdownState();
}

class _CallbackDropdownState extends State<CallbackDropdown> {
  CallBackUser? _user;
  void _changeUpdateCallBackUser(CallBackUser? callBackUser) {
    setState(() {
      _user = callBackUser;
    });

    if (_user != null) {
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CallBackUser>(
      value: CallBackUser.dummyUsers.first,
      items: CallBackUser.dummyUsers.map((user) {
        return DropdownMenuItem(
          value: user,
          child: Text(user.name),
        );
      }).toList(),
      onChanged: _changeUpdateCallBackUser,
    );
  }
}
