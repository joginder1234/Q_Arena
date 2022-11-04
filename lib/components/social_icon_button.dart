import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/style_sheet.dart';

class SocialButtonView extends StatelessWidget {
  String icon;
  int index;
  Function onTap;
  SocialButtonView(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        margin: index == 0
            ? EdgeInsets.symmetric(horizontal: 5.w)
            : EdgeInsets.zero,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppStyles.borderColor)),
        child: Center(
          child: Image.asset(icon, height: 20.h),
        ),
      ),
    );
  }
}
