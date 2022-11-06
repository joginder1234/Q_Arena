import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/components/password_textfield.dart';
import 'package:q_arena_user_application/screens/auth_screen/auth_completion.dart';
import 'package:q_arena_user_application/screens/auth_screen/auth_tabbar.dart';
import 'package:q_arena_user_application/screens/auth_screen/form_footer_section.dart';
import 'package:q_arena_user_application/services/app_services.dart';

import '../../../services/base_components.dart';
import '../../../services/style_sheet.dart';

class CreatePhonePassView extends StatefulWidget {
  const CreatePhonePassView({super.key});

  @override
  State<CreatePhonePassView> createState() => _CreatePhonePassViewState();
}

class _CreatePhonePassViewState extends State<CreatePhonePassView> {
  bool _textObsecure = true;
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
            AppServices.addHeight(80.h),
            Text("Create a Password", style: AppStyles.largeHeader),
            AppServices.addHeight(80.h),
            PasswordTextFieldView(
              hint: "Enter your password",
              isObsecure: _textObsecure,
              onSuffixPressed: () =>
                  setState(() => _textObsecure = !_textObsecure),
            ),
            AppServices.addHeight(70.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password?",
                      style: AppStyles.bodyMedium
                          .copyWith(color: AppStyles.textColorBlack100))),
            ),
            AppServices.addHeight(30.h),
            ExpandedButtonView(
                btnName: "Set Phone Password",
                onPress: () => AppServices.pushTo(
                    context, AuthCompletionDialog(isEmail: false))),
            AppServices.addHeight(35.h),
            FormFooterSectionView(dividerText: "Or Login with"),
            AppServices.addHeight(116.h),
            footerTextBtn("Don't have an account?", "Register Now",
                () => AppServices.pushTo(context, AuthTabBarView()))
          ],
        ),
      )),
    );
  }
}
