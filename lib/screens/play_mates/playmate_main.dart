import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/circular_badge.dart';
import 'package:q_arena_user_application/screens/play_mates/suggestedPlaymates.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

import '../../dashboard.dart';

class PlaymateMainView extends StatefulWidget {
  const PlaymateMainView({super.key});

  @override
  State<PlaymateMainView> createState() => _PlaymateMainViewState();
}

class _PlaymateMainViewState extends State<PlaymateMainView> {
  List<String> interests = ["Football", "Cricket", "Padel", "Bowling"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppServices.addHeight(22.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(AppImages.profileImage),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Icon(Icons.circle,
                                  size: 15.sp, color: AppStyles.greenColor))
                        ],
                      )
                    ],
                  ),
                  Text("Your Interests", style: AppStyles.heading2),
                  AppServices.addHeight(12.h),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 15.w,
                    children: List.generate(
                        interests.length,
                        (i) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: AppStyles.redHighLightColor
                                      .withOpacity(0.2)),
                              child:
                                  Text(interests[i], style: AppStyles.caption),
                            )),
                  ),
                  AppServices.addHeight(20.h),
                  DashboardSagmentDivider(
                    title: "Suggested playmates",
                    btnName: "View More",
                    ontap: () =>
                        AppServices.pushTo(context, SuggestedPlaymatesView()),
                  ),
                ],
              ),
            ),
            AppServices.addHeight(10.h),
            PlayMatesListSlider(),
            AppServices.addHeight(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Users with mutual interest",
                      style: AppStyles.bodyMedium.copyWith(
                          color: AppStyles.textColorBlack50,
                          fontWeight: FontWeight.w700)),
                  AppServices.addHeight(12.h),
                  ...List.generate(
                      6,
                      (i) => Container(
                            margin: EdgeInsets.only(bottom: 10.h),
                            width: AppServices.getScreenWidth(context),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 15.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                border:
                                    Border.all(color: AppStyles.borderColor)),
                            child: Row(
                              children: [
                                Expanded(
                                    child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text.rich(TextSpan(
                                          text: "200   ",
                                          style: AppStyles.captionLarge
                                              .copyWith(
                                                  fontWeight: FontWeight.w700),
                                          children: [
                                            TextSpan(
                                                text: "other users",
                                                style: AppStyles.caption)
                                          ])),
                                      AppServices.addHeight(8.h),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: SizedBox(
                                            child: Text("Interested in",
                                                style: AppStyles.bodyMedium
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700)),
                                          )),
                                          Expanded(
                                              child: SizedBox(
                                            child: Text("Badminton",
                                                style: AppStyles.bodyMedium
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppStyles
                                                            .redHighLightColor)),
                                          )),
                                        ],
                                      ),
                                      AppServices.addHeight(8.h),
                                      Stack(
                                        children: List.generate(
                                            5,
                                            (i) => CircularBadgeView(
                                                  isIcon: true,
                                                  child: AppImages.profileImage,
                                                  expandImage: true,
                                                  radius: 30,
                                                  bgColor: AppStyles.whiteColor,
                                                  transformValue: i * 28.0.w,
                                                )),
                                      )
                                    ],
                                  ),
                                )),
                                AppServices.addWidth(10.w),
                                Image.asset(AppIcons.badmintonIcon, height: 45)
                              ],
                            ),
                          ))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
