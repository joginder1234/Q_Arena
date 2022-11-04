import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:q_arena_user_application/services/images.dart';

import '../../services/app_services.dart';
import '../../services/base_components.dart';
import '../../services/style_sheet.dart';

class SAPScreen extends StatefulWidget {
  const SAPScreen({Key? key}) : super(key: key);

  @override
  State<SAPScreen> createState() => _SAPScreenState();
}

class _SAPScreenState extends State<SAPScreen> {
  bool switchValue = false;
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
            AppServices.addHeight(9.h),
            Text("Are You a", style: AppStyles.heading2),
            AppServices.addHeight(13.h),
            Text("Specially Abled person", style: AppStyles.heading2),
            AppServices.addHeight(32.h),
            Image.asset(AppImages.disability_frame),
            AppServices.addHeight(25.h),
            FlutterSwitch(
                width: 132.w,
                height: 53.h,
                borderRadius: 50,
                activeColor: AppStyles.redHighLightColor,
                toggleSize: 53,
                activeText: "Yes",
                inactiveText: "No",
                value: switchValue,
                onToggle: (val) {
                  setState(() {
                    switchValue = val;
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Yes",
                    style: AppStyles.bodySmall
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  AppServices.addWidth(60.w),
                  Text(
                    "No",
                    style: AppStyles.bodySmall
                        .copyWith(fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            AppServices.addHeight(70.h),
            Column(
              children: [
                Text(
                  "Select that applies to you",
                  style: AppStyles.bodyMedium
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all()),
                      width: 116.w,
                      height: 44.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Vision"),
                          Checkbox(value: true, onChanged: (v) {})
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
