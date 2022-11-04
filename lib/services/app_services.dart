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
  static addWidth(double space) => SizedBox(height: space);

  /* Navigation and routing */
  static pushTo(BuildContext context, Widget screen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));

  static double scaleFactor(BuildContext context) =>
      AppConfig.designWidth / getScreenWidth(context);
}
