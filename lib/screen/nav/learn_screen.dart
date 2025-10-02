import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/constants/fonts.dart';
import 'package:flutter/material.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({Key key}) : super(key: key);
  static const routeName = '/learn';

  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPurpleColor,
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/learn.png", color: AppColors.whiteColor,),
            Text("Learn",
              //textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: AppFonts.Cabinet_Grotesk,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: AppColors.whiteColor
              ),
            ),
          ],),
      ),
    );
  }
}
