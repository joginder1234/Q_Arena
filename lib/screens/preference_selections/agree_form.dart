import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/flexible_button.dart';
import 'package:q_arena_user_application/configs/terms_and_agreement.dart';
import 'package:q_arena_user_application/screens/preference_selections/choose_sports.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/base_components.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

import '../../configs/app_config.dart';

class ProfileAgreeForm extends StatelessWidget {
  const ProfileAgreeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 45.w),
        child: Column(
          children: [
            AppServices.addHeight(5.h),
            stepCreator(5, context),
            Center(
              child: Image.asset(AppConfig.appLogo, height: 80.h),
            ),
            AppServices.addHeight(40.h),
            Stack(
              children: [
                Text("KINDNESS IS STRENGTH",
                    style: AppStyles.heading1.copyWith(
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 5
                        ..color = AppStyles.textColorBlack100,
                    )),
                Text("KINDNESS IS STRENGTH",
                    style: AppStyles.heading1
                        .copyWith(color: AppStyles.redHighLightColor))
              ],
            ),
            AppServices.addHeight(30.h),
            Text(
              profileAgreement,
              style: AppStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic),
            ),
            AppServices.addHeight(120.h),
            FlexibleButton(
                btnName: "I AGREE",
                onPress: () => AppServices.pushTo(context, ChooseSportsView()))
          ],
        ),
      )),
    );
  }
}
