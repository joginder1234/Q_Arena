import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/services/stylesheet.dart';

class ExpandedButtonView extends StatelessWidget {
  Function onTap;
  String title;
  Color btnColor, txtColor;
  ExpandedButtonView(
      {super.key,
      required this.onTap,
      required this.title,
      this.btnColor = AppColors.btnColor,
      this.txtColor = AppColors.whiteColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 17.h)),
                backgroundColor: MaterialStateProperty.all(btnColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r)))),
            onPressed: () => onTap(),
            child: Text(title,
                style: GetTextTheme.sf12_Bold.copyWith(color: txtColor))),
      ),
    );
  }
}
