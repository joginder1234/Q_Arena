import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/services/icons.dart';

import '../../services/get_services.dart';
import '../../services/stylesheet.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Profile",
          style: GetTextTheme.sf16_Bold.copyWith(color: AppColors.whiteColor),
        ),
        actions: [
          IconButton(
              iconSize: 15.sp,
              onPressed: () {},
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
                            horizontal: 15.w, vertical: 15.h),
                        child: SingleChildScrollView(
                            child: Column(
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
                                )
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
