import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/app_services.dart';
import '../services/style_sheet.dart';

class ExpandedButtonView extends StatelessWidget {
  String btnName;
  Color bgColor, txtColor;
  Function onPress;
  double radius;
  ExpandedButtonView(
      {super.key,
      required this.btnName,
      required this.onPress,
      this.radius = 8,
      this.bgColor = AppStyles.btnColorSecondary,
      this.txtColor = AppStyles.whiteColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppServices.getScreenWidth(context),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius.r))),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 19.h)),
              backgroundColor: MaterialStateProperty.all(bgColor)),
          onPressed: () => onPress(),
          child: Text(
            btnName,
            style: AppStyles.bodyMedium
                .copyWith(color: txtColor, fontWeight: FontWeight.w700),
          )),
    );
  }
}
