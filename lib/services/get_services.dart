import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class FlutterService {
  /* Screen size factors */
  static getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static addHeight(double space) => SizedBox(height: space);
  static addWidth(double space) => SizedBox(width: space);

  /* Screen Navigation Factors */

  static pushTo(BuildContext context, Widget child) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => child));
  static popView(BuildContext context) => Navigator.of(context).pop();

  /* Element Scale Factor */
  static double scaleFactorText(BuildContext context) {
    if (getScreenWidth(context) > AppConfig.designWidth) {
      return AppConfig.designWidth / getScreenWidth(context);
    } else {
      return getScreenWidth(context) / AppConfig.designWidth;
    }
  }
}
