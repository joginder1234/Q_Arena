import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/screens/auth_screen/email_auth/email_login.dart';
import 'package:q_arena_user_application/screens/auth_screen/phone_auth/phone_login.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class AuthCompletionDialog extends StatefulWidget {
  bool isEmail;
  AuthCompletionDialog({super.key, required this.isEmail});

  @override
  State<AuthCompletionDialog> createState() => _AuthCompletionDialogState();
}

class _AuthCompletionDialogState extends State<AuthCompletionDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppIcons.successLogo, height: 100.h),
              AppServices.addHeight(35.h),
              Text("Account Created", style: AppStyles.largeHeader),
              AppServices.addHeight(10.h),
              Text(
                  "Your account is created\nsuccessfully. Now login and\ncomplete your profile",
                  textAlign: TextAlign.center,
                  style: AppStyles.bodyMedium.copyWith(
                      color: AppStyles.textColorBlack50, height: 1.5)),
              AppServices.addHeight(17.h),
              Row(
                children: [
                  ExpandedButtonView(
                      btnName: "Back to Login", onPress: () => getRoute()),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  getRoute() {
    switch (widget.isEmail) {
      case true:
        return AppServices.pushTo(context, EmailLoginFormView());
      default:
        return AppServices.pushTo(context, PhoneLoginView());
    }
  }
}
