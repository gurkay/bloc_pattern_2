import 'package:bloc_pattern_2/bacik/202/theme/light_theme.dart';
import 'package:bloc_pattern_2/bacik/303/lottie_learn.dart';
import 'package:bloc_pattern_2/bacik/303/reqres_resource/view/req_res_view.dart';
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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: state.name,
            theme: state.changeTheme,
            home: LottieLearn(),
          );
        },
      ),
    );
  }
}
