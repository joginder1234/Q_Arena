import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/components/flexible_button.dart';
import 'package:q_arena_user_application/screens/LookUp_Playmate/suggestedPlaymates.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

import '../../services/images.dart';

class InviteView extends StatefulWidget {
  const InviteView({Key? key}) : super(key: key);

  @override
  State<InviteView> createState() => _InviteViewState();
}

class _InviteViewState extends State<InviteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "2 New Team Invites",
          style: AppStyles.heading2.copyWith(
              fontWeight: FontWeight.w900, color: AppStyles.textColorBlack100),
        ),
        foregroundColor: AppStyles.redHighLightColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Expanded(
        child: SizedBox(
          height: AppServices.getScreenHeight(context) * 0.92.h,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                  2,
                  (index) => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        child: Card(
                          color: Color.fromARGB(223, 248, 248, 248),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.w, vertical: 8.h),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 23.r,
                                      backgroundImage: const AssetImage(
                                          AppImages.profileImage),
                                    ),
                                    AppServices.addWidth(6.w),
                                    Text(
                                      "Micheal",
                                      style: AppStyles.bodyMedium.copyWith(
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sports",
                                          style: AppStyles.captionLarge
                                              .copyWith(
                                                  color: AppStyles
                                                      .textColorBlack50,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        AppServices.addHeight(9.h),
                                        Text(
                                          "Football",
                                          style: AppStyles.captionLarge
                                              .copyWith(
                                                  fontWeight: FontWeight.w700),
                                        ),
                                        AppServices.addHeight(15.h),
                                        Text(
                                          "Date",
                                          style: AppStyles.captionLarge
                                              .copyWith(
                                                  color: AppStyles
                                                      .textColorBlack50,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        AppServices.addHeight(9.h),
                                        Text(
                                          "20 June 2022",
                                          style: AppStyles.captionLarge
                                              .copyWith(
                                                  fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Price",
                                          style: AppStyles.captionLarge
                                              .copyWith(
                                                  color: AppStyles
                                                      .textColorBlack50,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        AppServices.addHeight(9.h),
                                        Text(
                                          "QAR 150",
                                          style: AppStyles.captionLarge
                                              .copyWith(
                                                  fontWeight: FontWeight.w700),
                                        ),
                                        AppServices.addHeight(15.h),
                                        Text(
                                          "Time",
                                          style: AppStyles.captionLarge
                                              .copyWith(
                                                  color: AppStyles
                                                      .textColorBlack50,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        AppServices.addHeight(9.h),
                                        Text(
                                          "06:45 - 08:00 PM",
                                          style: AppStyles.captionLarge
                                              .copyWith(
                                                  fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              AppServices.addHeight(25.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14.w),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppIcons.locationIcon,
                                        height: 20.h,
                                      ),
                                      AppServices.addWidth(6.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ASPIRE FOOTBALL PITCH",
                                            style: AppStyles.captionLarge
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                          Text(
                                            "Al Waab Street، 23833، Doha",
                                            style: AppStyles.captionLarge
                                                .copyWith(
                                                    fontWeight: FontWeight.w300,
                                                    color: AppStyles
                                                        .textColorBlack50),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              AppServices.addHeight(40.h),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    ExpandedButtonView(
                                        btnName: "Decline",
                                        onPress: () {},
                                        bgColor: AppStyles.textColorBlack50),
                                    AppServices.addWidth(10.w),
                                    ExpandedButtonView(
                                        btnName: "Accept",
                                        onPress: () {
                                          AppServices.pushTo(context,
                                              SuggestedPlaymatesView());
                                        },
                                        bgColor: AppStyles.redHighLightColor),
                                  ],
                                ),
                              ),
                              AppServices.addHeight(20.h),
                            ],
                          ),
                        ),
                      )),
            ),
          ),
        ),
      )),
    );
  }
}
