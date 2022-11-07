import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/bottom_nav_bar.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class PlayPassView extends StatelessWidget {
  const PlayPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppServices.addHeight(30.h),
              Text("Show your playpass upon entry", style: AppStyles.heading2),
              AppServices.addHeight(55.h),
              FlipCard(
                  front: Image.asset(AppImages.playPassFront,
                      width: AppServices.getScreenWidth(context)),
                  back: Image.asset(AppImages.playPassback,
                      width: AppServices.getScreenWidth(context))),
              AppServices.addHeight(30.h),
              Row(
                children: [
                  ExpandedButtonView(
                      btnName: "★★ Rate Us ★★",
                      bgColor: AppStyles.redHighLightColor,
                      onPress: () {})
                ],
              ),
              TextButton(
                  onPressed: () =>
                      AppServices.pushTo(context, BottomNavBarView()),
                  child: Text(
                    "Skip",
                    style: AppStyles.heading2.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppStyles.bluePrimary),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
