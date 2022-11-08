import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/components/expanded_button.dart';
import 'package:q_arena_trainer/services/get_services.dart';
import 'package:q_arena_trainer/services/icons.dart';
import 'package:q_arena_trainer/services/stylesheet.dart';

class TrainingConfirmationView extends StatelessWidget {
  const TrainingConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBGColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppIcons.likeIcon,
                height: 60.h,
              ),
              FlutterService.addHeight(50.h),
              Text("Thank You !\nYou Confirmed a Training Session.",
                  textAlign: TextAlign.center,
                  style: GetTextTheme.sf16_Bold
                      .copyWith(color: AppColors.whiteColor, height: 2)),
              FlutterService.addHeight(10.h),
              Text(
                  "You booked an appoinment with Brandon on\nJul 31, at 06:30 PM",
                  textAlign: TextAlign.center,
                  style: GetTextTheme.sf14_Bold
                      .copyWith(color: AppColors.whiteColor, height: 1.5)),
              FlutterService.addHeight(100.h),
              Row(
                children: [
                  ExpandedButtonView(
                      onTap: () => FlutterService.popView(context),
                      title: "done")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
