import 'package:bloc_pattern_2/blocs/navigation/nav_drawer/nav_drawer_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc_exports.dart';
import '../../blocs/sing_in/singin_bloc.dart';
import '../../routes/app_routes.dart';
import '../../widgets/navigation/nav_drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final singinBloc = BlocProvider.of<SinginBloc>(context);

    final pageOneBloc = BlocProvider.of<PageOneBloc>(context);
    return Scaffold(
      drawer: NavDrawerWidget('Gurkay BAŞYİĞİT', 'gunesebak@gmail.com'),
      appBar: AppBar(
        title: const Text('Initial Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  pageOneBloc.add(NavigateToPageOneEvent());
                  Navigator.pushNamed(context, AppRoutes.page_one);
                },
                child: const Text('Go Page One'),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.tasks_screen);
                },
                child: const Text('Go Tasks'),
              ),
              Builder(
                builder: (context) {
                  final userId = context.select(
                    (AuthenticationBloc bloc) => bloc.state.user.id,
                  );
                  return Text('UserID: $userId');
                },
              ),
              ElevatedButton(
                child: const Text('Logout'),
                onPressed: () {
                  context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
