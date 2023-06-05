import 'package:bloc_pattern_2/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/sing_in/singin_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final singinBloc = BlocProvider.of<SinginBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            BlocListener<SinginBloc, SinginState>(
              listenWhen: (context, state) {
                return state is SinginState;
              },
              listener: (context, state) {
                Navigator.of(context).pushNamed(state.page);
              },
              child: TextButton(
                onPressed: () {
                  singinBloc.add(SinginPageEvent(page: AppRoutes.Sing_in));
                },
                child: Text('Sing In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
