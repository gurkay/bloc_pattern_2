import 'package:bloc_pattern_2/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          GoRoute(
            name: 'family_screen',
            path: 'family_screen/:fid',
            builder: (BuildContext context, GoRouterState state) =>
                FamilyScreen(fid: state.pathParameters['fid']!),
            routes: <GoRoute>[
              GoRoute(
                name: 'person_screen',
                path: 'person_screen/:pid',
                builder: (BuildContext context, GoRouterState state) {
                  return PersonScreen(
                    fid: state.pathParameters['fid']!,
                    pid: state.pathParameters['pid']!,
                  );
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: 'second_screen',
        path: '/second_screen',
        builder: (BuildContext context, GoRouterState state) {
          return const SecondScreen();
        },
      ),
    ],
  );
}
