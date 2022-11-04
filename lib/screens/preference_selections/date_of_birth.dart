import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/flexible_button.dart';
import 'package:q_arena_user_application/screens/preference_selections/gender_screen.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/base_components.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class DateOfBirth extends StatefulWidget {
  const DateOfBirth({Key? key}) : super(key: key);

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          AppServices.addHeight(5.h),
          stepCreator(1, context),
          Text("Date Of Birth", style: AppStyles.heading2),
          AppServices.addHeight(120.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  style: AppStyles.bodyLarge,
                ),
                Text(
                  "Month",
                  style: AppStyles.bodyLarge,
                ),
                Text(
                  "Year",
                  style: AppStyles.bodyLarge,
                ),
              ],
            ),
          ),
          Container(
            height: 210,
            margin: const EdgeInsets.only(bottom: 60, top: 10, left: 15),
            child: CupertinoDatePicker(
                dateOrder: DatePickerDateOrder.dmy,
                mode: CupertinoDatePickerMode.date,
                initialDateTime: date,
                onDateTimeChanged: (DateTime newDate) {
                  print(newDate);
                  setState(() {
                    newDate = date;
                  });
                }),
          ),
          AppServices.addHeight(197.h),
          FlexibleButton(
              btnName: "Next",
              onPress: () {
                AppServices.pushTo(context, GenderScreen());
              })
        ],
      ),
    )));
  }
}
