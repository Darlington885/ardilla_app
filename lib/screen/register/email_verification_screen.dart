import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/constants/fonts.dart';
import 'package:ardilla/constants/image_asset.dart';
import 'package:ardilla/constants/text_string.dart';
import 'package:ardilla/screen/register/create_account_screen.dart';
import 'package:ardilla/utils/maths.dart';
import 'package:ardilla/utils/navigators.dart';
import 'package:ardilla/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key key}) : super(key: key);
  static const routeName = '/email';

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 60),
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  popView(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    assetBackArrow,
                    height: 18.95,
                    width: 10.85,
                    //color: AppColors.textColor,
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),

          SizedBox(
            height: 20.0,
          ),
          Image.asset(
            assetEmail,
            height: 259,
            width: 356,
          ),
          //SizedBox(height: 124.81,),
          SizedBox(height: 30),
          Text(
            emailText,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: AppFonts.Cabinet_Grotesk,
                fontWeight: FontWeight.w700,
                fontSize: 30,
                fontStyle: FontStyle.normal,
                color: AppColors.textColor2),
          ),
          SizedBox(height: 30),
          Container(
            height: 54,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.lightPurpleColor,
                ),
                borderRadius: BorderRadius.circular(24.0)),
            width: double.infinity,
            child: Button(
                text: 'Open Email App',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
                //loading: registerStore.loading,
                loaderColor: Colors.white,
                textColor: AppColors.lightPurpleColor,
                color: AppColors.whiteColor),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 54,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.lightPurpleColor,
                ),
                borderRadius: BorderRadius.circular(24.0)),
            width: double.infinity,
            child: Button(
                text: 'Continue',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pushNamed(context, CreateAccountScreen.routeName);
                },
                //loading: registerStore.loading,
                loaderColor: Colors.white,
                textColor: Colors.white,
                color: AppColors.lightPurpleColor),
          ),
        ],
      ),
    );
  }
}
