import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

List<String> socialBtn = [
  AppIcons.fbLogo,
  AppIcons.googleLogo,
  AppIcons.appleLogo
];

footerTextBtn(String btnText1, String btnText2) => Center(
      child: TextButton(
        onPressed: () {},
        child: Text.rich(TextSpan(
            text: "$btnText1 ",
            style: AppStyles.bodyMedium
                .copyWith(color: AppStyles.textColorBlack100),
            children: [
              TextSpan(
                  text: btnText2,
                  style: AppStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppStyles.btnColorPrimary))
            ])),
      ),
    );

stepCreator(int currentStep) => Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
        height: 50.w,
        width: 50.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppStyles.redHighLightColor),
            color: AppStyles.redHighLightColor.withOpacity(0.1)),
        child: Center(
          child: Text.rich(TextSpan(
              text: "$currentStep",
              style: AppStyles.largeHeader,
              children: [TextSpan(text: "/6", style: AppStyles.bodySmall)])),
        ),
      ),
    );
