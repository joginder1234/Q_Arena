import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/components/expanded_button.dart';
import 'package:q_arena_trainer/services/icons.dart';
import 'package:q_arena_trainer/services/stylesheet.dart';

import '../../services/get_services.dart';

class ProfilePublicView extends StatefulWidget {
  const ProfilePublicView({super.key});

  @override
  State<ProfilePublicView> createState() => _ProfilePublicViewState();
}

class _ProfilePublicViewState extends State<ProfilePublicView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.darkBGColor,
        foregroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text("Trainer Profile",
            style:
                GetTextTheme.sf16_Bold.copyWith(color: AppColors.whiteColor)),
        actions: [
          IconButton(
              onPressed: () {},
              iconSize: 15.sp,
              icon: Image.asset(
                AppIcons.mapIcon,
                height: 15.h,
              ))
        ],
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
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.blackLightColor)),
                            child: CircleAvatar(
                              radius: 45.w,
                              backgroundImage:
                                  AssetImage(AppImages.dummyProfile),
                            ),
                          ),
                          FlutterService.addHeight(10.h),
                          Text("Simon Attfield", style: GetTextTheme.sf20_Bold),
                          FlutterService.addHeight(4.h),
                          Text("Bodyweight, Strengthen",
                              style: GetTextTheme.sf12_Regular),
                          FlutterService.addHeight(4.h),
                          Text("Fit Sport Saloon",
                              style: GetTextTheme.sf12_Regular),
                          FlutterService.addHeight(4.h),
                          RatingBarIndicator(
                            rating: 4,
                            itemBuilder: (context, index) =>
                                Icon(Icons.star, color: AppColors.ratingColor),
                            itemCount: 5,
                            itemSize: 15.0.sp,
                            direction: Axis.horizontal,
                          ),
                          FlutterService.addHeight(25.h),
                          Row(
                            children: [
                              ExpandedButtonView(
                                  onTap: () {}, title: "Book A Session")
                            ],
                          ),
                          FlutterService.addHeight(25.h),
                          AspectRatio(
                            aspectRatio: 0.85,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: AppColors.darkBGColor),
                            ),
                          )
                        ],
                      ),
                    ),
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
