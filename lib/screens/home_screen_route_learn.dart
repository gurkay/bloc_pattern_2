import 'package:bloc_pattern_2/bacik/product/models/dummy_families.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../bacik/product/models/family.dart';

class HomeScreenRouteLearn extends StatelessWidget {
  const HomeScreenRouteLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          for (final MapEntry<String, Family> entry
              in DummyFamilies.families.entries)
            ListTile(
              title: Text(entry.value.name),
              onTap: () => context.go(
                context.namedLocation(
                  'family_screen',
                  pathParameters: <String, String>{'fid': entry.key},
                ),
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(
            context.namedLocation(
              'second_screen',
            ),
          );
        },
      ),
    );
  }
}
