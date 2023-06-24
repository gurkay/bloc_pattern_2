import 'package:bloc_pattern_2/404/feature/login/view/login_view.dart';
import 'package:bloc_pattern_2/pages/home/home_page.dart';
import 'package:bloc_pattern_2/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../404/feature/login/bloc/login_bloc.dart';
import '../blocs/page_one/page_one_bloc.dart';
import '../blocs/page_two/page_two_bloc.dart';
import '../blocs/tasks/tasks_bloc.dart';
import '../pages/initial/initial_page.dart';
import '../pages/page_one/page_one.dart';
import '../pages/page_two/page_two.dart';
import '../screens/tasks/tasks_screen.dart';
import 'app_routes.dart';

class Pages {
  static final RouteObserver<Route> observer = RouteObserver();

  static List<PageEntity> Routes() {
    return [
      // PageEntity(
      //   path: AppRoutes.splash_page,
      //   page: SplashPage(),
      //   bloc: BlocProvider(
      //     create: (_) => AuthenticationBloc(
      //       authenticationRepository: AuthenticationRepository(),
      //       userRepository: UserRepository(),
      //     ),
      //   ),
      // ),
      // PageEntity(
      //   path: AppRoutes.INITIAL,
      //   page: InitialPage(),
      //   bloc: BlocProvider(
      //     create: (_) => AuthenticationBloc(
      //       authenticationRepository: AuthenticationRepository(),
      //       userRepository: UserRepository(),
      //     ),
      //   ),
      // ),
      // PageEntity(
      //   path: AppRoutes.INITIAL,
      //   page: InitialPage(),
      //   bloc: BlocProvider(create: (_) => InitialPageBloc()),
      // ),
      // PageEntity(
      //   path: AppRoutes.INITIAL,
      //   page: InitialPage(),
      //   bloc: BlocProvider(create: (_) => NavDrawerBloc()),
      // ),
      // PageEntity(
      //   path: AppRoutes.login_view,
      //   page: LoginView(),
      //   bloc: BlocProvider(create: (_) => LoginBloc()),
      // ),
      PageEntity(
        path: AppRoutes.page_one,
        page: PageOne(),
        bloc: BlocProvider(create: (_) => PageOneBloc()),
      ),
      PageEntity(
        path: AppRoutes.page_two,
        page: PageTwo(),
        bloc: BlocProvider(create: (_) => PageTwoBloc()),
      ),
      PageEntity(
        path: AppRoutes.tasks_screen,
        page: TasksScreen(),
        bloc: BlocProvider(create: (_) => TasksBloc()),
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
      print('settings : $settings');

      if (settings.name == AppRoutes.INITIAL) {
        return MaterialPageRoute<void>(
          builder: (_) => InitialPage(),
          settings: settings,
        );
      }

      if (settings.name == AppRoutes.splash_page) {
        return MaterialPageRoute<void>(
          builder: (_) => SplashPage(),
          settings: settings,
        );
      }

      if (settings.name == AppRoutes.page_one) {
        return MaterialPageRoute<void>(
          builder: (_) => PageOne(),
          settings: settings,
        );
      }

      if (settings.name == AppRoutes.page_two) {
        return MaterialPageRoute<void>(
          builder: (_) => PageTwo(),
          settings: settings,
        );
      }

      if (settings.name == AppRoutes.tasks_screen) {
        return MaterialPageRoute<void>(
          builder: (_) => TasksScreen(),
          settings: settings,
        );
      }
    }

    return MaterialPageRoute<void>(
      builder: (_) => InitialPage(),
      settings: settings,
    );
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
