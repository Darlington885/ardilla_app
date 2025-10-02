import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/constants/fonts.dart';
import 'package:ardilla/constants/image_asset.dart';
import 'package:ardilla/constants/text_string.dart';
import 'package:ardilla/screen/register/register_screen.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key key}) : super(key: key);
  static const routeName = '/onboarding';

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      "Skip",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          color: AppColors.lightPurpleColor),
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              onboarding,
              height: 373,
              width: 382,
            ),
            Text(
              "Lorem Ipsum Kip \nAntares Lorem",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: AppFonts.Cabinet_Grotesk,
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  fontStyle: FontStyle.normal,
                  color: AppColors.purpleColor),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              onboardinText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: AppFonts.Cabinet_Grotesk,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  color: AppColors.textColor),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  assetProgress,
                  height: 7.0,
                  width: 46.67,
                ),
                Text(
                  "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: Colors.white),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                    child: Image.asset(
                      assetButton,
                      height: 87,
                      width: 87,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
