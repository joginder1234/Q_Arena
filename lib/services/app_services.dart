import 'package:flutter/material.dart';

import '../configs/app_config.dart';

class AppServices {
  /* Height and Width Factors */
  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static addHeight(double space) => SizedBox(height: space);
  static addWidth(double space) => SizedBox(width: space);

  /* Navigation and routing */
  static pushTo(BuildContext context, Widget screen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  static popView(BuildContext context) => Navigator.of(context).pop();

  static double scaleFactorText(BuildContext context) {
    if (getScreenWidth(context) > AppConfig.designWidth) {
      return AppConfig.designWidth / getScreenWidth(context);
    } else {
      return getScreenWidth(context) / AppConfig.designWidth;
    }
  }
}
