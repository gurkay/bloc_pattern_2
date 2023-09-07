import 'package:bloc_pattern_2/bacik/product/models/dummy_families.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../bacik/product/models/person.dart';

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key, required this.fid});
  final String fid;
  @override
  Widget build(BuildContext context) {
    final Map<String, Person> people = DummyFamilies.families[fid]!.people;
    return Scaffold(
      appBar: AppBar(title: Text(DummyFamilies.families[fid]!.name)),
      body: ListView(
        children: <Widget>[
          for (final MapEntry<String, Person> entry in people.entries)
            ListTile(
              title: Text(entry.value.name),
              onTap: () => context.go(context.namedLocation(
                'person_screen',
                pathParameters: <String, String>{'fid': fid, 'pid': entry.key},
                queryParameters: <String, String>{'qid': 'quid'},
              )),
            ),
        ],
      ),
    );
  }
}
