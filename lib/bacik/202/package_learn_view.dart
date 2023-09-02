import 'package:bloc_pattern_2/bacik/202/package/launche_manager.dart';
import 'package:bloc_pattern_2/bacik/202/package/loading_bar.dart';
import 'package:flutter/material.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with LauncheManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'data',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const LoadingBar(
            spinKitSize: 40,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
        onPressed: () {
          launchUrlSend('https://google.com');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
