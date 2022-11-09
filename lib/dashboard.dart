import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/screens/NearbyCourts/nearby_courts.dart';
import 'package:q_arena_user_application/screens/NearbyCourts/vanue_details.dart';
import 'package:q_arena_user_application/screens/play_mates/playmate_bottom_bar.dart';
import 'package:q_arena_user_application/screens/profile_activity/profile_main.dart';
import 'package:q_arena_user_application/screens/tournament/create_tournament.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Dashboard_Appbar(),
          Expanded(
              child: SizedBox(
                  child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppServices.addHeight(20.h),
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 50.h,
                        color: AppStyles.redHighLightColor,
                      ),
                      AppServices.addWidth(7.w),
                      Expanded(
                          child: SizedBox(
                        child: Text("Find Venues, events\n& friends",
                            style: AppStyles.heading1),
                      )),
                      Container(
                        height: 50.h,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            border: Border.all(
                                color: AppStyles.redHighLightColor, width: 3)),
                        child: Center(
                          child: Icon(Icons.search),
                        ),
                      )
                    ],
                  ),
                  AppServices.addHeight(10.h),
                  DashboardSagmentDivider(
                    title: "Trending Sports",
                    btnName: "View More",
                    ontap: () {
                      AppServices.pushTo(
                          context,
                          NearbyCourts(
                            type: "trainer",
                          ));
                    },
                  ),
                  AppServices.addHeight(10.h),
                  SizedBox(
                    height: 160.h,
                    width: AppServices.getScreenWidth(context),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(
                            4,
                            (index) => Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: GestureDetector(
                                      onTap: () => AppServices.pushTo(
                                          context, VanueDetailsView()),
                                      child: Image.asset(
                                        AppImages.trendingBanner,
                                        height: 157.h,
                                        scale: AppServices.scaleFactorText(
                                            context),
                                      )),
                                )),
                      ),
                    ),
                  ),
                  AppServices.addHeight(10.h),
                  DashboardSagmentDivider(
                      title: "Public Tournaments", btnName: "Create Event"),
                  SizedBox(
                    height: 160.h,
                    width: AppServices.getScreenWidth(context),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(
                            4,
                            (index) => Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: GestureDetector(
                                      onTap: () => AppServices.pushTo(
                                          context, VanueDetailsView()),
                                      child: Image.asset(
                                        AppImages.publicBanner,
                                        height: 157.h,
                                        scale: AppServices.scaleFactorText(
                                            context),
                                      )),
                                )),
                      ),
                    ),
                  ),
                  AppServices.addHeight(10.h),
                  DashboardSagmentDivider(
                      title: "Suggested playmates", btnName: "View More"),
                  AppServices.addHeight(10.h),
                  PlayMatesListSlider()
                ],
              ),
            ),
          )))
        ],
      )),
    );
  }
}

class PlayMatesListSlider extends StatelessWidget {
  const PlayMatesListSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppServices.getScreenWidth(context),
      height: 160,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            AppServices.addWidth(7.w),
            ...List.generate(
                7,
                (index) => GestureDetector(
                      onTap: () => showModalBottomSheet(
                        
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.r))),
                          context: context,
                          builder: (context) => PlayMateBottomSheet()),
                      child: Container(
                        margin: EdgeInsets.only(right: 7.w),
                        height: 159.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(AppImages.playMateBanner),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  gradient: const LinearGradient(
                                      stops: [
                                        0.2,
                                        0.5,
                                        0.6
                                      ],
                                      colors: [
                                        AppStyles.textColorBlack100,
                                        Colors.transparent,
                                        Colors.transparent
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter)),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 15.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Amatul, 30",
                                      style: AppStyles.captionLarge.copyWith(
                                          color: AppStyles.whiteColor),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}

class DashboardSagmentDivider extends StatelessWidget {
  String title, btnName;
  Function? ontap;
  DashboardSagmentDivider(
      {Key? key, required this.title, required this.btnName, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: AppStyles.bodyMedium.copyWith(
                color: AppStyles.textColorBlack50,
                fontWeight: FontWeight.w700)),
        TextButton(
            onPressed: ontap != null ? () => ontap!() : null,
            child: Text(btnName,
                style: AppStyles.bodyMedium
                    .copyWith(color: AppStyles.redHighLightColor)))
      ],
    );
  }
}

class Dashboard_Appbar extends StatelessWidget {
  const Dashboard_Appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () => AppServices.pushTo(context, MainProfileView()),
        child: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(AppImages.profileImage))),
        ),
      ),
      title: Text("Current Location",
          style:
              AppStyles.bodyMedium.copyWith(color: AppStyles.textColorBlack50)),
      subtitle: Text("◥ Salwa Road",
          style: AppStyles.bodyMedium
              .copyWith(color: AppStyles.redHighLightColor)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(AppIcons.notificationIcon,
                  scale: AppServices.scaleFactorText(context), height: 25.h)),
          IconButton(
              onPressed: () {},
              icon: Image.asset(AppIcons.msgIcon,
                  scale: AppServices.scaleFactorText(context), height: 25.h))
        ],
      ),
    );
  }
}
