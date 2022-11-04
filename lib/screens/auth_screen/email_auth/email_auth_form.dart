import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/app_textField.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/screens/auth_screen/otp_view.dart';
import 'package:q_arena_user_application/services/app_services.dart';

class EmailLoginView extends StatefulWidget {
  const EmailLoginView({super.key});

  @override
  State<EmailLoginView> createState() => _EmailLoginViewState();
}

class _EmailLoginViewState extends State<EmailLoginView> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(hint: "Username", controller: _username),
          AppServices.addHeight(10.h),
          AppTextField(hint: "Email", controller: _email),
          AppServices.addHeight(10.h),
          AppTextField(hint: "Password", controller: _pass),
          AppServices.addHeight(10.h),
          AppTextField(hint: "Confirm Password", controller: _confirmPass),
          AppServices.addHeight(15.h),
          ExpandedButtonView(
            btnName: "Register",
            onPress: () =>
                AppServices.pushTo(context, OtpVerificationView(isEmail: true)),
          )
        ],
      ),
    );
  }
}
