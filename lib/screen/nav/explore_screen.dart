import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/constants/fonts.dart';
import 'package:ardilla/constants/text_string.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/image_asset.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  int _current = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:AppColors.fuschiaPinkColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            padding: const EdgeInsets.only(
                top: 100.0, left: 20.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [

                Text(
                  'Explore',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.start,
                ),

              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight:  Radius.circular(30))
              ),

              child:  ListView(

                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Savings',
                      style: TextStyle(
                          color: AppColors.yellowColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppFonts.Cabinet_Grotesk,
                          fontStyle: FontStyle.normal),
                      children: const <TextSpan>[
                        TextSpan(
                            text: ' At Your Pace',
                            style: TextStyle(
                                color: AppColors.purpleColor,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFonts.Cabinet_Grotesk,
                                fontStyle: FontStyle.normal)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    exploreText,
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
                  CarouselSlider(
                    items: [
                     savingOptions(
                       containerColor: AppColors.fuschiaPinkColor,
                       image:"assets/images/caution_icon.png",
                       labelTitle: "Dreams",
                         labelSubTitle: dreamText,
                       labelSubTitle2: "Create Dreams Plan"
                     ),
                      savingOptions(
                        containerColor: AppColors.yellowColor,
                          image:"assets/images/pig_icon.png",
                          labelTitle: "DIB",
                          labelSubTitle: pigText,
                          labelSubTitle2: "Create DIB Plan"
                      ),
                      savingOptions(
                        containerColor: AppColors.darkGreenColor,
                          image:"assets/images/vault.png",
                          labelTitle: "Vault",
                          labelSubTitle: vaultText,
                          labelSubTitle2: "Create Vault Plan"
                      )
                    ],
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 2.0,
                        viewportFraction: 1,
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 500),
                        onPageChanged: (index, carouselReason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
      SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                      text: 'What Works',
                      style: TextStyle(
                          color: AppColors.purpleColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppFonts.Cabinet_Grotesk,
                          fontStyle: FontStyle.normal),
                      children: const <TextSpan>[
                        TextSpan(
                            text: ' For You?',
                            style: TextStyle(
                                color: AppColors.yellowColor,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFonts.Cabinet_Grotesk,
                                fontStyle: FontStyle.normal)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    talkText,
                    style: TextStyle(
                        fontFamily: AppFonts.Cabinet_Grotesk,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        color: AppColors.textColor),
                  ),
                  SizedBox(height: 20,),
                  CarouselSlider(
                    items: [
                      exploreImage(startColor: Color.fromRGBO(136, 7, 247, 0.1), endColor: Color.fromRGBO(217, 217, 217, 0),
                          title: "Go\nAutomated",
                          image: "assets/images/solid.png",
                          title2: "20% Monthly ROI", subtitle: "Start Investing",
                          titleColor: AppColors.purpleColor, subTitleColor: AppColors.lightPurpleColor, titleColor2: AppColors.hintColor
                      ),exploreImage(
                          startColor: Color.fromRGBO(230, 53, 109, 0.1), endColor: Color.fromRGBO(217, 217, 217, 0),
                          //startColor: Color.fromRGBO(230, 53, 109, 0.1), endColor: Color.fromRGBO(249, 249, 249, 0),
                          title: "Go\nCustom",
                          image: "assets/images/plus_select_icon.png",
                          title2: "20% Monthly ROI", subtitle: "Start Investing",
                          titleColor: AppColors.fairPinkColor, subTitleColor: AppColors.fairPinkColor, titleColor2: AppColors.hintColor
                      ),
                    ],
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlay: false,
                        aspectRatio: 2.0,
                        viewportFraction: 1,
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 500),
                        onPageChanged: (index, carouselReason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
SizedBox(height: 40,),
                  Divider(color: AppColors.fuschiaPinkColor, thickness: 4.0,),
                  Container(
                    //padding: EdgeInsets.only(top: 40),
                    height: 400,
                    decoration: BoxDecoration(
                     // border: Border.all(color: AppColors.fuschiaPinkColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        SizedBox(height: 10,),
Row(children: [
  paymentOptions(image:  "assets/images/send_e.png" , text: "Top Up", color: AppColors.pinkishColor, textColor: AppColors.fuschiaPinkColor),
  paymentOptions(image: "assets/images/send_explore.png" , text: "Requests", color: AppColors.lightYellowColor, textColor: AppColors.yellowColor),
  paymentOptions(image: "assets/images/vex.png", text: "Transfer", color: AppColors.lightPurpleColor2, textColor: AppColors.purpleColor)
],), SizedBox(height: 20,),

                        Row(
                          children: [
                            Text(
                              "Search for friends",
                              style: TextStyle(
                                  fontFamily: AppFonts.Cabinet_Grotesk,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.25,
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.lightPurpleColor),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios, size: 10,)
                          ],
                        ),

                        SizedBox(height: 20,),
                        Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                              peopleDisplay(name: "Cadet <Annie/>", image: "assets/images/profile_image.png"),
                              peopleDisplay(name: "Cadet <Nike/>"),
                              peopleDisplay(name: "Cadet <Faith/>", image: "assets/images/profile_image.png"),
                              peopleDisplay(name: "Cadet <Annie/>"),

                        ],),
                        SizedBox(height: 20,),

                        Row(
                          children: [
                            Text(
                              "Transactions",
                              style: TextStyle(
                                  fontFamily: AppFonts.Cabinet_Grotesk,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.25,
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.lightPurpleColor),
                            ),
                            Spacer(),
                            Text(
                              "View all",
                              style: TextStyle(
                                  fontFamily: AppFonts.Cabinet_Grotesk,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.25,
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.lightPurpleColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 60,
                          child:
                          ListView(
                            scrollDirection: Axis.horizontal,
                           children: [
                             Row(children: [
                               Padding(
                                 padding: const EdgeInsets.only(bottom: 20),
                                 child: Image.asset("assets/images/withdrawal_Icon.png", height: 50, width: 50,),
                               ),
                               SizedBox(width: 10,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     "Transfer to SAN",
                                     style: TextStyle(
                                         fontFamily: AppFonts.Cabinet_Grotesk,
                                         fontWeight: FontWeight.w500,
                                         fontSize: 12.25,
                                         fontStyle: FontStyle.normal,
                                         color: AppColors.purpleColor),
                                   ),
                                   Text(
                                     "Tue, 22nd December, 2022",
                                     style: TextStyle(
                                         fontFamily: AppFonts.Cabinet_Grotesk,
                                         fontWeight: FontWeight.w500,
                                         fontSize: 12.25,
                                         fontStyle: FontStyle.normal,
                                         color: AppColors.lightPurpleColor),
                                   ),
                                 ],),
SizedBox(width: 20,),
                               Container(
height: 20, width: 40,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(12),
                                   color: Color.fromRGBO(229, 250, 237, 1,)
                                 ),
                                 child:  Center(
                                   child: Text(
                                     "Successful",
                                     style: TextStyle(
                                         fontFamily: AppFonts.Cabinet_Grotesk,
                                         fontWeight: FontWeight.w500,
                                         fontSize: 7.5,
                                         fontStyle: FontStyle.normal,
                                         color: Color.fromRGBO(34, 197, 94,1)),
                                   ),
                                 ),
                               )
                             ],)
                           ],
                          ),),
                        Text(
                          "Dilla",
                          style: TextStyle(
                              fontFamily: AppFonts.Cabinet_Grotesk,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              color: AppColors.lightPurpleColor),
                        ),
                        SizedBox(height: 20,),
                        Row(children: [
                          Text(
                            "Request and send money to your\nfriends and family ",
                            style: TextStyle(
                                fontFamily: AppFonts.Cabinet_Grotesk,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                color: AppColors.lightPurpleColor),
                          ),
                          Spacer(),
                          Container(
                            height: 40, width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.fuschiaPinkColor
                            ),
                            child:  Center(
                              child: Text(
                                "Go To Dilla",
                                style: TextStyle(
                                    fontFamily: AppFonts.Cabinet_Grotesk,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.5,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.whiteColor),
                              ),
                            ),
                          )
                        ],)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget peopleDisplay({String name, String image = "assets/images/guy.png"}){
    return  Column(
      children: [
        Image.asset(image, height: 60, width: 60,),
        SizedBox(height: 10,),
        Text(name,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: AppFonts.Cabinet_Grotesk,
              fontWeight: FontWeight.w500,
              fontSize: 8.50,
              fontStyle: FontStyle.normal,
              color: AppColors.purpleColor
          ),
        ) ,
      ],
    );
  }

  Widget paymentOptions({String image, String text, Color color, Color textColor}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
        width: 110.45,
        height: 60.94,
        decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child:Row(children: [
        Expanded(child: Image.asset(image, height: 26.34, width: 16.25,)),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                fontFamily: AppFonts.Cabinet_Grotesk,
                fontWeight: FontWeight.w500,
                fontSize: 12.25,
                fontStyle: FontStyle.normal,
                color: textColor),
          ),
        ),

      ],),
    );
  }

  Widget savingOptions({String image, String labelTitle,String labelSubTitle,String labelSubTitle2,  Color containerColor}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 209.15,
      width: 370.71,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            opacity: 0.7,
            scale: 3.9,
            image: AssetImage(
              assetCurves,
            ),
            alignment: Alignment.bottomRight,
            fit: BoxFit.scaleDown
          // This align it Center Left + a little bit up
        ),
      ),
      child: Row(children: [
        Image.asset(image, height: 56, width: 80.23,),
        SizedBox(width: 10,),
        Column(
crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.only(top: 38),
            child: Text(
              labelTitle,
              style: TextStyle(
                  fontFamily: AppFonts.Cabinet_Grotesk,
                  fontWeight: FontWeight.w500,
                  fontSize: 19.25,
                  fontStyle: FontStyle.normal,
                  color: AppColors.whiteColor),
            ),
          ),
          SizedBox(height: 10,),
          Text(
            labelSubTitle,
            style: TextStyle(
                fontFamily: AppFonts.Cabinet_Grotesk,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontStyle: FontStyle.normal,
                color: AppColors.whiteColor),
          ),
            SizedBox(height: 10,),
            Row(children: [
              Text(
                labelSubTitle2,
                style: TextStyle(
                    fontFamily: AppFonts.Cabinet_Grotesk,
                    fontWeight: FontWeight.w700,
                    fontSize: 9.63,
                    fontStyle: FontStyle.normal,
                    color: AppColors.whiteColor),
              ),
              Icon(Icons.arrow_forward_ios_outlined, size: 10, color: AppColors.whiteColor,)
            ],)
        ],)
      ],),
    );
  }

  Widget exploreImage({Color startColor, Color endColor, String image,
    String title, String title2, String subtitle, Color titleColor, Color titleColor2, Color subTitleColor}){
    return Container(
      padding: EdgeInsets.only(right: 20, top: 20, left: 20),
      height: 239,
      width: 335,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              stops: [
                0.0,
                1.0
              ],
              colors: [

                startColor,
                //Color.fromRGBO(249, 249, 249, 1),
                endColor,
              ])
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: 10,),
        Row(
          children: [
           Spacer(), Image.asset(image, height: 63.44, width: 101,),
          ],
        ),
        // SizedBox(height: 10,),
        Text(title,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: AppFonts.Cabinet_Grotesk,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontStyle: FontStyle.normal,
              color: titleColor
          ),
        ),
        //SizedBox(height: 19.91,),
        Spacer(),
          Text("Lorem Ipsum",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: AppFonts.Cabinet_Grotesk,
                fontWeight: FontWeight.w700,
                fontSize: 11.06,
                fontStyle: FontStyle.normal,
                color: subTitleColor
            ),
          ),

      ],),
    );
  }

}
