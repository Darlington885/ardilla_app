import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/constants/fonts.dart';
import 'package:ardilla/screen/nav/dilla_screen.dart';
import 'package:ardilla/screen/nav/explore_screen.dart';
import 'package:ardilla/screen/nav/home_screen.dart';
import 'package:ardilla/screen/nav/learn_screen.dart';
import 'package:ardilla/screen/nav/save_screen.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashBoardScreen> {

  int _pageIndex = 0;

  final pages = [
    HomeScreen(),
    SaveScreen(),
    ExploreScreen(),
    LearnScreen(),
    DillaScreen(),
  ];

  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: buildMyNavBar(context),
      body: pages[_pageIndex],
    );
  }

  /*
  bottomItem({int index, String title, String icon}) {
    if (index == _pageIndex) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Image.asset(
            icon,
            height: 27,
            width: 27,
            color: AppColors.whiteColor,
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 23,
              width: 23,
              color: AppColors.hintColor,
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: AppFonts.Cabinet_Grotesk,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  color: AppColors.hintColor),
            )
          ],
        ),
      );
    }
  }
*/

  // void onPageChanged(int page) {
  //   setState(() {
  //     this._pageIndex = page;
  //   });
  // }
  //
  // void onTabTapped(int index) {
  //   this._pageController.jumpToPage(index);
  // }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 84,
      width: 375,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border(
            top: BorderSide(width: 0, color: AppColors.whiteColor),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            enableFeedback: false,
            onTap: () {
              setState(() {
                _pageIndex = 0;
              });
            },
            child: homeItems(
                icon: "assets/images/home.png",
                title: "Home",
                index: 0,
                iconColor: AppColors.hintColor),
          ),
          InkWell(
              enableFeedback: false,
              onTap: () {
                setState(() {
                  _pageIndex = 1;
                });
              },
              child: homeItems(
                  icon: "assets/images/save.png", title: "Save", index: 1)),
          InkWell(
            enableFeedback: false,
            onTap: () {
              setState(() {
                _pageIndex = 2;
              });
            },
            child: homeItems(
                icon: "assets/images/explore.png", title: "Explore", index: 2),
          ),
          InkWell(
            enableFeedback: false,
            onTap: () {
              setState(() {
                _pageIndex = 3;
              });
            },
            child: homeItems(
                icon: "assets/images/learn.png", title: "Learn", index: 3),
          ),
          InkWell(
            enableFeedback: false,
            onTap: () {
              setState(() {
                _pageIndex = 4;
              });
            },
            child: homeItems(
                icon: "assets/images/dila.png", title: "Dilla", index: 4),
          ),
        ],
      ),
    );
  }

  Widget homeItems({int index, String title, String icon, Color iconColor}) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        _pageIndex == index
            ? Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Image.asset(
                  icon,
                  color: AppColors.lightPurpleColor,
                  width: 25, height: 20,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Image.asset(
                  icon,
                  color: iconColor,
                  width: 25,
                  height: 20,
                ),
              ),
        _pageIndex == index
            ? Padding(
                padding: const EdgeInsets.only(top: 6.86),
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: AppFonts.Poppins,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      color: AppColors.lightPurpleColor),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 6.86),
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: AppFonts.Poppins,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      color: AppColors.hintColor),
                ),
              )
      ],
    );
  }
}
