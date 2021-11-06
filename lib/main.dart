import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tomato_record_clone_coding/router/locations.dart';
import 'package:flutter_tomato_record_clone_coding/screens/auth_screen.dart';
import 'package:flutter_tomato_record_clone_coding/screens/splash_screen.dart';

final _routerDelegate = BeamerDelegate(
  guards: [
    BeamGuard(
        pathBlueprints: ['/'],
        check: (context, location) {
          return false;
        },
        showPage: BeamPage(child: AuthScreen()))
  ],
  locationBuilder: BeamerLocationBuilder(beamLocations: [
    HomeLocation(),
  ]),
);

void main() {
  // logger.d('message');
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
    return MaterialApp.router(
        theme: ThemeData(
          primaryColor: Colors.red,
          fontFamily: 'DoHyeon',
          hintColor: Colors.grey.shade300,
        ),
        routeInformationParser: BeamerParser(),
        routerDelegate: _routerDelegate);
  }
}
