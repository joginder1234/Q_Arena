import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/circular_badge.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class MyActivityView extends StatefulWidget {
  const MyActivityView({super.key});

  @override
  State<MyActivityView> createState() => _MyActivityViewState();
}

class _MyActivityViewState extends State<MyActivityView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppStyles.whiteColor),
      width: AppServices.getScreenWidth(context),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(TextSpan(
              text: "HI,",
              style: AppStyles.heading2.copyWith(fontWeight: FontWeight.w400),
              children: [
                TextSpan(
                    text: "YESSIE!",
                    style: AppStyles.heading2
                        .copyWith(fontWeight: FontWeight.w700))
              ])),
          Text("This is your Activity Board", style: AppStyles.bodyMedium),
          AppServices.addHeight(10.h),
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    height: 140.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppStyles.borderColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            CircularBadgeView(
                                transformValue: 15,
                                bgColor: AppStyles.textColorBlack50),
                            CircularBadgeView(isIcon: false, child: "10")
                          ],
                        ),
                        Text("BOOKED COURTS",
                            textScaleFactor:
                                AppServices.scaleFactorText(context),
                            style: AppStyles.heading2
                                .copyWith(fontWeight: FontWeight.w700))
                      ],
                    ),
                  )),
              AppServices.addWidth(12.w),
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 140.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppStyles.borderColor),
                        color: AppStyles.whiteColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularBadgeView(
                            child: AppIcons.manWalkIcon, isIcon: true),
                        Text("500 STEPS",
                            textScaleFactor:
                                AppServices.scaleFactorText(context),
                            style: AppStyles.heading2
                                .copyWith(fontWeight: FontWeight.w700))
                      ],
                    ),
                  )),
            ],
          ),
          AppServices.addHeight(30.h),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 140.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppStyles.borderColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("ACTIVE CLUBS",
                            textScaleFactor:
                                AppServices.scaleFactorText(context),
                            style: AppStyles.heading2),
                        Stack(
                          children: [
                            CircularBadgeView(
                                showBorder: true,
                                bgColor: AppStyles.whiteColor),
                            CircularBadgeView(
                                showBorder: true,
                                bgColor: AppStyles.whiteColor,
                                child: "+2",
                                transformValue: 25),
                          ],
                        )
                      ],
                    ),
                  )),
              AppServices.addWidth(12.w),
              Expanded(
                  flex: 3,
                  child: Container(
                    height: 140.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppStyles.borderColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("BOOKED TRAINERS",
                            textScaleFactor:
                                AppServices.scaleFactorText(context),
                            style: AppStyles.heading2),
                        Stack(
                          children: [
                            CircularBadgeView(
                                bgColor: AppStyles.whiteColor,
                                expandImage: true,
                                child: AppImages.profileImage,
                                isIcon: true),
                            CircularBadgeView(
                                transformValue: 25.w,
                                bgColor: AppStyles.whiteColor,
                                expandImage: true,
                                child: AppImages.profileImage,
                                isIcon: true),
                            CircularBadgeView(
                                transformValue: 110.w,
                                bgColor: AppStyles.whiteColor,
                                expandImage: true,
                                child: "+5"),
                            CircularBadgeView(
                                transformValue: 70.w,
                                bgColor: AppStyles.whiteColor,
                                expandImage: true,
                                child: AppImages.profileImage,
                                isIcon: true),
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          ),
          AppServices.addHeight(16.h),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 100.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppStyles.borderColor),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Image.asset(AppIcons.trophyIcon,
                          scale: AppServices.scaleFactorText(context),
                          height: 50.h),
                    ),
                    Expanded(
                      child: SizedBox(
                          child: Center(
                        child: Text("CHALLENGES COMPLETED",
                            textScaleFactor:
                                AppServices.scaleFactorText(context),
                            style: AppStyles.heading2),
                      )),
                    )
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
