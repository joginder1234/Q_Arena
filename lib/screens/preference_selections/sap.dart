import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:q_arena_user_application/components/flexible_button.dart';
import 'package:q_arena_user_application/models/basic_models.dart';
import 'package:q_arena_user_application/screens/preference_selections/agree_form.dart';
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
  List<DisabilitySwitchClass> types = [
    DisabilitySwitchClass("Vision", false),
    DisabilitySwitchClass("Hearing", false),
    DisabilitySwitchClass("Physical", false),
  ];

  List<String> radioList = ["Required", "Not Required"];

  String activeRadio = 'Required';
  String selectedDisability = '';
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: Column(
            children: [
              AppServices.addHeight(5.h),
              stepCreator(4, context),
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
                  toggleColor: AppStyles.redHighLightColor,
                  activeColor: AppStyles.borderColor,
                  inactiveColor: AppStyles.borderColor,
                  toggleSize: 53,
                  activeText: "Yes",
                  inactiveText: "No",
                  value: switchValue,
                  onToggle: (val) => setState(() => switchValue = val)),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No",
                      style: AppStyles.bodySmall
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    AppServices.addWidth(60.w),
                    Text(
                      "Yes",
                      style: AppStyles.bodySmall
                          .copyWith(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              AppServices.addHeight(70.h),
              !switchValue
                  ? SizedBox()
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select that applies to you",
                          style: AppStyles.bodyMedium
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        AppServices.addHeight(11.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              types.length,
                              (index) => Expanded(
                                      child: InkWell(
                                    onTap: () => setState(() => types[index]
                                        .isActive = !types[index].isActive),
                                    child: AnimatedScale(
                                      duration: Duration(milliseconds: 150),
                                      scale:
                                          AppServices.scaleFactorText(context),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.w, vertical: 9.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            border: Border.all(
                                                color: AppStyles.borderColor)),
                                        child: Row(
                                          children: [
                                            AppServices.addWidth(10),
                                            Text(types[index].text,
                                                style: AppStyles.bodySmall),
                                            AppServices.addWidth(5.w),
                                            types[index].isActive
                                                ? const Icon(Icons.check_box,
                                                    color: AppStyles
                                                        .redHighLightColor)
                                                : const Icon(
                                                    Icons
                                                        .check_box_outline_blank,
                                                    color:
                                                        AppStyles.borderColor,
                                                  )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))),
                        ),
                        AppServices.addHeight(20.h),
                        Text("Wheel Chair Assistance",
                            style: AppStyles.bodyMedium
                                .copyWith(fontWeight: FontWeight.w700)),
                        AppServices.addHeight(10.h),
                        Row(
                          children: List.generate(
                              radioList.length,
                              (index) => InkWell(
                                    onTap: () => setState(
                                        () => activeRadio = radioList[index]),
                                    child: Container(
                                      margin: EdgeInsets.only(right: 15.w),
                                      child: Row(
                                        children: [
                                          Radio<String>(
                                              activeColor:
                                                  AppStyles.redHighLightColor,
                                              value: radioList[index],
                                              groupValue: activeRadio,
                                              onChanged: (value) => setState(
                                                  () => activeRadio =
                                                      value.toString())),
                                          AppServices.addWidth(10.w),
                                          Text(radioList[index],
                                              style: AppStyles.bodySmall)
                                        ],
                                      ),
                                    ),
                                  )),
                        )
                      ],
                    ),
              AppServices.addHeight(40.h),
              FlexibleButton(
                  btnName: "Next",
                  onPress: () =>
                      AppServices.pushTo(context, ProfileAgreeForm()))
            ],
          ),
        ),
      )),
    );
  }
}
