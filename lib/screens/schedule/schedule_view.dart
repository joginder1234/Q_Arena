import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:q_arena_trainer/base_models.dart';
import 'package:q_arena_trainer/components/expanded_button.dart';
import 'package:q_arena_trainer/screens/bottom_nav_screen.dart';
import 'package:q_arena_trainer/services/stylesheet.dart';

import '../../services/get_services.dart';

class MyScheduleView extends StatefulWidget {
  const MyScheduleView({super.key});

  @override
  State<MyScheduleView> createState() => _MyScheduleViewState();
}

class _MyScheduleViewState extends State<MyScheduleView> {
  String selectedTime = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.darkBGColor,
        centerTitle: true,
        title: Text("My Schedule", style: GetTextTheme.sf16_Bold),
      ),
      body: Stack(
        children: [
          Container(
            width: FlutterService.getScreenWidth(context),
            height: FlutterService.getScreenHeight(context) * 0.3,
            color: AppColors.darkBGColor,
          ),
          SafeArea(
              child: SizedBox(
            width: FlutterService.getScreenWidth(context),
            height: FlutterService.getScreenHeight(context),
            child: Column(
              children: [
                FlutterService.addHeight(26.h),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.r))),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(),
                      Text("Select Available Date",
                          style: GetTextTheme.sf14_Bold),
                      HorizontalCalendar(
                        date: DateTime.now(),
                        textColor: AppColors.blackColor100,
                        backgroundColor: Colors.white,
                        selectedColor: AppColors.btnColor,
                        showMonth: true,
                        onDateSelected: (date) => print(
                          date.toString(),
                        ),
                      ),
                      Divider(thickness: 1.2),
                      FlutterService.addHeight(20.h),
                      Text("Select Available Time",
                          style: GetTextTheme.sf14_Bold),
                      FlutterService.addHeight(15.h),
                      SizedBox(
                        width: FlutterService.getScreenWidth(context),
                        child: Wrap(
                          spacing: 10.w,
                          runSpacing: 18.w,
                          alignment: WrapAlignment.spaceEvenly,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: List.generate(timeSlots.length, (i) {
                            final time = timeSlots[i];
                            return InkWell(
                              onTap: () => setState(() => selectedTime = time),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25.w, vertical: 12.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.r),
                                    border: selectedTime != time
                                        ? Border.all(
                                            color: AppColors.blackColor100,
                                            width: 1.2)
                                        : null,
                                    color: selectedTime == time
                                        ? AppColors.btnColor
                                        : AppColors.whiteColor),
                                child:
                                    Text(time, style: GetTextTheme.sf12_Bold),
                              ),
                            );
                          }),
                        ),
                      ),
                      FlutterService.addHeight(100.h),
                      Row(
                        children: [
                          ExpandedButtonView(
                              onTap: () => FlutterService.pushTo(
                                  context, BottomNavScreenView()),
                              title: "Confirm")
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
