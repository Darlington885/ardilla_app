import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/constants/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({Key key}) : super(key: key);
  static const routeName = '/save';

  @override
  _SaveScreenState createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPurpleColor,
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset("assets/images/save.png", color: AppColors.whiteColor,),
            Text("Save",
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
