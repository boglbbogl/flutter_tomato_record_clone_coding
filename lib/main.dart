import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tomato_record_clone_coding/router/locations.dart';
import 'package:flutter_tomato_record_clone_coding/screens/start_screen.dart';
import 'package:flutter_tomato_record_clone_coding/screens/splash_screen.dart';
import 'package:flutter_tomato_record_clone_coding/status/user_provider.dart';
import 'package:provider/provider.dart';

final _routerDelegate = BeamerDelegate(
  guards: [
    BeamGuard(
        pathBlueprints: ['/'],
        check: (context, location) {
          return context.watch<UserProvider>().userState;
        },
        showPage: BeamPage(child: StartScreen()))
  ],
  locationBuilder: BeamerLocationBuilder(beamLocations: [
    HomeLocation(),
  ]),
);

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _splashLoadingWidget(snapshot),
          );
        });
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      return const Text('Error occur');
    } else if (snapshot.hasData) {
      return const TomatoApp();
    } else {
      return const SplashScreen();
    }
  }
}

class TomatoApp extends StatelessWidget {
  const TomatoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (BuildContext context) {
        return UserProvider();
      },
      child: MaterialApp.router(
          theme: ThemeData(
              primarySwatch: Colors.red,
              fontFamily: 'DoHyeon',
              hintColor: Colors.grey.shade300,
              textTheme: const TextTheme(
                  button: TextStyle(color: Colors.white),
                  subtitle1: TextStyle(color: Colors.black87, fontSize: 15),
                  subtitle2: TextStyle(color: Colors.grey, fontSize: 13)),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    primary: Colors.white,
                    minimumSize: const Size(48, 48)),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Colors.red,
                unselectedItemColor: Colors.black87,
              ),
              appBarTheme: const AppBarTheme(
                  actionsIconTheme: IconThemeData(color: Colors.black87),
                  elevation: 2,
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(color: Colors.black87))),
          routeInformationParser: BeamerParser(),
          routerDelegate: _routerDelegate),
    );
  }
}
