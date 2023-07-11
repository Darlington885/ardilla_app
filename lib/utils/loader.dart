
// import 'package:nectsend_mobile_app/constant/colors.dart';
// import 'package:nectsend_mobile_app/utils/progressFile.dart';
import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/utils/progressFile.dart';
import 'package:flutter/cupertino.dart';


class LoaderProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ProgressBar _progressBar = ProgressBar();

  show(BuildContext context) {
    _progressBar.show(context);
  }

  hide() {
    _progressBar.hide();
  }
}


// final loaderOne = Padding(
//   padding: const EdgeInsets.all(18.0),
//   child: SpinKitFadingCircle(
//     color: AppColors.primarySecondaryColor,
//     size: 50.0,
//   ),
// );
//
// final loaderTwo = Padding(
//   padding: const EdgeInsets.all(18.0),
//   child: SpinKitFadingCircle(
//     color: Colors.white,
//     size: 30.0,
//   ),
// );

final loaderOne = Padding(
  padding: const EdgeInsets.all(18.0),
  child: Center(
    child: CupertinoActivityIndicator(
      color: AppColors.whiteColor,
      radius: 13,
    ),
  ),
);

final loaderTwo = Padding(
  padding: const EdgeInsets.all(18.0),
  child: Center(
    child: CupertinoActivityIndicator(
      radius: 13,
    ),
  ),
);
