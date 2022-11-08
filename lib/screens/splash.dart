import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/screens/Auth/sign_in.dart';
import 'package:q_arena_trainer/screens/bottom_nav_screen.dart';
import 'package:q_arena_trainer/services/get_services.dart';
import 'package:q_arena_trainer/services/icons.dart';

import '../config.dart';
import '../services/stylesheet.dart';

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
        () => FlutterService.pushTo(context, SignInView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: FlutterService.getScreenHeight(context),
        width: FlutterService.getScreenWidth(context),
        decoration: const BoxDecoration(color: AppColors.blackColor100),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppConfig.appLogo,
                scale: FlutterService.scaleFactorText(context),
                height: 130.h,
              ),
              FlutterService.addHeight(8.h),
              Image.asset(
                AppImages.nameImage,
                scale: FlutterService.scaleFactorText(context),
                height: 36.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
