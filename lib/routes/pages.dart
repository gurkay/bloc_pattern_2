import 'package:bloc_pattern_2/blocs/home/home_bloc.dart';
import 'package:bloc_pattern_2/blocs/sing_in/singin_bloc.dart';
import 'package:bloc_pattern_2/main.dart';
import 'package:bloc_pattern_2/pages/singin/singin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/home/home_page.dart';
import 'app_routes.dart';

class Pages {
  static final RouteObserver<Route> observer = RouteObserver();

  static List<PageEntity> Routes() {
    return [
      PageEntity(
        path: AppRoutes.INITIAL,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomeBloc()),
      ),
      PageEntity(
        path: AppRoutes.Sing_in,
        page: const SinginPage(),
        bloc: BlocProvider(create: (_) => SinginBloc(singinPage: '/sing_in')),
      ),
    ];
  }

  static List<dynamic> Blocer(BuildContext context) {
    List<dynamic> blocerList = <dynamic>[];
    for (var blocer in Routes()) {
      blocerList.add(blocer.bloc);
    }
    return blocerList;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = Routes().where((element) => element.path == settings.name);

      print('result : $result');

      // if (result.isNotEmpty) {
      //   bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
      //   if (result.first.path == AppRoutes.INITIAL && deviceFirstOpen) {
      //     bool isLogin = Global.storageService.getIsLogin();
      //     if (isLogin) {
      //       return MaterialPageRoute<void>(
      //           builder: (_) => HomePage(), settings: settings);
      //     }
      //     return MaterialPageRoute<void>(
      //         builder: (_) => SinginPage(), settings: settings);
      //   }
      //   return MaterialPageRoute<void>(
      //       builder: (_) => result.first.page, settings: settings);
      // }

      return MaterialPageRoute<void>(
          builder: (_) => const HomePage(), settings: settings);
    }
    return MaterialPageRoute<void>(
        builder: (_) => const SinginPage(), settings: settings);
  }
}

class PageEntity<T> {
  String path;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.path,
    required this.page,
    required this.bloc,
  });
}
