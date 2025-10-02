
import 'package:ardilla/main.dart';
import 'package:ardilla/screen/auth/login_screen.dart';
import 'package:ardilla/screen/dashboard/dashboard_screen.dart';
import 'package:ardilla/screen/dashboard/left_menu_screen.dart';
import 'package:ardilla/screen/nav/home_screen.dart';
import 'package:ardilla/screen/onboarding/onboarding_screen.dart';
import 'package:ardilla/screen/register/email_verification_screen.dart';
import 'package:ardilla/screen/register/create_account_screen.dart';
import 'package:ardilla/screen/register/register_screen.dart';
import 'package:ardilla/screen/nav/save_screen.dart';
import 'package:ardilla/splash_screen.dart';
import 'package:ardilla/video.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case MyApp.routeName:
        return MaterialPageRoute(builder: (_) => MyApp());
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case SaveScreen.routeName:
      case Onboarding.routeName:
        return MaterialPageRoute(builder: (_) => Onboarding());
      // case PlayerVideoAndPopPage.routeName:
      //   return MaterialPageRoute(builder: (_) => PlayerVideoAndPopPage());
      case CreateAccountScreen.routeName:
        return MaterialPageRoute(builder: (_) => CreateAccountScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case EmailVerificationScreen.routeName:
        return MaterialPageRoute(builder:  (_) => EmailVerificationScreen());
      case LeftMenuScreen.routeName:
        return MaterialPageRoute(builder: (_) => LeftMenuScreen());
    case DashBoardScreen.routeName:
        return MaterialPageRoute(builder: (_) => DashBoardScreen());



      default:
      // If there is no such named route in the switch statement, e.g. /third
      // return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}