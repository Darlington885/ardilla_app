import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/constants/fonts.dart';
import 'package:ardilla/constants/image_asset.dart';
import 'package:ardilla/utils/alert_dialog.dart';
import 'package:ardilla/utils/launch_web.dart';
import 'package:ardilla/utils/navigators.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class LeftMenuScreen extends StatefulWidget {
  const LeftMenuScreen({Key key}) : super(key: key);
  static const routeName = '/left';

  @override
  _LeftMenuScreenState createState() => _LeftMenuScreenState();
}

class _LeftMenuScreenState extends State<LeftMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lightPurpleColor,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 8, 24, 0),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(assetProfileImage, height: 51.0, width: 51.0,),
                InkWell(
                  onTap: (){
                    popView(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColors.lightPurpleColor,
                    size: 25,
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              "Anita Ojieh",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: AppFonts.Cabinet_Grotesk,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.51,
                  fontStyle: FontStyle.normal,
                  color: AppColors.whiteColor),
            ),
          ),

SizedBox(height: 37.0,),

          buildMenu(icon: "assets/images/profile.png", name: "Profile",
                 onMenuPressed:  () {

              }),

          buildMenu(icon: "assets/images/porfolio.png",name: "Portfolio",
               onMenuPressed:  () {

              }),

          buildMenu(icon: "assets/images/payment_icon.png", name: "Payment",
             onMenuPressed:      () {

              }),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ListTile(
                horizontalTitleGap: 2,
                leading: Image.asset(
                  "assets/images/investment.png",
                  height: 20,
                  width: 20,
                ),
                title: Row(
                  children: [
                    Text(
                      "Investment",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          color: AppColors.whiteColor),
                    ),
                    //Image.asset(imageText)
                  ],
                ),
                trailing: Container(
                  margin: EdgeInsets.only(right: 80),
                  height: 19.3,
                  width: 50.31,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.whiteColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child:   Text(
                      "Coming soon",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w500,
                          fontSize: 5.2,
                          fontStyle: FontStyle.normal,
                          color: AppColors.whiteColor),

                    ),
                  ),
                )
            ),
          ),
          // buildMenu(icon: "assets/images/investment.png",name: "Investment",
          //     //image: "assets/images/check.png",
          //        onMenuPressed:  () {
          //       // pushNewScreenWithRouteSettings(
          //       //   context,
          //       //   // settings: RouteSettings(name: SettingsScreen.routeName),
          //       //   // screen: SettingsScreen(),
          //       //   withNavBar: false,
          //       //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
          //       // );
          //     }),
          // buildMenu(icon: "assets/images/insurance.png", name: "Insurance",
          //     //image: "assets/images/check.png",
          //      onMenuPressed:    () {
          //
          //     }),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ListTile(
                horizontalTitleGap: 2,
                leading: Image.asset(
                  "assets/images/insurance.png",
                  height: 20,
                  width: 20,
                ),
                title: Row(
                  children: [
                    Text(
                      "Insurance",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          color: AppColors.whiteColor),
                    ),
                    //Image.asset(imageText)
                  ],
                ),
                trailing:  Container(
                  margin: EdgeInsets.only(right: 80),
                  height: 19.3,
                  width: 50.31,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.whiteColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child:   Text(
                      "Coming soon",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w500,
                          fontSize: 5.2,
                          fontStyle: FontStyle.normal,
                          color: AppColors.whiteColor),

                    ),
                  ),
                )
            ),
          ),

          buildMenu(icon: "assets/images/budget.png", name: "Budgeting", onMenuPressed:
                  () {

              }),


          SizedBox(
            height: 36,
          ),
          buildMenu(icon: "assets/images/logout.png", name: "Logout",onMenuPressed:
                  () {
                    openDialog(
                        ForgotPinDialog(),
                        context,
                        barrierDismissible: false

                    );
              }),

        ],
      ),
    );
  }

  buildMenu({String icon, String name, VoidCallback onMenuPressed, String imageText}) {
    return InkWell(
      onTap: onMenuPressed,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child:
        ListTile(
          horizontalTitleGap: 2,
          leading: Image.asset(
            icon,
            height: 20,
            width: 20,
          ),
          title: Row(
            children: [
              Text(
                name,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: AppFonts.Cabinet_Grotesk,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: AppColors.whiteColor),
              ),
             //Image.asset(imageText)
            ],
          ),
          //trailing: Image.asset(imageText)
        ),
      ),
    );
  }
}


