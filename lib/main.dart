import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';
import 'router/routes.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup orientation
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key key}) : super(key: key);
  static const routeName = '/myApp';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:  SplashScreen.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,

    );


        // return DevicePreview(
        // enabled: true,
        // builder: (BuildContext context) {
        //    return MaterialApp(
        //       useInheritedMediaQuery: true,
        //       builder: DevicePreview.appBuilder,
        //       debugShowCheckedModeBanner: false,
        //       showPerformanceOverlay: false,
        //       initialRoute: SplashScreen.routeName,
        //       onGenerateRoute: RouteGenerator.generateRoute,
        //     );
        // });

  }
}
