import 'dart:async';

import '../../models/user.dart';
import '../../services/guid_gen.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(GUIDGen.generate()),
    );
  }

  @override
  String toString() {
    return 'UserRepository ::: toString ::: _user : $_user';
  }
}
