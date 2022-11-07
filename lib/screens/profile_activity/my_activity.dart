import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                            decoration_circle(
                                context: context,
                                transformValue: 15,
                                bgColor: AppStyles.textColorBlack50),
                            decoration_circle(
                                context: context, isIcon: false, child: "10")
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
                        decoration_circle(
                            context: context,
                            child: AppIcons.manWalkIcon,
                            isIcon: true),
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
                            decoration_circle(
                                showBorder: true,
                                context: context,
                                bgColor: AppStyles.whiteColor),
                            decoration_circle(
                                showBorder: true,
                                context: context,
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
                            decoration_circle(
                                context: context,
                                bgColor: AppStyles.whiteColor,
                                expandImage: true,
                                child: AppImages.profileImage,
                                isIcon: true),
                            decoration_circle(
                                transformValue: 25.w,
                                context: context,
                                bgColor: AppStyles.whiteColor,
                                expandImage: true,
                                child: AppImages.profileImage,
                                isIcon: true),
                            decoration_circle(
                                transformValue: 110.w,
                                context: context,
                                bgColor: AppStyles.whiteColor,
                                expandImage: true,
                                child: "+5"),
                            decoration_circle(
                                transformValue: 70.w,
                                context: context,
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

  AnimatedScale decoration_circle(
      {required BuildContext context,
      String child = '',
      bool isIcon = false,
      double transformValue = 0,
      bool showBorder = false,
      bool expandImage = false,
      Color bgColor = AppStyles.redHighLightColor}) {
    return AnimatedScale(
      scale: AppServices.scaleFactorText(context),
      duration: Duration(milliseconds: 200),
      child: Container(
        transform: Matrix4.translationValues(transformValue, 0, 0),
        alignment: Alignment.center,
        width: 60.w,
        height: 60.w,
        decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            border: showBorder
                ? Border.all(color: AppStyles.textColorBlack50, width: 2)
                : null),
        child: isIcon
            ? expandImage
                ? Image.asset(
                    child,
                    fit: BoxFit.cover,
                    scale: AppServices.scaleFactorText(context),
                  )
                : Image.asset(
                    child,
                    scale: AppServices.scaleFactorText(context),
                    height: 35.h,
                  )
            : Text(child, style: AppStyles.heading1),
      ),
    );
  }
}
