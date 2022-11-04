import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/style_sheet.dart';

class FlexibleButton extends StatelessWidget {
  String btnName;
  Color backGroundColor, textColor;
  Function onPress;
  FlexibleButton(
      {Key? key,
      required this.btnName,
      this.backGroundColor = AppStyles.redHighLightColor,
      this.textColor = AppStyles.whiteColor,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPress(),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r))),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 60.w, vertical: 20.h)),
            backgroundColor: MaterialStateProperty.all(backGroundColor)),
        child: Text(
          "Next",
          style: AppStyles.bodyMedium.copyWith(color: textColor),
        ));
  }
}
