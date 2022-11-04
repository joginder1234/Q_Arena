import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/style_sheet.dart';

class flexibleButton extends StatelessWidget {
  String btnName;
  Color backGroundColor, textColor;
  Function onPress;
  flexibleButton(
      {Key? key,
      required this.btnName,
      required this.backGroundColor,
      required this.textColor,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPress(),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r))),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h)),
            backgroundColor: MaterialStateProperty.all(backGroundColor)),
        child: Text(
          "Next",
          style: AppStyles.bodyMedium.copyWith(color: textColor),
        ));
  }
}
