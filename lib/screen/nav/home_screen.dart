import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/constants/fonts.dart';
import 'package:ardilla/constants/image_asset.dart';
import 'package:ardilla/utils/greeting.dart';
import 'package:ardilla/utils/launch_web.dart';
import 'package:ardilla/utils/maths.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ardilla/screen/dashboard/left_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final CarouselController _controller = CarouselController();

  int _current = 0;
  int currentIndex = 0;
  bool isHidden = false;

  bool nairaVisible = true;
  bool dollarVisible = false;
  bool sharedVisible = false;

  final List<String> imageList = [
    'https://rebrand.ly/y41zb4a',
    'https://rebrand.ly/5dikg0x',
    'https://rebrand.ly/lkdjaol'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceW = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer:LeftMenuScreen() ,
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 80.0, left: 10.0, right: 10.0, bottom: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Positioned(
                //   top: 60,
                //   left: 1,
                //   right: 1,
                //   child: Container(
                //     color: AppColors.whiteColor,
                //     child: ListTile(
                //       leading: InkWell(
                //           onTap: (){
                //             print("Clicked");
                //             _scaffoldKey.currentState.openDrawer();
                //           },
                //           child:Image.asset(assetProfileImage)
                //       ),
                //       title: Row(
                //         children: [
                //           Text("Good ${greeting()}.",
                //             textAlign: TextAlign.start,
                //             style: TextStyle(
                //                 fontFamily: AppFonts.Cabinet_Grotesk,
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 12,
                //                 fontStyle: FontStyle.normal,
                //                 color: AppColors.hintColor
                //             ),
                //           ),
                //           SizedBox(width: 2,),
                //           Image.asset("assets/images/greetingicon.png", height: 10.31, width: 10.31,),
                //         ],
                //       ),
                //
                //       subtitle:
                //       Text("Cadet <Annie/>",
                //         textAlign: TextAlign.start,
                //         style: TextStyle(
                //             fontFamily: AppFonts.Cabinet_Grotesk,
                //             fontWeight: FontWeight.w700,
                //             fontSize: 18.0,
                //             fontStyle: FontStyle.normal,
                //             color: AppColors.purpleColor
                //         ),
                //       ) ,
                //
                //       trailing: InkWell(
                //           onTap: (){
                //             print("Clicked");
                //             //_scaffoldKey.currentState.openEndDrawer();
                //             print("Passed Clicked");
                //
                //           },
                //           child:  Image.asset(assetNotification, height: 18.36, width: 17.54,)),
                //     ),
                //   ),
                // ),
                Container(
                  color: AppColors.whiteColor,
                  child: ListTile(
                    leading: InkWell(
                        onTap: (){
                          print("Clicked");
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child:Image.asset(assetProfileImage)
                    ),
                    title: Row(
                      children: [
                        Text("Good ${greeting()}.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: AppFonts.Cabinet_Grotesk,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                              color: AppColors.hintColor
                          ),
                        ),
                        SizedBox(width: 2,),
                        Image.asset("assets/images/greetingicon.png", height: 10.31, width: 10.31,),
                      ],
                    ),

                    subtitle:
                    Text("Cadet <Annie/>",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                          fontStyle: FontStyle.normal,
                          color: AppColors.purpleColor
                      ),
                    ) ,

                    trailing: InkWell(
                        onTap: (){
                          print("Clicked");
                          //_scaffoldKey.currentState.openEndDrawer();
                          print("Passed Clicked");

                        },
                        child:  Image.asset(assetNotification, height: 18.36, width: 17.54,)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(children: [
                //SizedBox(height: 20,),
                CarouselSlider(
                  items: [
                    showImage(),
                    showImageTwo(),
                    showImageThree(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList
                      .asMap()
                      .entries
                      .map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 70.0,
                        height: 2.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          //shape: BoxShape.circle,
                            color:
                            (Theme
                                .of(context)
                                .brightness == Brightness.light
                                ? AppColors.lightPurpleColor
                                : AppColors.indicatorColor)
                                .withOpacity(
                                _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Quick Links",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: AppFonts.Cabinet_Grotesk,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                        color: AppColors.lightPurpleColor
                    ),
                  ),


                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      socialMediaHandles(
                          image: "assets/images/san_icon.png",
                          //containerColor: Color(0xFFF8FAFB),
                          label: "SAN"),
                      socialMediaHandles(
                          image: "assets/images/save_icon.png",
                          //containerColor: Color(0xFFE8F7FF),
                          label: "Save",
                          onMenuPressed:(){
                             //launchInWebViewWithJavaScript("https://ardilla/save");
                          }
                      ),
                      socialMediaHandles(
                          image: "assets/images/learn_icon.png",
                          //containerColor: AppColors.cyanColor,
                          label: "Learn",
                          onMenuPressed:(){
                            //launchInWebViewWithJavaScript("https://ardilla/learn-more");
                          }
                      ),
                      socialMediaHandles(
                          image: "assets/images/pay.png",
                          //containerColor: Color(0xFFF8FAFB),
                          label: "Payment"),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 96.0,
                  width: 367,
                  decoration: BoxDecoration(
                    color: AppColors.containerColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: 5.0,),
                      Row(

                        children: [

                          Spacer(),
                          Image.asset(assetTriangle, height: 3.38, width: 6.75,),
                          Text("10.00%",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: AppFonts.Cabinet_Grotesk,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.0,
                                fontStyle: FontStyle.normal,
                                color: AppColors.greenColor
                            ),
                          ),
                          SizedBox(width: 3.0,),
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Text("Cashflow",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: AppFonts.Cabinet_Grotesk,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.0,
                                  fontStyle: FontStyle.normal,
                                  color: AppColors.purpleColor
                              ),
                            ),
                          ),
                        ],),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 40),
                        child: Text("80%",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: AppFonts.Cabinet_Grotesk,
                              fontWeight: FontWeight.w500,
                              fontSize: 24.0,
                              fontStyle: FontStyle.normal,
                              color: AppColors.textColor
                          ),
                        ),
                      ),
                      //SizedBox(height: 0.0,),
                      Row(children: [


                        SizedBox(width: 15,),
                        Text("Complete KYC",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: AppFonts.Cabinet_Grotesk,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0,
                              fontStyle: FontStyle.normal,
                              color: AppColors.purpleColor
                          ),
                        ),
                        SizedBox(width: 3,),
                        Image.asset(assetForward, height: 7.12, width: 4.06,),
                        SizedBox(width: 31,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(assetChart, height: 38.5, width: 230.8),
                          ),
                        ),
                      ],),

                      Row(
                        children: [
                          LinearPercentIndicator(
                            padding: EdgeInsets.only(left: 15.0, right: 40),
                            width: deviceW / 4,
                            barRadius: Radius.circular(10),
                            animation: true,
                            lineHeight: 4.0,
                            animationDuration: 2000,
                            percent: 0.7,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: AppColors.lightPurpleColor,
                            backgroundColor: AppColors.textColor.withOpacity(0.3),
                          ),
                          SizedBox(width: 80,),
                          Container(
                            height: 12.77,
                            width: 12.77,
                            decoration: BoxDecoration(
                              color: AppColors.pinkColor,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.asset(assetCheck, height: 5.22, width: 6.78,),
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          Text("inflow",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: AppFonts.Cabinet_Grotesk,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.0,
                                fontStyle: FontStyle.normal,
                                color: AppColors.purpleColor
                            ),
                          ),

                          SizedBox(width: 18.0,),
                          Container(
                            height: 12.77,
                            width: 12.77,
                            decoration: BoxDecoration(
                              color: AppColors.lightPurpleColor,
                              shape: BoxShape.circle,
                            ),
                            // child: Image.asset(assetCheck, height: 5.22, width: 6.78,),
                          ),
                          SizedBox(width: 5.0,),
                          Text("outflow",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: AppFonts.Cabinet_Grotesk,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.0,
                                fontStyle: FontStyle.normal,
                                color: AppColors.purpleColor
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 1,)

                    ],
                  ),
                ),


                SizedBox(height: 40,),
                CarouselSlider(
                  items: [
                    investImage(startColor: Color.fromRGBO(136, 7, 247, 0.1), endColor: Color.fromRGBO(217, 217, 217, 0),
                        title: "Unprecedented access to\ninvestment opportunities",
                        image: "assets/images/access_icon.png",
                        title2: "20% Monthly ROI", subtitle: "Start Investing",
                        titleColor: AppColors.purpleColor, subTitleColor: AppColors.lightPurpleColor, titleColor2: AppColors.hintColor
                    ),investImage(startColor: Color.fromRGBO(6, 185, 129, 0.1), endColor: Color.fromRGBO(217, 217, 217, 0),
                        title: "Build your savings the right\nway",
                        image: "assets/images/build_icon.png",
                        title2: "20% Monthly ROI", subtitle: "Start Investing",
                        titleColor: AppColors.purpleColor, subTitleColor: AppColors.lightPurpleColor, titleColor2: AppColors.hintColor
                    ),investImage(startColor: Color.fromRGBO(230, 53, 109, 0.1), endColor: Color.fromRGBO(217, 217, 217, 0),
                        title: "Insurance policies you can\ntrust",
                        image: "assets/images/shield.png",
                        title2: "20% Monthly ROI", subtitle: "Make your first claim",
                        titleColor: AppColors.purpleColor, subTitleColor: AppColors.lightPurpleColor, titleColor2: AppColors.hintColor
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
                SizedBox(height: 40.0,),
                CarouselSlider(
                  items: [
                    lastImage("assets/images/cadet.png"),
                    lastImage("assets/images/badges.png"),
                    lastImage("assets/images/referral.png"),
                    lastImage("assets/images/wise.png"),
                    lastImage("assets/images/wise.png"),
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
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList
                      .asMap()
                      .entries
                      .map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 6.0,
                        height: 6.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                            (Theme
                                .of(context)
                                .brightness == Brightness.light
                                ? AppColors.lightPurpleColor
                                : AppColors.indicatorColor)
                                .withOpacity(
                                _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(height: 20,),
                Text("Explore",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontWeight: FontWeight.w700,
                      fontSize: 11.06,
                      fontStyle: FontStyle.normal,
                      color: AppColors.purpleColor
                  ),
                ),
                SizedBox(height: 20,),
                Stack(children: [

                  Image.asset("assets/images/purple.png", fit: BoxFit.fitHeight,),
                  Center(
                    child: Stack(
                      children: [
                        CarouselSlider(
                          items: [
                            view(title: "My Family and I", subTitle: "A Family that stay together stays forever"),
                            view(title: "Invest With Hargon", subTitle: "Loan as an investment"),
                            view(title: "Business with Ardilla", subTitle: "A Partnership where you Earn!"),
                            view(title: "Tax Save", subTitle: "Where you save while spending"),
                          ],
                          options: CarouselOptions(
                              enlargeCenterPage: false,
                              autoPlay: true,
                              aspectRatio: 2.0,
                              viewportFraction: 0.5,
                              autoPlayAnimationDuration:
                              const Duration(milliseconds: 500),
                              onPageChanged: (index, carouselReason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                        ),

                      ],
                    ),
                  ),
                ],)

              ],)
            ),
          ),
        ],
      ),
    );
  }
  Widget showImage({String image}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 209.15,
      width: 370.71,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              stops: [
                0.0,
                1.0
              ],
              colors: [
                Color.fromRGBO(75, 1, 169, 1),
                Color.fromRGBO(136, 7, 247, 1),

              ])
      ),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.57),
          child: Column(children: [
            SizedBox(height: 30,),
            Row(
              children: [
                Text("SAN",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      fontStyle: FontStyle.normal,
                      color: AppColors.whiteColor
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  height: 18.61,
                  width: 49.22,
                  decoration: BoxDecoration(
                      color: AppColors.pinkColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:  Align (alignment: Alignment.center,
                    child: Text("+10.00%",
                      //textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 9.13,
                          fontStyle: FontStyle.normal,
                          color: AppColors.whiteColor
                      ),
                    ),
                  ) ,
                )
              ],
            ) ,
            SizedBox(height: 30,),
            Row(
              children: [

                isHidden ?  Text(
                  "********",
                  style: TextStyle(
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      fontStyle: FontStyle.normal,
                      color: AppColors.whiteColor
                  ),

                )
                    :

                RichText(
                  text:  TextSpan(
                      text: 'NGN 100,000.00',
                      style: TextStyle(
                          fontFamily: AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 22.13,
                          fontStyle: FontStyle.normal,
                          color: AppColors.whiteColor
                      ),
                      children: [
                        TextSpan(
                          text:  "",
                          style: TextStyle(
                              fontFamily: AppFonts.Cabinet_Grotesk,
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              fontStyle: FontStyle.normal,
                              color: AppColors.whiteColor
                          ),

                        ),
                        // TextSpan(
                        //   text: ".00",
                        //   style: TextStyle(
                        //       fontFamily: AppFonts.DMSans,
                        //       fontWeight: FontWeight.w700,
                        //       fontSize: 32,
                        //       fontStyle: FontStyle.normal,
                        //       color: AppColors.whiteColor
                        //   ),
                        //
                        // )
                      ]
                  ),


                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    setState(() {
                      isHidden= !isHidden;

                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: isHidden
                        ?  IconButton(
                      icon: Image.asset(assetEyeClosed, height: 20, color: AppColors.whiteColor,),
                      onPressed: () {
                        setState(() {
                          isHidden = false;
                        });
                      },
                    )
                        : IconButton(
                      icon: Image.asset(assetEyeOpenTwo,height: 20,),
                      onPressed: () {
                        setState(() {
                          isHidden = true;
                        });
                      },
                    ),
                    // Icon(
                    //   //isHidden ? Icons.remove_red_eye_outlined :
                    //   isHidden ? Icons.visibility_rounded:
                    //   Icons.visibility_off_outlined, size: 20, color: AppColors.whiteColor,
                    // ),
                  ),),

              ],
            ),
            SizedBox(height: 12.0,),
            Row(
              children: [
                Text("Generate Account Number",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontWeight: FontWeight.w500,
                      fontSize: 11.07,
                      fontStyle: FontStyle.normal,
                      color: AppColors.whiteColor
                  ),
                ),
                SizedBox(width: 20,),
                Align (alignment: Alignment.center,
                    child: Image.asset("assets/images/arrow.png", height: 14.75, width: 14.75,)
                )
              ],
            ) ,

          ],),
        )
      ],),
    );
  }
  Widget showImageTwo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 209.15,
      width: 370.71,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              stops: [
                0.0,
                1.0
              ],
              colors: [
                Color.fromRGBO(181, 25, 74, 1),
                Color.fromRGBO(220, 24, 142, 1),

              ])
      ),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.57),
          child: Column(children: [
            SizedBox(height: 30,),
            Row(
              children: [
                Text("Dilla Wallet",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      fontStyle: FontStyle.normal,
                      color: AppColors.whiteColor
                  ),
                ),
                SizedBox(width: 15.0,),

              ],
            ) ,
            SizedBox(height: 15.0,),
            Row(
              children: [

                isHidden ?  Text(
                  "********",
                  style: TextStyle(
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      fontStyle: FontStyle.normal,
                      color: AppColors.whiteColor
                  ),

                )
                    :

                RichText(
                  text:  TextSpan(
                      text: 'USD 10,000.00',
                      style: TextStyle(
                          fontFamily: AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 22.13,
                          fontStyle: FontStyle.normal,
                          color: AppColors.whiteColor
                      ),
                      children: [
                        TextSpan(
                          text:  "",
                          style: TextStyle(
                              fontFamily: AppFonts.Cabinet_Grotesk,
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              fontStyle: FontStyle.normal,
                              color: AppColors.whiteColor
                          ),

                        ),
                        // TextSpan(
                        //   text: ".00",
                        //   style: TextStyle(
                        //       fontFamily: AppFonts.DMSans,
                        //       fontWeight: FontWeight.w700,
                        //       fontSize: 32,
                        //       fontStyle: FontStyle.normal,
                        //       color: AppColors.whiteColor
                        //   ),
                        //
                        // )
                      ]
                  ),


                ),
                Spacer(),
                // InkWell(
                //   onTap: (){
                //     setState(() {
                //       isHidden= !isHidden;
                //
                //     });
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 20.0, right: 20),
                //     child: Icon(
                //       //isHidden ? Icons.remove_red_eye_outlined :
                //       isHidden ? Icons.visibility_rounded:
                //       Icons.visibility_off_outlined, size: 20, color: AppColors.whiteColor,
                //     ),
                //   ),),

                InkWell(
                  onTap: (){
                    setState(() {
                      isHidden= !isHidden;

                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: isHidden
                        ?  IconButton(
                      icon: Image.asset(assetEyeClosed, height: 20, color: AppColors.whiteColor,),
                      onPressed: () {
                        setState(() {
                          isHidden = false;
                        });
                      },
                    )
                        : IconButton(
                      icon: Image.asset(assetEyeOpenTwo,height: 20,),
                      onPressed: () {
                        setState(() {
                          isHidden = true;
                        });
                      },
                    ),
                    // Icon(
                    //   //isHidden ? Icons.remove_red_eye_outlined :
                    //   isHidden ? Icons.visibility_rounded:
                    //   Icons.visibility_off_outlined, size: 20, color: AppColors.whiteColor,
                    // ),
                  ),),

              ],
            ),
            //SizedBox(height: 10,),
            Spacer(),
            Row(
              children: [
                ToggleSwitch(
                  // minWidth: 160.0,
                  minWidth: size.width * 0.15,
                  minHeight: 22.9,
                  fontSize: 13,
                  cornerRadius: 69.0,
                  borderWidth: 1,
                  doubleTapDisable: false,

                  activeBgColors: [[AppColors.lightRedColor], [AppColors.lightRedColor]],
                  activeFgColor:AppColors.lightPurpleColor,
                  inactiveBgColor: AppColors.switchColor,
                  inactiveFgColor: AppColors.whiteColor,
                  initialLabelIndex: currentIndex,
                  totalSwitches: 2,
                  animate: false, // with just animate set to true, default curve = Curves.easeIn
                  curve: Curves.easeOut,
                  labels: ['NGN', 'USD'],
                  radiusStyle: true,

                  onToggle: (index) {
                    print('switched to: $index');
                    // onPageChanged(index);

                    if(index == 0){
                      nairaVisible = true;
                      dollarVisible = false;
                      sharedVisible = false;
                    }else{
                      nairaVisible = false;
                      dollarVisible = true;
                      sharedVisible = false;
                    }

                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                SizedBox(width: 5,),
                Text("₦740 /\$1",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontWeight: FontWeight.w700,
                      fontSize: 8.9,
                      fontStyle: FontStyle.normal,
                      color: AppColors.whiteColor
                  ),
                ),

                Spacer(),
                Container(
                  margin:EdgeInsets.only(bottom: 10.0),
                  height: 37.62,
                  width: 99.26,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(110.66)
                  ),
                  child:  Align (alignment: Alignment.center,
                    child: Text("Add Money",
                      //textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 11.07,
                          fontStyle: FontStyle.normal,
                          color: AppColors.lightPurpleColor
                      ),
                    ),
                  ) ,
                )
              ],
            ) ,

          ],),
        )
      ],),
    );
  }
  Widget showImageThree() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 209.15,
      width: 370.71,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              stops: [
                0.0,
                1.0
              ],
              colors: [
                //Color.fromRGBO(136, 7, 247, 0.1),
                Color.fromRGBO(249, 249, 249, 1),
                AppColors.whiteColor,
                // AppColors.whiteColor

              ])
      ),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.57),
          child: ListView(children: [
            SizedBox(height: 30,),
            Row(
              children: [
                Text("Total Funds",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      fontStyle: FontStyle.normal,
                      color: AppColors.purpleColor
                  ),
                ),
                SizedBox(width: 15.0,),

              ],
            ) ,
            SizedBox(height: 15.0,),
            Row(
              children: [

                isHidden ?  Text(
                  "********",
                  style: TextStyle(
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      fontStyle: FontStyle.normal,
                      color: AppColors.purpleColor
                  ),

                )
                    :

                RichText(
                  text:  TextSpan(
                      text: 'NGN 400,000.00',
                      style: TextStyle(
                          fontFamily: AppFonts.Cabinet_Grotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 22.13,
                          fontStyle: FontStyle.normal,
                          color: AppColors.purpleColor
                      ),
                      children: [
                        TextSpan(
                          text:  "",
                          style: TextStyle(
                              fontFamily: AppFonts.Cabinet_Grotesk,
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              fontStyle: FontStyle.normal,
                              color: AppColors.whiteColor
                          ),

                        ),
                        // TextSpan(
                        //   text: ".00",
                        //   style: TextStyle(
                        //       fontFamily: AppFonts.DMSans,
                        //       fontWeight: FontWeight.w700,
                        //       fontSize: 32,
                        //       fontStyle: FontStyle.normal,
                        //       color: AppColors.whiteColor
                        //   ),
                        //
                        // )
                      ]
                  ),


                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    setState(() {
                      isHidden= !isHidden;

                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: isHidden
                        ?  IconButton(
                      icon: Image.asset(assetEyeClosed, height: 20, color: AppColors.eyeColor,),
                      onPressed: () {
                        setState(() {
                          isHidden = false;
                        });
                      },
                    )
                        : IconButton(
                      icon: Image.asset(assetEyeOpenTwo,height: 20, color: AppColors.eyeColor,),
                      onPressed: () {
                        setState(() {
                          isHidden = true;
                        });
                      },
                    ),
                    // Icon(
                    //   //isHidden ? Icons.remove_red_eye_outlined :
                    //   isHidden ? Icons.visibility_rounded:
                    //   Icons.visibility_off_outlined, size: 20, color: AppColors.whiteColor,
                    // ),
                  ),),

                // InkWell(
                //   onTap: (){
                //     setState(() {
                //       isHidden= !isHidden;
                //
                //     });
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 20.0, right: 20),
                //     child: Icon(
                //       //isHidden ? Icons.remove_red_eye_outlined :
                //       isHidden ? Icons.visibility_rounded:
                //       Icons.visibility_off_outlined, size: 20, color: AppColors.whiteColor,
                //     ),
                //   ),),

              ],
            ),
            SizedBox(height: 20,),
            //Spacer(),
            Row(
              children: [
                ToggleSwitch(
                  // minWidth: 160.0,
                  minWidth: size.width * 0.15,
                  minHeight: 22.9,
                  fontSize: 13,
                  cornerRadius: 69.0,
                  borderWidth: 1,
                  doubleTapDisable: false,

                  activeBgColors: [[AppColors.lightRedColor], [AppColors.lightRedColor]],
                  activeFgColor:AppColors.hintColor,
                  inactiveBgColor: AppColors.hintColor,
                  inactiveFgColor: AppColors.whiteColor,
                  initialLabelIndex: currentIndex,
                  totalSwitches: 2,
                  animate: false, // with just animate set to true, default curve = Curves.easeIn
                  curve: Curves.easeOut,
                  labels: ['NGN', 'USD'],
                  radiusStyle: true,

                  onToggle: (index) {
                    print('switched to: $index');
                    // onPageChanged(index);

                    if(index == 0){
                      nairaVisible = true;
                      dollarVisible = false;
                      sharedVisible = false;
                    }else{
                      nairaVisible = false;
                      dollarVisible = true;
                      sharedVisible = false;
                    }

                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                SizedBox(width: 5,),
                Text("₦740 /\$1",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontWeight: FontWeight.w700,
                      fontSize: 8.9,
                      fontStyle: FontStyle.normal,
                      color: AppColors.lilacColor
                  ),
                ),

                //Spacer(),
                // Container(
                //   margin:EdgeInsets.only(bottom: 10.0),
                //   height: 37.62,
                //   width: 99.26,
                //   decoration: BoxDecoration(
                //       color: AppColors.whiteColor,
                //       borderRadius: BorderRadius.circular(110.66)
                //   ),
                //   child:  Align (alignment: Alignment.center,
                //     child: Text("Add Money",
                //       //textAlign: TextAlign.start,
                //       style: TextStyle(
                //           fontFamily: AppFonts.Cabinet_Grotesk,
                //           fontWeight: FontWeight.w700,
                //           fontSize: 11.07,
                //           fontStyle: FontStyle.normal,
                //           color: AppColors.lightPurpleColor
                //       ),
                //     ),
                //   ) ,
                // )
              ],
            ) ,

          ],),
        )
      ],),
    );
  }
  Widget socialMediaHandles(
      {String image, Color containerColor, String label,  VoidCallback onMenuPressed}) {
    return Column(
      children: [
        Container(
          //padding: EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset(image, width: 60, height: 63,),
        ),
        //SizedBox(height: 10.0,),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: AppFonts.Cabinet_Grotesk,
              fontWeight: FontWeight.w500,
              fontSize: 10,
              fontStyle: FontStyle.normal,
              color: AppColors.lightPurpleColor),
        ),
      ],
    );
  }

  Widget lastImage(String image, ){
    return Image.asset(image,);
  }

  Widget investImage({Color startColor, Color endColor, String image,
    String title, String title2, String subtitle, Color titleColor, Color titleColor2, Color subTitleColor}){
    return Container(
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
      child: Column(children: [
        SizedBox(height: 10,),
        Image.asset(image, height: 63.44, width: 101,),
        // SizedBox(height: 10,),
        Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: AppFonts.Cabinet_Grotesk,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              fontStyle: FontStyle.normal,
              color: titleColor
          ),
        ),
        //SizedBox(height: 19.91,),
        Spacer(),
        Text(title2,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: AppFonts.Cabinet_Grotesk,
              fontWeight: FontWeight.w700,
              fontSize: 12.07,
              fontStyle: FontStyle.normal,
              color: titleColor2
          ),
        ),
        //SizedBox(height: 19.91,),
        Spacer(),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(subtitle,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: AppFonts.Cabinet_Grotesk,
                  fontWeight: FontWeight.w700,
                  fontSize: 11.06,
                  fontStyle: FontStyle.normal,
                  color: subTitleColor
              ),
            ),
            SizedBox(width: 10,),
            Image.asset("assets/images/front.png", height: 7.04, width: 9.39,)
          ],
        ),
      ],),
    );
  }

  Widget view({String title, String subTitle}){
    return Container(
      child: Row(
        children: [
          Column(children: [
            SizedBox(height: 5.0,),
            Text(title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: AppFonts.Cabinet_Grotesk,
                  fontWeight: FontWeight.w700,
                  fontSize: 11.06,
                  fontStyle: FontStyle.normal,
                  color: AppColors.whiteColor
              ),
            ),
            SizedBox(height: 5.0,),

            Text(subTitle,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: AppFonts.Cabinet_Grotesk,
                  fontWeight: FontWeight.w400,
                  fontSize: 9.56,
                  fontStyle: FontStyle.normal,
                  color: AppColors.whiteColor
              ),
            ),
            SizedBox(width: 54.0,),

            Image.asset('assets/images/coming.png', height: 22.3, width: 58.13,)
          ],),
          Image.asset("assets/images/line.png",)
        ],
      ),
    );
  }
}
