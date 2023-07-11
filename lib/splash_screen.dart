import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/image_asset.dart';
import 'screen/onboarding/onboarding_screen.dart';
import 'utils/navigators.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  static const routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Timer(Duration(seconds: 5), () async{
      navigateReplace(context,  Onboarding());

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        // statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light
      ),
      child: Container(
        decoration: new BoxDecoration(
          //image: DecorationImage(image: AssetImage("assets/images/splash.png"), fit: BoxFit.cover),
          image: DecorationImage(image: AssetImage("assets/images/Splash screen.png"), fit: BoxFit.cover),

        ),
        child: Center(
            child: Image.asset(appLogo, height: 169, width: 154.07, color: Colors.white,)
        ),
      ),
    );
  }
}
