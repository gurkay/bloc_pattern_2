import 'package:bloc_pattern_2/bacik/product/models/dummy_families.dart';
import 'package:flutter/material.dart';

import '../../bacik/product/models/family.dart';
import '../../bacik/product/models/person.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key, required this.fid, required this.pid});

  final String fid;
  final String pid;

  @override
  Widget build(BuildContext context) {
    final Family? family = DummyFamilies.families[fid];
    final Person? person = family?.people[pid];
    return Scaffold(
      appBar: AppBar(
        title: Text(family?.name ?? ''),
      ),
      body: Text(person?.name ?? ''),
    );
  }
}
