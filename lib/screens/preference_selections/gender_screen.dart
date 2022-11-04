import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/custome_tab_switch.dart';
import 'package:q_arena_user_application/components/flexible_button.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/base_components.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int activeIndex = 0;
  double initAge = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          children: [
            AppServices.addHeight(5.h),
            stepCreator(2),
            AppServices.addHeight(18.h),
            Text("I am a", style: AppStyles.heading2),
            AppServices.addHeight(13.h),
            Text("This helps us create your personlized plan",
                style: AppStyles.bodySmall),
            AppServices.addHeight(50.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: SizedBox(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      AppImages.model_male,
                      height: activeIndex == 0 ? 180.h : 120.h,
                    ),
                  ),
                )),
                Expanded(
                    child: SizedBox(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      AppImages.model_female,
                      height: activeIndex != 0 ? 180.h : 120.h,
                    ),
                  ),
                )),
              ],
            ),
            CustomTabSwitch(
                values: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppIcons.genderMaleIcon,
                          color: getActiveTabColor(), height: 28.h),
                      Text("Male",
                          style: AppStyles.bodySmall
                              .copyWith(color: getActiveTabColor()))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppIcons.genderFemaleIcon,
                          color: getInActiveTabColor(), height: 28.h),
                      Text("Female",
                          style: AppStyles.bodySmall
                              .copyWith(color: getInActiveTabColor()))
                    ],
                  ),
                ],
                activeIndex: activeIndex,
                onValueChange: (value) => setState(() => activeIndex = value)),
            AppServices.addHeight(47.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(TextSpan(
                  text: "Age: ",
                  style: AppStyles.bodySmall,
                  children: [
                    TextSpan(
                        text: "${initAge.round()}",
                        style: AppStyles.bodySmall
                            .copyWith(color: AppStyles.redHighLightColor))
                  ])),
            ),
            SfSlider(
              min: 5.0,
              max: 100.0,
              value: initAge,
              interval: 20,
              showTicks: false,
              showLabels: false,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              activeColor: AppStyles.redHighLightColor,
              inactiveColor: AppStyles.textColorBlack50,
              onChanged: (value) => setState(() => initAge = value),
            ),
            AppServices.addHeight(140.h),
            FlexibleButton(btnName: "Next", onPress: () {})
          ],
        ),
      )),
    );
  }

  getActiveTabColor() {
    switch (activeIndex) {
      case 0:
        return AppStyles.whiteColor;
      default:
        return AppStyles.textColorBlack100;
    }
  }

  getInActiveTabColor() {
    switch (activeIndex) {
      case 0:
        return AppStyles.textColorBlack100;
      default:
        return AppStyles.whiteColor;
    }
  }
}
