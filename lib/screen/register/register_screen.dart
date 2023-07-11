import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/constants/fonts.dart';
import 'package:ardilla/constants/image_asset.dart';
import 'package:ardilla/constants/text_string.dart';
import 'package:ardilla/screen/auth/login_screen.dart';
import 'package:ardilla/screen/register/email_verification_screen.dart';
import 'package:ardilla/store/account_store/account_store.dart';
import 'package:ardilla/utils/navigators.dart';
import 'package:ardilla/widgets/button.dart';
import 'package:ardilla/widgets/input_field.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


var accountStore = AccountStore();
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);
  static const routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  bool proceedButtonActive = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    accountStore.setupValidations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceW = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightPurpleColor,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(

            child: Column(
              children: [
                Stack(
                  children: [
//Image.asset(assetGetStarted, width: 428, height: 302,),
                    Image.asset(
                      assetColor,
                      width: 428,
                      height: 202,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, top: 60, right: 8, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              popView(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  // shape: BoxShape.circle,
                                  // color: AppColors.mintGreen,
                                  ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(assetBackArrow,
                                    height: 18.95,
                                    width: 10.85,
                                    color: AppColors.whiteColor),
                              ),
                            ),
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Center(
                        child: Image.asset(logoIcon,
                            height: 49,
                            width: 148.91,
                            color: AppColors.whiteColor),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                  //width: size.width/1.07,
                  width: deviceW / 1.07,
                  height: 15,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor2.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 36.0),
                  height: 810,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(17),
                        topRight: Radius.circular(17),
                      )),
                  child: ListView(
                    children: [
                      Text(
                        getStarted,
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: AppFonts.Cabinet_Grotesk,
                            fontWeight: FontWeight.w700,
                            fontSize: 36,
                            fontStyle: FontStyle.normal,
                            color: AppColors.textColor2),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        welcomeText,
                        style: TextStyle(
                            fontFamily: AppFonts.Cabinet_Grotesk,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            color: AppColors.textColor),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Observer(
                        builder: (_) => InputField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          hint: 'Email address',
                          onChanged: (text) {
                            accountStore.email = text;
                            if (text.contains(".com") &&
                                emailController.text.length > 3)
                              setState(() {
                                proceedButtonActive = true;
                              });
                            else
                              setState(() {
                                proceedButtonActive = false;
                              });
                          },
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              assetMail,
                              height: 18,
                              width: 18,
                            ),
                          ),
                          message: accountStore.error.email,
                          error: accountStore.error.email != null,
                          color: AppColors.textColor3,
                          hintColor: AppColors.hintColor,
                          textColor: AppColors.textColor3,
                          focusedColor: AppColors.hintColor,
                        ),
                      ),
                      SizedBox(
                        height: 200.0,
                      ),
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: proceedButtonActive
                                    ? AppColors.lightPurpleColor
                                    : AppColors.inactiveColor),
                            borderRadius: BorderRadius.circular(24.0)),
                        width: double.infinity,
                        child: Button(
                            text: 'Continue',
                            onPressed: proceedButtonActive
                                ? () {
                                    FocusScope.of(context).unfocus();
                                    Navigator.pushNamed(context,
                                        EmailVerificationScreen.routeName);
                                  }
                                : null,
                            loading: accountStore.loading,
                            loaderColor: Colors.white,
                            textColor: Colors.white,
                            color: proceedButtonActive
                                ? AppColors.lightPurpleColor
                                : AppColors.inactiveColor),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: InkWell(
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account?',
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppFonts.Cabinet_Grotesk,
                                  fontStyle: FontStyle.normal),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: ' Sign in',
                                    style: TextStyle(
                                        color: AppColors.lightPurpleColor,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppFonts.Cabinet_Grotesk,
                                        fontStyle: FontStyle.normal)),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
