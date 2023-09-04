import 'package:bloc_pattern_2/bacik/product/widget/callback_dropdown.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  CallBackUser? _user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallbackDropdown(
            onUserSelected: (CallBackUser callBackUser) {
              if (kDebugMode) {
                print(callBackUser);
              }
              _user = callBackUser;
            },
          ),
          Center(
            child: Text(_user?.name ?? CallBackUser.dummyUsers.first.name),
          ),
        ],
      ),
    );
  }
}

class CallBackUser {
  final String id;
  final String name;

  CallBackUser(this.id, this.name);

  // TODO: Dummy remove it
  static List<CallBackUser> dummyUsers = [
    CallBackUser('1', 'Gurkay'),
    CallBackUser('2', 'Sıddıka'),
    CallBackUser('3', 'Kucuk Halim'),
    CallBackUser('4', 'Şükran'),
    CallBackUser('5', 'Büyük Halim'),
  ];
}
