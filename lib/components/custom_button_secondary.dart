import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/services/icons.dart';

import '../services/stylesheet.dart';

class SecondaryButtonView extends StatelessWidget {
  Function onTap;
  String title;
  Color bgColor, fgColor;
  SecondaryButtonView(
      {super.key,
      required this.onTap,
      required this.title,
      this.bgColor = AppColors.darkBGColor,
      this.fgColor = AppColors.whiteColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: InkWell(
          onTap: () => onTap(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.h),
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(12.r)),
            child: Row(
              children: [
                Expanded(
                    child: Text(title,
                        style: GetTextTheme.sf14_Regular
                            .copyWith(color: fgColor))),
                Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Image.asset(AppIcons.uploadIcon,
                        height: 16.h, color: fgColor))
              ],
            ),
          ),
        ))
      ],
    );
  }
}
