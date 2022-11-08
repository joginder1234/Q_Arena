import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/components/expanded_button.dart';
import 'package:q_arena_trainer/screens/profile/profile_public_view.dart';
import 'package:q_arena_trainer/screens/profile/settings.dart';
import 'package:q_arena_trainer/services/icons.dart';

import '../../services/get_services.dart';
import '../../services/stylesheet.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Your Profile",
          style: GetTextTheme.sf16_Bold.copyWith(color: AppColors.whiteColor),
        ),
        actions: [
          IconButton(
              iconSize: 15.sp,
              onPressed: () => FlutterService.pushTo(context, SettingView()),
              icon: Image.asset(
                AppIcons.settingIcon,
                height: 22.h,
              ))
        ],
        centerTitle: true,
        backgroundColor: AppColors.darkBGColor,
        foregroundColor: AppColors.whiteColor,
        elevation: 0,
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
                Expanded(
                    child: SizedBox(
                  child: Column(
                    children: [
                      FlutterService.addHeight(26.h),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.r))),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 30.h),
                        child: SingleChildScrollView(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 84.w,
                                  width: 84.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              AppImages.dummyProfile),
                                          fit: BoxFit.cover),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                ),
                                FlutterService.addWidth(20.w),
                                Expanded(
                                    child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Simon Attfield",
                                          style: GetTextTheme.sf20_Bold),
                                      FlutterService.addHeight(10.h),
                                      Text("Functional Strength",
                                          style: GetTextTheme.sf12_Regular),
                                      FlutterService.addHeight(6.h),
                                      Text("Aspire, Qatar, 44095",
                                          style: GetTextTheme.sf12_Regular),
                                      FlutterService.addHeight(6.h),
                                      Text("100 QAR per Hour",
                                          style: GetTextTheme.sf12_Regular),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                            FlutterService.addHeight(35.h),
                            Text("Headline:", style: GetTextTheme.sf14_Regular),
                            Text(
                                "Vestibulum metus risus, facilisis vitae tincidunt vel per  dapibus in sapien. Proin posuere varius posuere dapibu  Quisque et rhoncus urna.",
                                style: GetTextTheme.sf14_Regular
                                    .copyWith(height: 1.5)),
                            FlutterService.addHeight(35.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Status",
                                    style: GetTextTheme.sf14_Regular),
                                Switch.adaptive(
                                    trackColor: MaterialStateProperty.all(
                                        AppColors.blackColor100),
                                    activeColor:
                                        AppColors.greenHighlighterColor,
                                    inactiveThumbColor: AppColors.btnColor,
                                    value: _status,
                                    onChanged: (value) =>
                                        setState(() => _status = value))
                              ],
                            ),
                            FlutterService.addHeight(25.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Public",
                                    style: GetTextTheme.sf14_Regular),
                                IconButton(
                                    onPressed: () => FlutterService.pushTo(
                                        context, ProfilePublicView()),
                                    iconSize: 20.sp,
                                    icon: Image.asset(AppIcons.viewIcon,
                                        scale: FlutterService.scaleFactorText(
                                            context),
                                        height: 20.h))
                              ],
                            ),
                            FlutterService.addHeight(80.h),
                            Row(
                              children: [
                                ExpandedButtonView(onTap: () {}, title: "Done"),
                              ],
                            )
                          ],
                        )),
                      )
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
