import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/circular_badge.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

import '../preference_selections/bookingCalender.dart';

class TrainerDetails extends StatefulWidget {
  String type;
  TrainerDetails({Key? key, required this.type}) : super(key: key);

  @override
  State<TrainerDetails> createState() => _TrainerDetailsState();
}

class _TrainerDetailsState extends State<TrainerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
              width: AppServices.getScreenWidth(context),
              height: 260.h,
              child: Image.asset(
                AppImages.trainerBgImage,
                scale: AppServices.scaleFactorText(context),
              )),
          Container(
            height: AppServices.getScreenHeight(context),
            width: AppServices.getScreenWidth(context),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppServices.addHeight(225.h),
                  Container(
                    decoration: BoxDecoration(
                        color: AppStyles.whiteColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.r))),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 35.h)
                              .copyWith(bottom: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Jennifer James",
                                    textScaleFactor:
                                        AppServices.scaleFactorText(context),
                                    style: AppStyles.heading2
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  AppServices.addWidth(40.w),
                                  Row(
                                    children: List.generate(
                                        5,
                                        (index) => const Icon(
                                              Icons.star,
                                              size: 14,
                                              color:
                                                  AppStyles.redHighLightColor,
                                            )),
                                  ),
                                  AppServices.addWidth(40.w),
                                  Image.asset(
                                    AppIcons.commentIcon,
                                    scale: AppServices.scaleFactorText(context),
                                    height: 28.h,
                                  )
                                ],
                              ),
                              AppServices.addHeight(6.h),
                              Row(
                                children: [
                                  Image.asset(
                                    AppIcons.footballIcon,
                                    scale: AppServices.scaleFactorText(context),
                                    height: 20.h,
                                  ),
                                  AppServices.addWidth(7.w),
                                  Text(
                                    "Football Coach",
                                    textScaleFactor:
                                        AppServices.scaleFactorText(context),
                                    style: AppStyles.captionLarge.copyWith(
                                        color: AppStyles.redHighLightColor,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              AppServices.addHeight(22.h),
                              Text(
                                "QAR 100 per session",
                                textScaleFactor:
                                    AppServices.scaleFactorText(context),
                                style: AppStyles.captionLarge
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              AppServices.addHeight(14.h),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(
                                        color: AppStyles.redHighLightColor)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "6",
                                          textScaleFactor:
                                              AppServices.scaleFactorText(
                                                  context),
                                          style: AppStyles.heading2.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  AppStyles.redHighLightColor),
                                        ),
                                        Text(
                                          "Experience",
                                          textScaleFactor:
                                              AppServices.scaleFactorText(
                                                  context),
                                          style: AppStyles.captionLarge
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: AppStyles
                                                      .redHighLightColor),
                                        )
                                      ],
                                    ),
                                    AppServices.addWidth(10.w),
                                    SizedBox(
                                      height: 54.h,
                                      child: const VerticalDivider(
                                          color: AppStyles.redHighLightColor,
                                          thickness: 1.2),
                                    ),
                                    AppServices.addWidth(10.w),
                                    Column(
                                      children: [
                                        Text(
                                          "46",
                                          textScaleFactor:
                                              AppServices.scaleFactorText(
                                                  context),
                                          style: AppStyles.heading2.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  AppStyles.redHighLightColor),
                                        ),
                                        Text(
                                          "Sessions Completed",
                                          textScaleFactor:
                                              AppServices.scaleFactorText(
                                                  context),
                                          style: AppStyles.captionLarge
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: AppStyles
                                                      .redHighLightColor),
                                        )
                                      ],
                                    ),
                                    AppServices.addWidth(10.w),
                                    SizedBox(
                                      height: 54.h,
                                      child: const VerticalDivider(
                                          color: AppStyles.redHighLightColor,
                                          thickness: 1.2),
                                    ),
                                    AppServices.addWidth(10.w),
                                    Column(
                                      children: [
                                        Text(
                                          "25",
                                          textScaleFactor:
                                              AppServices.scaleFactorText(
                                                  context),
                                          style: AppStyles.heading2.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  AppStyles.redHighLightColor),
                                        ),
                                        Text(
                                          "Active Clients",
                                          textScaleFactor:
                                              AppServices.scaleFactorText(
                                                  context),
                                          style: AppStyles.captionLarge
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: AppStyles
                                                      .redHighLightColor),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              AppServices.addHeight(20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Reviews",
                                    textScaleFactor:
                                        AppServices.scaleFactorText(context),
                                    style: AppStyles.bodyMedium
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 15.w),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 3.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        color: AppStyles.redHighLightColor),
                                    child: Text(
                                      "4.6",
                                      style: AppStyles.captionLarge.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppStyles.whiteColor),
                                    ),
                                  )
                                ],
                              ),
                              AppServices.addHeight(10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: List.generate(
                                        5,
                                        (index) => CircularBadgeView(
                                              child: index == 0
                                                  ? "174"
                                                  : AppImages.profileImage,
                                              isIcon: index == 0 ? false : true,
                                              expandImage: true,
                                              radius: 35.h,
                                              bgColor: index == 0
                                                  ? AppStyles.redHighLightColor
                                                  : AppStyles.whiteColor,
                                              textSize: 11,
                                              textColor: AppStyles.whiteColor,
                                              transformValue:
                                                  92 - (23.0 * index),
                                            )),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text("Read all reviews",
                                          style: AppStyles.bodySmall))
                                ],
                              ),
                            ],
                          ),
                        ),
                        AppServices.addHeight(20.h),
                        SizedBox(
                          width: AppServices.getScreenWidth(context),
                          height: 145.h,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                AppServices.addWidth(15.w),
                                ...List.generate(
                                    4,
                                    (i) => Container(
                                          margin: EdgeInsets.only(right: 15.w),
                                          width: 300.w,
                                          height: 145.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 15.h),
                                          decoration: BoxDecoration(
                                            color: AppStyles.textColorBlack100,
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                      radius: 15.r,
                                                      backgroundImage:
                                                          AssetImage(AppImages
                                                              .profileImage)),
                                                  AppServices.addWidth(8.w),
                                                  Expanded(
                                                    child: SizedBox(
                                                      child: Text("Sharon Jam",
                                                          textScaleFactor:
                                                              AppServices
                                                                  .scaleFactorText(
                                                                      context),
                                                          style: AppStyles
                                                              .bodyMedium
                                                              .copyWith(
                                                                  color: AppStyles
                                                                      .whiteColor)),
                                                    ),
                                                  ),
                                                  Text("2d ago",
                                                      textScaleFactor:
                                                          AppServices
                                                              .scaleFactorText(
                                                                  context),
                                                      style: AppStyles
                                                          .bodyMedium
                                                          .copyWith(
                                                              color: AppStyles
                                                                  .whiteColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400))
                                                ],
                                              ),
                                              Text(
                                                  "Had such an amazing session with Maria. She instantly picked up on the level of my fitness and adjusted the workout to suit me whilst also pushing me to my limits.",
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textScaleFactor: AppServices
                                                      .scaleFactorText(context),
                                                  style: AppStyles.bodySmall
                                                      .copyWith(
                                                          color: AppStyles
                                                              .whiteColor))
                                            ],
                                          ),
                                        )),
                              ],
                            ),
                          ),
                        ),
                        AppServices.addHeight(40.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 15.h),
                          child: Row(
                            children: [
                              ExpandedButtonView(
                                  btnName: "Pick a Schedule",
                                  bgColor: AppStyles.redHighLightColor,
                                  radius: 60,
                                  onPress: () => showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      isScrollControlled: true,
                                      constraints: BoxConstraints(
                                          maxHeight:
                                              AppServices.getScreenHeight(
                                                      context) *
                                                  0.7),
                                      context: context,
                                      builder: (BuildContext context) =>
                                          BookingCalenderView(
                                              type: widget.type)))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
