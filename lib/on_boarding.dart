import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/screens/auth_screen/auth_tabbar.dart';
import 'package:q_arena_user_application/screens/auth_screen/email_auth/email_login.dart';
import 'package:q_arena_user_application/screens/auth_screen/phone_auth/phone_login.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';
import 'package:q_arena_user_application/splash.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          height: AppServices.getScreenHeight(context),
          width: AppServices.getScreenWidth(context),
          decoration: const BoxDecoration(color: AppStyles.textColorBlack100),
          child: Column(
            children: [
              AppServices.addHeight(120.h),
              SplashAppLogo(),
              AppServices.addHeight(30.h),
              Text("Everyone is a player",
                  style: AppStyles.heading1
                      .copyWith(color: AppStyles.redHighLightColor)),
              AppServices.addHeight(40.h),
              Image.asset(AppImages.onBoardImage),
              AppServices.addHeight(10.h),
              Row(
                children: [
                  ExpandedButtonView(
                    btnName: "Sign Up",
                    onPress: () =>
                        AppServices.pushTo(context, AuthTabBarView()),
                    radius: 60,
                    txtColor: AppStyles.textColorBlack100,
                    bgColor: AppStyles.onBoardbtnColorPrimary,
                  ),
                ],
              ),
              AppServices.addHeight(10.h),
              Row(
                children: [
                  ExpandedButtonView(
                    btnName: "Sign In",
                    onPress: () => showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.r))),
                        context: context,
                        builder: (context) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 30.h),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      ExpandedButtonView(
                                          btnName: "Continue with Email",
                                          bgColor: AppStyles.redHighLightColor,
                                          onPress: () => AppServices.pushTo(
                                              context, EmailLoginFormView())),
                                    ],
                                  ),
                                  AppServices.addHeight(10.h),
                                  Row(
                                    children: [
                                      ExpandedButtonView(
                                          btnName: "Continue with Phone Number",
                                          onPress: () => AppServices.pushTo(
                                              context, PhoneLoginView())),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                    radius: 60,
                    bgColor: AppStyles.onBoardbtnColorseconday,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
