import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

class MainClass{

  static buildMenu(
      {String icon,
        String name,
        VoidCallback onMenuPressed,
        String imageText}) {
    return InkWell(
      onTap: onMenuPressed,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListTile(
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