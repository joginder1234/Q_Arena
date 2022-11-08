import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:q_arena_trainer/screens/home/confirmation.dart';
import 'package:q_arena_trainer/services/icons.dart';

import '../../services/get_services.dart';
import '../../services/stylesheet.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.darkBGColor,
        foregroundColor: AppColors.whiteColor,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Available", style: GetTextTheme.sf16_Bold),
            FlutterService.addWidth(10.w),
            Switch.adaptive(
                activeColor: AppColors.greenHighlighterColor,
                trackColor: MaterialStateProperty.all(AppColors.whiteColor),
                inactiveThumbColor: AppColors.btnColor,
                value: _status,
                onChanged: (value) => setState(() => _status = value))
          ],
        ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterService.addHeight(26.h),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.r))),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h)
                          .copyWith(bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your Bookings", style: GetTextTheme.sf14_Bold),
                      FlutterService.addHeight(15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Today",
                              style: GetTextTheme.sf14_Bold
                                  .copyWith(color: AppColors.btnColor)),
                          Text(DateFormat("d MMM y").format(DateTime.now()),
                              style: GetTextTheme.sf14_Bold
                                  .copyWith(color: AppColors.btnColor)),
                        ],
                      ),
                      FlutterService.addHeight(15.h),
                      Expanded(
                          child: SizedBox(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: List.generate(
                                5,
                                (i) => Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 40.w, bottom: 10.h),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 15.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            color: AppColors.darkBGColor,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  FlutterService.addWidth(50.w),
                                                  Expanded(
                                                      child: SizedBox(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Brandon",
                                                            style: GetTextTheme
                                                                .sf14_Regular
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .whiteColor)),
                                                        FlutterService
                                                            .addHeight(5.h),
                                                        Text(
                                                            "Functional Training",
                                                            style: GetTextTheme
                                                                .sf12_Regular
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .whiteColor)),
                                                        FlutterService
                                                            .addHeight(5.h),
                                                        Text(
                                                            "06:30 PM - 07:30 PM",
                                                            style: GetTextTheme
                                                                .sf12_Regular
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .whiteColor)),
                                                      ],
                                                    ),
                                                  )),
                                                  Column(
                                                    children: [
                                                      Icon(Icons.star,
                                                          color: AppColors
                                                              .ratingColor,
                                                          size: 12),
                                                      FlutterService.addHeight(
                                                          5.h),
                                                      Text("5.0",
                                                          style: GetTextTheme
                                                              .sf14_Regular
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .whiteColor))
                                                    ],
                                                  )
                                                ],
                                              ),
                                              FlutterService.addHeight(10.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                      style: ButtonStyle(
                                                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                                                              horizontal: 20.w,
                                                              vertical: 7.h)),
                                                          backgroundColor:
                                                              MaterialStateProperty.all(AppColors
                                                                  .btnColor),
                                                          shape: MaterialStateProperty.all(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(
                                                                      20.r)))),
                                                      onPressed: () =>
                                                          FlutterService.pushTo(
                                                              context,
                                                              TrainingConfirmationView()),
                                                      child: Text("Accept", style: GetTextTheme.sf12_Bold.copyWith(color: AppColors.whiteColor)))
                                                ],
                                              ),
                                              Text("100 QAR",
                                                  style: GetTextTheme
                                                      .sf16_Regular
                                                      .copyWith(
                                                          color: AppColors
                                                              .whiteColor))
                                            ],
                                          ),
                                        ),
                                        AnimatedScale(
                                          scale: FlutterService.scaleFactorText(
                                              context),
                                          duration: Duration(milliseconds: 200),
                                          child: Container(
                                            margin: EdgeInsets.only(top: 16.h),
                                            height: 80.w,
                                            width: 80.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.dummyProfile),
                                                    fit: BoxFit.cover)),
                                          ),
                                        )
                                      ],
                                    )),
                          ),
                        ),
                      ))
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
