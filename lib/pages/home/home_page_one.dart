import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/authentication/authentication_bloc.dart';
import '../../routes/pages.dart';

class HomePageOne extends StatelessWidget {
  const HomePageOne({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePageOne());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...Pages.blocer(context)],
      child: Scaffold(
        appBar: AppBar(title: const Text('Home Page One')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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
