import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id, this.name);

  final String id;
  final String name;

  bool findUserName(String name) {
    return this.name == name;
  }

  @override
  List<Object> get props => [id];

  static const empty = User('-', '-');

  @override
  String toString() {
    return 'User ::: toString ::: id : $id ,name: $name';
  }
}
