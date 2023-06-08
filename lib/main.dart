import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'blocs/bloc_delegate.dart';
import 'blocs/bloc_exports.dart';
import 'routes/app_routes.dart';
import 'routes/pages.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...Pages.Blocer(context)],
      child: MaterialApp(
        title: 'Flutter Timer',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 4, 88, 121),
          colorScheme: const ColorScheme.light(
            brightness: Brightness.light,
            primary: Color.fromRGBO(4, 84, 99, 1),
            onPrimary: Colors.white,
            secondary: Color.fromRGBO(119, 204, 255, 1),
            onSecondary: Colors.lightBlue,
            error: Color.fromRGBO(187, 14, 14, 1),
            onError: Colors.red,
            background: Colors.amberAccent,
            onBackground: Colors.amber,
            surface: Colors.white,
            onSurface: Colors.white24,
          ),
        ),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [Pages.observer],
        initialRoute: AppRoutes.INITIAL,
        onGenerateRoute: Pages.GenerateRouteSettings,
      ),
    );
  }
}
