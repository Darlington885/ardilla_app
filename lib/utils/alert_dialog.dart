import 'dart:async';

import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/constants/fonts.dart';
import 'package:ardilla/constants/image_asset.dart';
import 'package:ardilla/screen/auth/login_screen.dart';
import 'package:ardilla/utils/navigators.dart';
import 'package:flutter/material.dart';


class ForgotPinDialog extends StatefulWidget {
  const ForgotPinDialog({Key key}) : super(key: key);

  @override
  _ForgotPinDialogState createState() => _ForgotPinDialogState();
}

class _ForgotPinDialogState extends State<ForgotPinDialog> {
  @override
  Widget build(BuildContext context,) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Container(
          height: 154,
          width: 327,
          decoration: BoxDecoration(
            color: Colors.white,
            //color: AppColors.containerFillColor3,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 40,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Are you sure you want to LOG OUT?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.lightPurpleColor,
                          fontFamily:  AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  InkWell(
                    onTap: (){
                      navigate(context, LoginScreen());
                    },
                    child: Container(
                      height: 44, width: 89,
                      decoration: BoxDecoration(
                          color: AppColors.lightRedColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Align(alignment: Alignment.center,
                        child: Text(
                          "Confirm",

                          style: TextStyle(
                            color: AppColors.pinkColor,
                            fontFamily:  AppFonts.Cabinet_Grotesk,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                    SizedBox(
                      width: 20,
                    ),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 44, width: 89,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Align(alignment: Alignment.center,
                        child: Text(
                          "No, Cancel",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily:  AppFonts.Cabinet_Grotesk,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],)

              ],
            ),
          ),
        ));
  }
}



class ShopliteDialog extends StatefulWidget {
  const ShopliteDialog({Key key, this.title, this.img}) : super(key: key);

  final String title;
  final String img;

  @override
  _ShopliteDialogState createState() => _ShopliteDialogState();
}

class _ShopliteDialogState extends State<ShopliteDialog> {

  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  static const double padding = 20;
  static const double avatarRadius = 45;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 210,
          width: 279,

          padding: EdgeInsets.only(left: padding,top: 5
              + padding, right: 10,bottom: padding
          ),
          margin: EdgeInsets.only(top: avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(padding),
              boxShadow: [
                BoxShadow(color: Colors.transparent,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),

          child: PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              SingleChildScrollView(
                child: Container(

                  padding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      SizedBox(height: 10.0),

                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontFamily:  AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Image.asset(
                        widget.img,
                        width: 74,
                        height: 74,
                        // color: Colors.black,
                        // colorBlendMode: BlendMode.color,
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}


class CustomPopupDialog extends StatefulWidget {


  final String title, description, buttonText;
  final String img;
  final VoidCallback onButtonPressed;

  const CustomPopupDialog({this.title, this.description, this.buttonText, this.img, this.onButtonPressed});


  @override
  _CustomPopupDialogState createState() => _CustomPopupDialogState();
}

class _CustomPopupDialogState extends State<CustomPopupDialog> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  static const double padding = 20;
  static const double avatarRadius = 45;

  @override
  Widget build(BuildContext context) {


    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 400,
          width: 320,

          padding: EdgeInsets.only(left: padding,top: 5
              + padding, right: 10,bottom: padding
          ),
          margin: EdgeInsets.only(top: avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(padding),
              boxShadow: [
                BoxShadow(color: Colors.transparent,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),

          child: PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              SingleChildScrollView(
                child: Container(

                  padding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap:(){
                                popView(context);

                              },
                              child: Image.asset(assetImageCancel, height: 32, width: 32)),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),

                      SizedBox(height: 10.0),
                      Image.asset(
                        widget.img,
                        width: 74,
                        height: 74,
                        // color: Colors.black,
                        // colorBlendMode: BlendMode.color,
                      ),
                      SizedBox(height: 0.0),
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontFamily:  AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.description,
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w400,
                                fontFamily:  AppFonts.Cabinet_Grotesk,
                                fontSize: 14.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          InkWell(
                            onTap: widget.onButtonPressed,
                            child: Container(
                              width: 140,
                              decoration: BoxDecoration(
                                color: AppColors.lightPurpleColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Center(
                                  child: Text(
                                    widget.buttonText,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: AppFonts.Cabinet_Grotesk,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Button(
                          //   text: 'See whats new',
                          //   color: AppColors.primaryColor,
                          //   textColor: Colors.white,
                          //   onPressed: () {
                          //     Navigator.of(context).pop();
                          //   },
                          // ),
                          //
                          // Button(
                          //   text: 'Proceed to Dashboard',
                          //   color: AppColors.primaryColor,
                          //   textColor: Colors.white,
                          //   onPressed: () {
                          //     Navigator.of(context).pop();
                          //   },
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //
                          //   },
                          //   child: Text(
                          //     'Proceed to Dashboard',
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //         color: secondaryColor,
                          //         fontFamily: AppFonts.Arial,
                          //         fontWeight: FontWeight.w700,
                          //         fontSize: 18.0,
                          //         decoration: TextDecoration.underline),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20.0,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Positioned(
        //   // top: 3,
        //   left: padding,
        //   right: padding,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.transparent,
        //     radius: avatarRadius,
        //     child: ClipRRect(
        //         borderRadius: BorderRadius.all(Radius.circular(avatarRadius)),
        //         child: Image.asset('assets/images/confetti.png',)
        //       // Image.asset(widget.img)
        //     ),
        //   ),
        // ),
      ],
    );
  }
}





class TransferDialog extends StatefulWidget {
  const TransferDialog({Key key}) : super(key: key);

  @override
  _TransferDialogState createState() => _TransferDialogState();
}

class _TransferDialogState extends State<TransferDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Container(
          height: 210,
          width: 279,
          decoration: BoxDecoration(
            color: Colors.white,
            //color: AppColors.containerFillColor3,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 40,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Funded \nsucessfully",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontFamily:  AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Image.asset(
                  "assets/images/successicon.png",
                  height: 108,
                  width: 108,
                ),

              ],
            ),
          ),
        ));
  }
}


openDialog(Widget widget, BuildContext context, {barrierDismissible = false,}) {
  showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return widget;
      });
}

void showCustomDialog(BuildContext context, String title,  String message) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext cxt) {
      return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            child: Material(
              //color: AppColors.blackColor,
              color: Colors.white,
              shape: Border(
                left: BorderSide(
                  width: 4,
                  //color: Color(0xFFE2494E).withOpacity(0.1),
                  color: AppColors.inactiveColor,
                ),

              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            //color: AppColors.whiteColor,
                            color: AppColors.blackColor,
                            fontFamily:  AppFonts.Cabinet_Grotesk,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                        ),

                        Spacer(),

                        InkWell(
                            onTap:(){
                              Navigator.of(cxt).pop();

                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                //color: Color(0xFFE2494E).withOpacity(0.1),
                                color: Color(0xFFFFFFFF),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(Icons.close, size: 30, color: AppColors.blackColor ),
                              ),
                            )
                          //Image.asset(assetImageCancel, height: 32, width: 32,),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),


                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            message ?? "",

                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppFonts.Cabinet_Grotesk,
                              fontSize: 12.0,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

void showCustomSuccessDialog(BuildContext context, String title,  String message) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext cxt) {
      Future.delayed(Duration(seconds: 4), () {
        Navigator.of(cxt).pop(true);
      });
      return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            child: Material(
              color: AppColors.blackColor,
              // color: Colors.white,
              shape: Border(
                left: BorderSide(
                  width: 4,
                  //color: Color(0xFFE2494E).withOpacity(0.1),
                  //color: AppColors.primarySecondaryColor,
                  color: AppColors.inactiveColor,
                ),

              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontFamily: AppFonts.Cabinet_Grotesk,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                        ),

                        Spacer(),

                        InkWell(
                            onTap:(){
                              Navigator.of(cxt).pop();

                            },
                            child: Image.asset(assetImageCancel, height: 32, width: 32,)),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),


                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            message ?? "",

                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppFonts.Cabinet_Grotesk,
                              fontSize: 12.0,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}