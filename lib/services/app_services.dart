import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:q_arena_user_application/app_config.dart';

class AppServices {
  /* Height and Width Factors */
  static getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static addHeight(double space) => SizedBox(height: space);
  static addWidth(double space) => SizedBox(width: space);

  /* Navigation and routing */
  static pushTo(BuildContext context, Widget screen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));

  static double scaleFactorText(BuildContext context) {
    if (getScreenWidth(context) > AppConfig.designWidth) {
      return AppConfig.designWidth / getScreenWidth(context);
    } else {
      return getScreenWidth(context) / AppConfig.designWidth;
    }
  }
}
