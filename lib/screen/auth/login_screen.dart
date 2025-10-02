
import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/constants/fonts.dart';
import 'package:ardilla/constants/image_asset.dart';
import 'package:ardilla/constants/text_string.dart';
import 'package:ardilla/screen/register/create_account_screen.dart';
import 'package:ardilla/store/login_store/login_store.dart';
import 'package:ardilla/utils/alert_dialog.dart';
import 'package:ardilla/utils/navigators.dart';
import 'package:ardilla/widgets/button.dart';
import 'package:ardilla/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key key,}) : super(key: key);
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginStore store = LoginStore();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    store.setupValidations();
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
                    //Image.asset(assetGetStarted, width: 428, height: 192,),
                    Image.asset(
                      assetColor,
                      width: 428,
                      height: 202,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0, top: 60, right: 8, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              popView(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: AppFonts.Cabinet_Grotesk,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Image.asset(logoIcon,
                                height: 49,
                                width: 148.91,
                                color: AppColors.whiteColor),
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
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
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
                        welcome,
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
                        welcomeText2,
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
                          hint: 'Email address or Kode Hex',
                          onChanged: (text) {
                            store.email = text;
                          },
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              assetMail,
                              height: 18,
                              width: 18,
                            ),
                          ),
                          message: store.error.email,
                          error: store.error.email != null,
                          color: AppColors.textColor3,
                          hintColor: AppColors.hintColor,
                          textColor: AppColors.textColor3,
                          focusedColor: AppColors.hintColor,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Observer(
                        builder: (_) => InputField(
                          controller: passwordController,
                          type: TextInputType.text,
                          hint: 'Password',
                          obscureText:store.passwordVisible,
                          onChanged: (text) {
                            store.password = text;
                          },
                          suffixIcon: store.passwordVisible
                              ? IconButton(
                                  icon: Image.asset(
                                    assetEyeOpen,
                                    height: 20,
                                  ),
                                  onPressed: () {
                                    store.passwordVisible = false;
                                  },
                                )
                              : IconButton(
                                  icon: Image.asset(
                                    assetEyeClosed,
                                    height: 20,
                                  ),
                                  onPressed: () {
                                    store.passwordVisible = true;
                                  },
                                ),
                          prefixIcon: Padding(
                            //padding: const EdgeInsets.only(left: 20, right: 4),
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              assetLock,
                              height: 18,
                              width: 18,
                            ),
                          ),
                          message: store.error.password,
                          error: store.error.password != null,
                          color: AppColors.textColor3,
                          hintColor: AppColors.hintColor,
                          textColor: AppColors.textColor3,
                          focusedColor: AppColors.hintColor,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            //Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: AppColors.lightPurpleColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFonts.Cabinet_Grotesk,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Observer(
                        builder: (ctx) => Container(
                          height: 54,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.lightPurpleColor,
                              ),
                              borderRadius: BorderRadius.circular(24.0)),
                          width: double.infinity,
                          child: Button(
                              text: 'Log In',
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                  store.submit(context, (s) {
                                  }, (e) {
                                    showCustomDialog(context, "Notification", e);
                                  });
                              },
                              loading: store.loading,
                              loaderColor: Colors.white,
                              textColor: Colors.white,
                              color: AppColors.lightPurpleColor),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          height: 54,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.lightPurpleColor,
                              ),
                              borderRadius: BorderRadius.circular(24.0)),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                assetScan,
                                height: 21.75,
                                width: 21.75,
                              ),
                              SizedBox(
                                width: 13.05,
                              ),
                              Text(
                                'Sign in with SAN ID',
                                style: TextStyle(
                                    fontSize: 15.52,
                                    fontFamily: AppFonts.Cabinet_Grotesk,
                                    color: AppColors.lightPurpleColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          )
                          // Button(
                          //
                          //     text: 'Sign in with SAN ID',
                          //     onPressed:  () {
                          //       FocusScope.of(context).unfocus();
                          //
                          //     },
                          //     //loading: registerStore.loading,
                          //     loaderColor: Colors.white,
                          //     textColor: AppColors.lightPurpleColor,
                          //     color:  AppColors.whiteColor
                          // ),
                          ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                          child: RichText(
                            text: TextSpan(
                              text: 'New user?',
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppFonts.Cabinet_Grotesk,
                                  fontStyle: FontStyle.normal),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: ' Create Account',
                                    style: TextStyle(
                                        color: AppColors.lightPurpleColor,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppFonts.Cabinet_Grotesk,
                                        fontStyle: FontStyle.normal)),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, CreateAccountScreen.routeName);
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
