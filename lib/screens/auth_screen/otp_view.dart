import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/screens/auth_screen/auth_completion.dart';
import 'package:q_arena_user_application/screens/auth_screen/form_footer_section.dart';
import 'package:q_arena_user_application/screens/auth_screen/phone_auth/create_pass.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

import '../../components/session_divider.dart';
import '../../components/social_icon_button.dart';
import '../../services/base_components.dart';

class OtpVerificationView extends StatefulWidget {
  bool isEmail;
  OtpVerificationView({super.key, required this.isEmail});

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  final OtpFieldController _otpCtrl = OtpFieldController();
  final TextEditingController _controller = TextEditingController();
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
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppServices.addHeight(20.h),
            Text("OTP Verification", style: AppStyles.largeHeader),
            AppServices.addHeight(10.h),
            Text("Enter the verification code we just sent on your Phone ",
                style: AppStyles.bodyMedium
                    .copyWith(color: AppStyles.textColorBlack50)),
            AppServices.addHeight(20.h),
            OTPTextField(
              controller: _otpCtrl,
              length: 4,
              width: AppServices.getScreenWidth(context),
              style: AppStyles.bodyLarge,
              fieldWidth: 50.w,
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              onCompleted: (value) => setState(() => _controller.text = value),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              fieldStyle: FieldStyle.box,
              otpFieldStyle: OtpFieldStyle(
                  focusBorderColor: AppStyles.btnColorPrimary,
                  borderColor: AppStyles.btnColorPrimary),
            ),
            AppServices.addHeight(30.h),
            ExpandedButtonView(btnName: "Verify", onPress: () => getRoute()),
            Expanded(child: SizedBox()),
            FormFooterSectionView(dividerText: "Or Register with"),
            AppServices.addHeight(40.h),
            footerTextBtn("Didn't received code?", "Resend"),
            AppServices.addHeight(30.h)
          ],
        ),
      )),
    );
  }

  getRoute() {
    switch (widget.isEmail) {
      case true:
        return AppServices.pushTo(context, AuthCompletionDialog());
      default:
        return AppServices.pushTo(context, CreatePhonePassView());
    }
  }
}
