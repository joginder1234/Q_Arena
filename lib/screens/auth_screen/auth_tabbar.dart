import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/custome_tab_switch.dart';
import 'package:q_arena_user_application/components/session_divider.dart';
import 'package:q_arena_user_application/components/social_icon_button.dart';
import 'package:q_arena_user_application/screens/auth_screen/form_footer_section.dart';
import 'package:q_arena_user_application/screens/auth_screen/phone_auth/phone_auth_form.dart';
import 'package:q_arena_user_application/services/icons.dart';

import '../../services/app_services.dart';
import '../../services/base_components.dart';
import '../../services/style_sheet.dart';
import 'email_auth/email_auth_form.dart';

class AuthTabBarView extends StatefulWidget {
  const AuthTabBarView({super.key});

  @override
  State<AuthTabBarView> createState() => _AuthTabBarViewState();
}

class _AuthTabBarViewState extends State<AuthTabBarView> {
  List<String> tabBar = ["Email", "Phone Number"];
  int activeTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            AppServices.addHeight(30.h),
            Center(
              child: Text("Sign in to continue",
                  textScaleFactor: 1.0, style: AppStyles.bodyLarge),
            ),
            AppServices.addHeight(10.h),
            CustomTabSwitch(
                values: tabBar,
                activeStyle:
                    AppStyles.bodyMedium.copyWith(color: AppStyles.whiteColor),
                inActiveStyle: AppStyles.bodyMedium,
                activeIndex: activeTabIndex,
                onValueChange: (value) =>
                    setState(() => activeTabIndex = value)),
            activeTabIndex == 0
                ? const EmailLoginView()
                : const PhoneAuthView(),
            AppServices.addHeight(15.h),
            FormFooterSectionView(dividerText: "Or Register with"),
            AppServices.addHeight(30.h),
            footerTextBtn("Already have an account?", "Login Now")
          ],
        ),
      )),
    );
  }
}
