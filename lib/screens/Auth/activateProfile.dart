import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/components/custom_TextField.dart';
import 'package:q_arena_trainer/components/custom_button_secondary.dart';
import 'package:q_arena_trainer/components/expanded_button.dart';
import 'package:q_arena_trainer/screens/bottom_nav_screen.dart';
import 'package:q_arena_trainer/services/get_services.dart';
import 'package:q_arena_trainer/services/icons.dart';

import '../../services/stylesheet.dart';

class ActivateProfileView extends StatefulWidget {
  const ActivateProfileView({Key? key}) : super(key: key);

  @override
  State<ActivateProfileView> createState() => _ActivateProfileViewState();
}

class _ActivateProfileViewState extends State<ActivateProfileView> {
  TextEditingController qidController = TextEditingController();
  TextEditingController experienceCertificateCtr = TextEditingController();

  List<String> dropDownItem = [
    "Cricket",
    "Hockey",
    "Badminton",
    "Soccer",
    "Tennis",
    "Atheletics",
    "Chess"
  ];

  String dropdownValue = "Cricket";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "Activate Profile",
            style: GetTextTheme.sf16_Bold.copyWith(color: AppColors.whiteColor),
          ),
          centerTitle: true,
          backgroundColor: AppColors.darkBGColor,
          foregroundColor: AppColors.darkBGColor,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              width: FlutterService.getScreenWidth(context),
              height: FlutterService.getScreenHeight(context) * 0.3,
              color: AppColors.darkBGColor,
            ),
            SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FlutterService.addHeight(26.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.r)),
                            color: AppColors.whiteColor),
                        width: FlutterService.getScreenWidth(context),
                        child: Column(
                          children: [
                            FlutterService.addHeight(113.h),
                            SecondaryButtonView(
                                onTap: () {}, title: "Upload QID"),
                            FlutterService.addHeight(20.h),
                            SecondaryButtonView(
                                onTap: () {},
                                title: "Upload Experience Certificate"),
                            FlutterService.addHeight(20.h),
                            DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 15.h),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(12.r)),
                                    fillColor: AppColors.darkBGColor,
                                    filled: true,
                                  ),
                                  isExpanded: true,
                                  hint: const Text(
                                    "Sports Category",
                                  ),
                                  borderRadius: BorderRadius.circular(12.r),
                                  dropdownColor: AppColors.darkBGColor,
                                  style: GetTextTheme.sf14_Regular,
                                  value: dropdownValue,
                                  items: dropDownItem
                                      .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            textScaleFactor:
                                                FlutterService.scaleFactorText(
                                                    context),
                                          )))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h)
              .copyWith(bottom: 30),
          child: Row(
            children: [
              ExpandedButtonView(
                  onTap: () =>
                      FlutterService.pushTo(context, BottomNavScreenView()),
                  title: "Submit")
            ],
          ),
        ));
  }
}
