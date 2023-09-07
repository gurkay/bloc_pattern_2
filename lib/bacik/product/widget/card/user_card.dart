import 'package:flutter/material.dart';

import '../../../../models/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.id),
        subtitle: Text(user.name),
      ),
    );
  }
}
