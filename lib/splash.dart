import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/configs/app_config.dart';
import 'package:q_arena_user_application/on_boarding.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    getSession();
  }

  getSession() {
    Future.delayed(Duration(milliseconds: 1500),
        () => AppServices.pushTo(context, OnBoardingView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: AppServices.getScreenHeight(context),
        width: AppServices.getScreenWidth(context),
        decoration: const BoxDecoration(color: AppStyles.textColorBlack100),
        child: const Center(
          child: SplashAppLogo(),
        ),
      ),
    );
  }
}

class SplashAppLogo extends StatelessWidget {
  const SplashAppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 160.h,
          width: 130.w,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/icons/copyright.png",
                  scale: AppServices.scaleFactorText(context),
                  height: 25.h,
                ),
              ),
              Image.asset(
                AppConfig.appLogo,
                scale: AppServices.scaleFactorText(context),
                height: 130.h,
              ),
            ],
          ),
        ),
        AppServices.addHeight(8.h),
        Image.asset(
          "assets/name.png",
          scale: AppServices.scaleFactorText(context),
          height: 36.h,
        ),
      ],
    );
  }
}
