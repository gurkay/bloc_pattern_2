import 'package:bloc_pattern_2/bacik/303/home_screen_route_learn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bacik/303/family_screen.dart';
import 'bacik/303/person_screen.dart';
import 'bacik/product/theme_bloc/bloc/theme_bloc.dart';

void main() async {
  runApp(const MyApp());
}

final _router = GoRouter(
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreenRouteLearn(),
      routes: <GoRoute>[
        GoRoute(
          name: 'family',
          path: 'family/:fid',
          builder: (BuildContext context, GoRouterState state) =>
              FamilyScreen(fid: state.pathParameters['fid']!),
          routes: <GoRoute>[
            GoRoute(
              name: 'person',
              path: 'person/:pid',
              builder: (BuildContext context, GoRouterState state) {
                return PersonScreen(
                    fid: state.pathParameters['fid']!,
                    pid: state.pathParameters['pid']!);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: state.themeName,
            theme: state.themeData,
            routerConfig: _router,
          );
        },
      ),
    );
  }
}
