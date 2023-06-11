import 'dart:async';

import '../../services/guid_gen.dart';

import '../../models/user.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(GUIDGen.generate()),
    );
  }
}
