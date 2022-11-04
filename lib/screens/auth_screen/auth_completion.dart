import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class AuthCompletionDialog extends StatefulWidget {
  const AuthCompletionDialog({super.key});

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
              Text("Account Created", style: AppStyles.largeHeader),
              AppServices.addHeight(10.h),
              Text(
                  "Your account is created\nsuccessfully. Now login and\ncomplete your profile",
                  textAlign: TextAlign.center,
                  style: AppStyles.bodyMedium
                      .copyWith(color: AppStyles.textColorBlack50)),
              AppServices.addHeight(20.h),
              ExpandedButtonView(btnName: "Back to Login", onPress: () {})
            ],
          ),
        ),
      )),
    );
  }
}
