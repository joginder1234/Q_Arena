import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/screens/profile_activity/my_activity.dart';
import 'package:q_arena_user_application/screens/profile_activity/payment_history.dart';
import 'package:q_arena_user_application/screens/profile_activity/upgrade_pass_info.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class MainProfileView extends StatefulWidget {
  const MainProfileView({super.key});

  @override
  State<MainProfileView> createState() => _MainProfileViewState();
}

class _MainProfileViewState extends State<MainProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppServices.addHeight(10.h),
              SizedBox(
                width: AppServices.getScreenWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => AppServices.popView(context),
                        iconSize: 20,
                        icon: Image.asset(AppIcons.backbtnIcon, height: 18.h)),
                    CircleAvatar(
                      radius: 45.r,
                      backgroundImage: AssetImage(AppImages.profileImage),
                    ),
                    IconButton(
                        onPressed: () => AppServices.popView(context),
                        iconSize: 20,
                        icon: Image.asset(AppIcons.notificationIcon))
                  ],
                ),
              ),
              AppServices.addHeight(7.h),
              Text("Yessie, 27", style: AppStyles.bodyMedium),
              AppServices.addHeight(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: AppStyles.redHighLightColor),
                    child: Center(
                      child: Text("Complete my profile",
                          style: AppStyles.captionLarge
                              .copyWith(color: AppStyles.whiteColor)),
                    ),
                  ),
                ],
              ),
              AppServices.addHeight(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("5K",
                            style: AppStyles.bodySmall
                                .copyWith(fontWeight: FontWeight.w700)),
                        Text("Followers",
                            style: AppStyles.captionLarge
                                .copyWith(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 30.h, child: VerticalDivider(thickness: 1.2)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("100",
                            style: AppStyles.bodySmall
                                .copyWith(fontWeight: FontWeight.w700)),
                        Text("Play Requests",
                            style: AppStyles.captionLarge
                                .copyWith(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  )
                ],
              ),
              AppServices.addHeight(20.h),
              Row(
                children: [
                  ExpandedButtonView(
                      btnName: "ACCESS PASS",
                      bgColor: AppStyles.redHighLightColor,
                      txtColor: AppStyles.whiteColor,
                      padding: 12,
                      onPress: () {}),
                  AppServices.addWidth(10.w),
                  ExpandedButtonView(
                      btnName: "MY ACTIVITY",
                      bgColor: AppStyles.redHighLightColor,
                      txtColor: AppStyles.whiteColor,
                      padding: 12,
                      onPress: () => showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          constraints: BoxConstraints(
                              maxHeight:
                                  AppServices.getScreenHeight(context) * 0.8.h),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => MyActivityView())),
                  AppServices.addWidth(10.w),
                  ExpandedButtonView(
                      btnName: "PAYMENT",
                      bgColor: AppStyles.redHighLightColor,
                      txtColor: AppStyles.whiteColor,
                      padding: 12,
                      onPress: () =>
                          AppServices.pushTo(context, PaymentHistoryView())),
                ],
              ),
              AppServices.addHeight(20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlipCard(
                    fill: Fill
                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                    direction: FlipDirection.HORIZONTAL, // default
                    front: Image.asset(AppImages.memberPassImage,
                        scale: AppServices.scaleFactorText(context),
                        width: AppServices.getScreenWidth(context) - (80.w)),
                    back: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppStyles.passColorPrimary),
                      width: AppServices.getScreenWidth(context) - (80.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/qr_code.png",
                            width: 200.w,
                            scale: AppServices.scaleFactorText(context),
                          ),
                          Text("Valid until: 16 DEC 2022",
                              style: AppStyles.bodyMedium
                                  .copyWith(color: AppStyles.whiteColor))
                        ],
                      ),
                    ),
                  ),
                  AppServices.addWidth(10.w),
                  InkWell(
                    onTap: () => showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r)),
                        isScrollControlled: true,
                        constraints: BoxConstraints(
                            maxHeight:
                                AppServices.getScreenHeight(context) * 0.8.h),
                        context: context,
                        builder: (context) => UpgradePassInformationView()),
                    child: Column(
                      children: [
                        Image.asset(AppIcons.crownIcon, height: 28.h),
                        AppServices.addHeight(3.h),
                        Text("Upgrade",
                            style: AppStyles.caption
                                .copyWith(fontWeight: FontWeight.w700))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
