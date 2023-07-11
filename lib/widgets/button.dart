
import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/constants/fonts.dart';
import 'package:flutter/material.dart';

enum ButtonMode { text, outlined, contained }

class Button extends StatelessWidget {
  const Button({
    @required this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.loaderColor,
    this.mode,
    this.loading,
    this.disabled,
    this.border,
  });

  final String text;
  final Function onPressed;
  final ButtonMode mode;
  final Color color;
  final Color textColor;
  final Color loaderColor;
  final bool loading;
  final bool disabled;
  final BorderSide border;

  @override
  Widget build(BuildContext context) {
    Widget loader = SizedBox(
      width: 18,
      height: 18,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(loaderColor ?? Colors.white),
      ),
    );

    if (mode == ButtonMode.outlined) {
      return OutlinedButton(
        onPressed: (disabled == true || loading == true) ? null : onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0))),
          elevation: MaterialStateProperty.all(0),
          side: MaterialStateProperty.all(BorderSide(color: color ?? Colors.white)),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10)),
        ),
        child: loading == true
            ? loader
            : Text(
          text,
          style: TextStyle(
              fontSize: 15.52, fontFamily: AppFonts.Poppins,
              color: textColor ?? color ?? Colors.white,
              fontWeight: FontWeight.w700),
        ),
      );
    } else if (mode == ButtonMode.text) {
      return TextButton(
        onPressed: (disabled == true || loading == true) ? null : onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15.52, fontFamily: AppFonts.Poppins,
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w700),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: (disabled == true || loading == true) ? null : onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0))),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(color ?? AppColors.lightPurpleColor),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10,)),
        ),
        child: loading == true
            ? loader
            : Text(
          text,
          style: TextStyle(
              fontSize: 15.52,
              fontFamily: AppFonts.Cabinet_Grotesk,
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w700),
        ),
      );
    }
  }
}
