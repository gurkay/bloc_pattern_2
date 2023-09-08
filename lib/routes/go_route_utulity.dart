// main libraries
import 'package:bloc_pattern_2/widgets/dynamic_widgets/dynamic_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// constants
import '../constants/title_screens.dart';

// screens
import '../screens/second_screen.dart';
import '../screens/family_screen.dart';
import '../screens/home_screen_route_learn.dart';
import '../screens/person_screen.dart';

class GoRouteUtulity {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        name: 'home_screen_route_learn',
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreenRouteLearn(),
        routes: <GoRoute>[
          GoRouteManager(
            name: 'second_screen',
            path: 'second_screen',
            function: (context, state) =>
                const SecondScreen(title: TitleScreen.second_screen),
            subRoutes: <GoRoute>[
              GoRouteManager(
                name: 'family_screen',
                path: 'family_screen/:fid',
                function: (context, state) =>
                    FamilyScreen(fid: state.pathParameters['fid']!),
                subRoutes: [
                  GoRouteManager(
                    name: 'person_screen',
                    path: 'person_screen/:pid',
                    function: (context, state) => PersonScreen(
                      fid: state.pathParameters['fid']!,
                      pid: state.pathParameters['pid']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GoRouteManager(
            name: 'dynamic_text_field',
            path: 'dynamic_text_field',
            function: (context, state) => const DynamicTextField(),
          ),
        ],
      ),
    ],
  );
}

class GoRouteManager extends GoRoute {
  final String name;
  final String path;
  final Widget Function(BuildContext context, GoRouterState state) function;
  final List<GoRoute>? subRoutes;

  GoRouteManager({
    required this.name,
    required this.path,
    required this.function,
    this.subRoutes,
  }) : super(
          name: name,
          path: path,
          builder: function,
          routes: subRoutes ?? [],
        );
}
