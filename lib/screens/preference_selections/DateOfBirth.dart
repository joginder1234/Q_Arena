import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/components/flexible_button.dart';
import 'package:q_arena_user_application/screens/auth_screen/otp_view.dart';
import 'package:q_arena_user_application/screens/preference_selections/genderScreen.dart';
import 'package:q_arena_user_application/services/app_services.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Date Of Birth", style: AppStyles.heading2),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 50, right: 50),
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
              height: 200,
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
            SizedBox(
              height: 80.h,
            ),
            flexibleButton(
                btnName: "Next",
                backGroundColor: AppStyles.btnColorPrimary,
                textColor: AppStyles.whiteColor,
                onPress: () {
                  AppServices.pushTo(context, GenderScreen());
                })
          ],
        ),
      ),
    )));
  }
}
