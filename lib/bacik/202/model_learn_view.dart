import 'package:bloc_pattern_2/bacik/202/model_learn.dart';
import 'package:flutter/material.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  @override
  void initState() {
    super.initState();

    final user1e1 = PostModel1();
    user1e1.userId = 1;
    user1e1.id = 1;
    user1e1.title = 'User1 Title1';
    user1e1.body = 'User1 Body1';

    final user1e2 = PostModel1()
      ..userId = 2
      ..id = 2
      ..title = 'User1 Title2'
      ..body = 'User1 Body2';

    final user2 = PostModel2(1, 1, 'title', 'body');
    user2.userId = 2;
    user2.id = 2;
    user2.title = 'User2 Title1';
    user2.body = 'User2 Body1';

    final user3 = PostModel3(1, 1, 'title', 'body');

    final user4 = PostModel4(
      userId: 1,
      id: 1,
      title: 'title',
      body: 'body',
    );

    // user5. diyerek propertileri goremiyor
    // erisim engelleniyor
    // capsulation yapilmasi lazim
    // en iyi senaryo local uzerinden
    // datalari kullniyorsan
    final user5 = PostModel5(userId: 1, id: 1, title: 'title', body: 'body');
    user5.userId;

    final user6 = PostModel6(userId: 1, id: 1, title: 'title', body: 'body');

    final user7 = PostModel7();

    // servisten alinan datalar
    // icin en dogru kullanim
    final user8 = PostModel8(body: 'User8 Body');
  }

  final user9 = PostModel8(body: 'User9 Body');
  PostModel8 user10 = PostModel8(body: 'User10 first body data');
  final String noData = 'No Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user9.title ?? user10.title ?? noData),
      ),
      body: Column(
        children: [
          Text(user9.body ?? noData),
          Text(user10.body ?? noData),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user10 = user10.copyWith(title: 'On Refresh Pressed');
            user10.updateBodyData('New Body');
            // PostModel8(title: 'On Refresh Pressed', body: 'On Pressed');
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
