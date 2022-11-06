import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/app_textField.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/base_components.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: AppBar(
        backgroundColor: AppStyles.whiteColor,
        foregroundColor: AppStyles.textColorBlack100,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppServices.addHeight(20.h),
            Text("Forgot Password?",
                style: AppStyles.largeHeader,
                textScaleFactor: AppServices.scaleFactorText(context)),
            AppServices.addHeight(10.h),
            Text(
                "Don't worry! It occurs. Please enter the email address linked with your account.",
                style: AppStyles.bodyMedium
                    .copyWith(color: AppStyles.textColorBlack50, height: 1.5)),
            AppServices.addHeight(30.h),
            AppTextField(
              hint: "Enter your email",
            ),
            AppServices.addHeight(110.h),
            ExpandedButtonView(btnName: "Send Code", onPress: () {})
          ],
        ),
      )),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.only(bottom: 40.h),
        child: Center(
          child: footerTextBtn("Remember Password? ", "Login", () {}),
        ),
      ),
    );
  }
}
