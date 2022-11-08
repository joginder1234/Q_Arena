import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/components/custom_textfield.dart';
import 'package:q_arena_trainer/components/expanded_button.dart';
import 'package:q_arena_trainer/screens/Auth/activateProfile.dart';
import 'package:q_arena_trainer/services/get_services.dart';
import 'package:q_arena_trainer/services/stylesheet.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.darkBGColor,
        foregroundColor: AppColors.darkBGColor,
        elevation: 0,
        title: Text(
          "Sign in",
          style: GetTextTheme.sf16_Bold.copyWith(color: AppColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: FlutterService.getScreenWidth(context),
            height: FlutterService.getScreenHeight(context) * 0.5,
            color: AppColors.darkBGColor,
          ),
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlutterService.addHeight(26.h),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.r)),
                        color: AppColors.whiteColor),
                    width: FlutterService.getScreenWidth(context),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        children: [
                          FlutterService.addHeight(113.h),
                          CustomTextField(
                            controller: emailController,
                            hint: "email",
                          ),
                          FlutterService.addHeight(20.h),
                          CustomTextField(
                            controller: passwordController,
                            hint: "password",
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgot Password?",
                                  textScaleFactor:
                                      FlutterService.scaleFactorText(context),
                                  style: GetTextTheme.sf12_Regular
                                      .copyWith(color: AppColors.blackColor100),
                                )),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: AppColors.btnColor,
                                  checkColor: AppColors.whiteColor,
                                  value: isChecked,
                                  onChanged: (value) => setState(() {
                                        isChecked = value!;
                                      })),
                              FlutterService.addWidth(5.w),
                              Text(
                                "Remember Me",
                                textScaleFactor:
                                    FlutterService.scaleFactorText(context),
                                style: GetTextTheme.sf14_Regular,
                              )
                            ],
                          ),
                          FlutterService.addHeight(20.h),
                          Row(
                            children: [
                              ExpandedButtonView(
                                  onTap: () {
                                    FlutterService.pushTo(
                                        context, ActivateProfileView());
                                  },
                                  title: "Sign in"),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     ExpandedButtonView(
                          //       onTap: () {},
                          //       title: "Sign up",
                          //       btnColor: AppColors.darkBGColor,
                          //     ),
                          //   ],
                          // ),
                          FlutterService.addHeight(30.h),
                          Row(
                            children: [
                              const Expanded(
                                  child: SizedBox(
                                child: Divider(
                                    thickness: 1.2,
                                    color: AppColors.blackLightColor),
                              )),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    "OR",
                                    textAlign: TextAlign.center,
                                    style: GetTextTheme.sf14_Bold,
                                  )),
                              const Expanded(
                                  child: SizedBox(
                                child: Divider(
                                    thickness: 1.2,
                                    color: AppColors.blackLightColor),
                              )),
                            ],
                          ),

                          FlutterService.addHeight(30.h),
                          Row(
                            children: [
                              ExpandedButtonView(
                                onTap: () {},
                                title: "Facebook",
                                btnColor: AppColors.fbColor,
                              ),
                              FlutterService.addWidth(25.w),
                              ExpandedButtonView(
                                onTap: () {},
                                title: "Twitter",
                                btnColor: AppColors.twitterColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
