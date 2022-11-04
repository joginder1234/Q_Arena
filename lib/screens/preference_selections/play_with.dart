import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/screens/preference_selections/sap.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';

import '../../components/flexible_button.dart';
import '../../services/app_services.dart';
import '../../services/base_components.dart';
import '../../services/style_sheet.dart';

class PlayWith extends StatefulWidget {
  const PlayWith({Key? key}) : super(key: key);

  @override
  State<PlayWith> createState() => _PlayWithState();
}

class _PlayWithState extends State<PlayWith> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 45.w),
        child: Column(
          children: [
            AppServices.addHeight(5.h),
            stepCreator(3),
            AppServices.addHeight(18.h),
            Text("You want to play with?", style: AppStyles.heading2),
            AppServices.addHeight(13.h),
            Text("This helps us create your personlized plan",
                style: AppStyles.bodySmall),
            AppServices.addHeight(70.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppStyles.textColorBlack50)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Column(
                      children: [
                        Image.asset(
                          AppImages.male_avatar,
                          width: 102.w,
                          height: 112.h,
                        ),
                        AppServices.addHeight(5),
                        Text(
                          "Male",
                          style: AppStyles.captionLarge
                              .copyWith(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
                AppServices.addWidth(40.w),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppStyles.textColorBlack50)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Column(
                      children: [
                        Image.asset(
                          AppImages.female_avatar,
                          width: 102.w,
                          height: 112.h,
                        ),
                        AppServices.addHeight(5),
                        Text(
                          "Female",
                          style: AppStyles.captionLarge
                              .copyWith(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            AppServices.addHeight(35.h),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 134.w,
                height: 142.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppStyles.textColorBlack50)),
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, top: 35.h, bottom: 10.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          AppImages.male_gender_sign,
                          height: 60.h,
                          width: 45.w,
                        ),
                        Image.asset(
                          AppImages.female_gender_sign,
                          height: 60.h,
                          width: 45.w,
                        )
                      ],
                    ),
                    AppServices.addHeight(10),
                    Text(
                      "Female",
                      style: AppStyles.captionLarge
                          .copyWith(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
            AppServices.addHeight(180.h),
            FlexibleButton(
                btnName: "Next",
                onPress: () {
                  AppServices.pushTo(context, SAPScreen());
                })
          ],
        ),
      )),
    );
  }
}
