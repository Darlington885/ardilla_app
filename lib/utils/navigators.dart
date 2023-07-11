import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateReplace(BuildContext context, Widget route, {bool isDialog = false}) =>
    Navigator.of(context).pushReplacement(MaterialPageRoute<dynamic>(
      fullscreenDialog: isDialog,
      builder: (BuildContext context) => route,
    ),
    );

navigateReplaceTwo(BuildContext context, Widget widget){
  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> widget));
}


void navigateReplaceWithSlide(BuildContext context, Widget route, {bool isDialog = false}) =>
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end,);
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ),
    );

void navigate(BuildContext context, Widget route, {bool isDialog = false}) =>
    Navigator.of(context).push(MaterialPageRoute<dynamic>(
      fullscreenDialog: isDialog,
      builder: (BuildContext context) => route,
    ),
    );

void navigateWithSlide(BuildContext context, Widget route, {bool isDialog = false}) =>
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => route,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );

void pushUntil(BuildContext context, Widget route) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return route;
      }), (Route<dynamic> route) => false);

}

void popToFirst(BuildContext context) =>
    Navigator.of(context).popUntil((Route<dynamic> route) => route.isFirst);


void popView(BuildContext context) => Navigator.of(context).pop();

dynamic navigateTransparentRoute(BuildContext context, Widget route) {
  return Navigator.of(context).push(TransparentRoute(
    builder: (BuildContext context) => route,
  ),
  );
}

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final Widget result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}

//  navigate(context, MarketNotificationScreen(title: "Transferring money to your\nwallet is very easy",)
//                                   );