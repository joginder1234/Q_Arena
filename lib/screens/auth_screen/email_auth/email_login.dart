import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/app_textField.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/components/password_textfield.dart';
import 'package:q_arena_user_application/screens/auth_screen/auth_tabbar.dart';
import 'package:q_arena_user_application/screens/auth_screen/forgot_pass.dart';
import 'package:q_arena_user_application/screens/auth_screen/form_footer_section.dart';
import 'package:q_arena_user_application/screens/preference_selections/date_of_birth.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/base_components.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

import '../../../configs/app_config.dart';

class EmailLoginFormView extends StatefulWidget {
  const EmailLoginFormView({super.key});

  @override
  State<EmailLoginFormView> createState() => _EmailLoginFormViewState();
}

class _EmailLoginFormViewState extends State<EmailLoginFormView> {
  bool _textObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                AppServices.addHeight(27.h),
                Text("Welcome", style: AppStyles.largeHeader),
                AppServices.addHeight(20.h),
                Image.asset(AppConfig.appLogo, height: 80.h),
                AppServices.addHeight(25.h),
                AppTextField(
                  hint: "Enter your email",
                ),
                AppServices.addHeight(15.h),
                PasswordTextFieldView(
                  hint: "Enter your password",
                  isObsecure: _textObsecure,
                  onSuffixPressed: () =>
                      setState(() => _textObsecure = !_textObsecure),
                ),
                AppServices.addHeight(15.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () =>
                          AppServices.pushTo(context, ForgotPasswordView()),
                      child: Text("Forgot Password?",
                          style: AppStyles.bodyMedium.copyWith(
                              color: AppStyles.textColorBlack50,
                              fontWeight: FontWeight.w700))),
                ),
                AppServices.addHeight(30.h),
                Row(
                  children: [
                    ExpandedButtonView(
                        btnName: "Login",
                        onPress: () =>
                            AppServices.pushTo(context, DateOfBirth())),
                  ],
                ),
                AppServices.addHeight(100.h),
                FormFooterSectionView(dividerText: "Or Register with"),
                AppServices.addHeight(50.h),
                footerTextBtn("Don't have an account?", "Register Now",
                    () => AppServices.pushTo(context, AuthTabBarView()))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
