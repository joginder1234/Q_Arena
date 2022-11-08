import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/classes/basic_models.dart';
import 'package:q_arena_trainer/services/icons.dart';
import 'package:q_arena_trainer/services/stylesheet.dart';

import '../../services/get_services.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final List<SettingsBtnClass> _profileBtns = [
    SettingsBtnClass(AppIcons.profileIcon, "Edit Profile"),
    SettingsBtnClass(AppIcons.emailIcon, "My Email"),
    SettingsBtnClass(AppIcons.lockIcon, "Reset Password"),
    SettingsBtnClass(AppIcons.locationIcon, "My Location"),
    SettingsBtnClass(AppIcons.notificationIcon, "Notification"),
  ];
  List<SettingsBtnClass> _supportBtns = [
    SettingsBtnClass(AppIcons.termsIcon, "Terms & Policies"),
    SettingsBtnClass(AppIcons.termsIcon, "Help"),
    SettingsBtnClass(AppIcons.logoutIcon, "Log Out"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.darkBGColor,
        centerTitle: true,
        title: Text("Settings", style: GetTextTheme.sf16_Bold),
      ),
      body: Stack(children: [
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
              Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.r))),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Profile", style: GetTextTheme.sf14_Bold),
                      FlutterService.addHeight(15.h),
                      ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (ctx, i) {
                            final item = _profileBtns[i];
                            return ListTile(
                                onTap: () {},
                                tileColor: AppColors.whiteColor,
                                contentPadding: EdgeInsets.zero,
                                leading: IconButton(
                                    onPressed: null,
                                    iconSize: 10,
                                    icon: Image.asset(
                                      item.icon,
                                      color: AppColors.btnColor,
                                      scale: FlutterService.scaleFactorText(
                                          context),
                                      height: 18.h,
                                      width: 18.h,
                                    )),
                                title: Text(item.title,
                                    style: GetTextTheme.sf16_Regular));
                          },
                          separatorBuilder: (ctx, i) => Divider(thickness: 1.2),
                          itemCount: _profileBtns.length),
                      FlutterService.addHeight(15.h),
                      Text("Profile", style: GetTextTheme.sf14_Bold),
                      FlutterService.addHeight(25.h),
                      ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (ctx, i) {
                            final item = _supportBtns[i];
                            return ListTile(
                                onTap: () {},
                                tileColor: AppColors.whiteColor,
                                contentPadding: EdgeInsets.zero,
                                leading: IconButton(
                                    onPressed: null,
                                    iconSize: 10,
                                    icon: Image.asset(
                                      item.icon,
                                      scale: FlutterService.scaleFactorText(
                                          context),
                                      height: 18.h,
                                      width: 18.h,
                                    )),
                                title: Text(item.title,
                                    style: GetTextTheme.sf16_Regular));
                          },
                          itemCount: _supportBtns.length),
                    ],
                  ),
                ),
              )
            ],
          ),
        ))
      ]),
    );
  }
}
