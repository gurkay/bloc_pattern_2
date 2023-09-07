import 'package:bloc_pattern_2/routes/go_route_utulity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bacik/product/theme_bloc/bloc/theme_bloc.dart';

void main() async {
  runApp(const MyApp());
}

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
            routerConfig: GoRouteUtulity.router,
          );
        },
      ),
    );
  }
}
