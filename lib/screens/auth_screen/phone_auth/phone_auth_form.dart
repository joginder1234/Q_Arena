import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:q_arena_user_application/screens/auth_screen/otp_view.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

import '../../../components/app_textField.dart';
import '../../../components/expanded_btn.dart';
import '../../../services/app_services.dart';

class PhoneAuthView extends StatefulWidget {
  const PhoneAuthView({super.key});

  @override
  State<PhoneAuthView> createState() => _PhoneAuthViewState();
}

class _PhoneAuthViewState extends State<PhoneAuthView> {
  final TextEditingController _phoneCtrl = TextEditingController();
  final FocusNode _keyboardfocus = FocusNode();
  bool radioValue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppServices.addHeight(50.h),
          InternationalPhoneNumberInput(
              inputBorder: OutlineInputBorder(borderSide: BorderSide.none),
              textFieldController: _phoneCtrl,
              textStyle: AppStyles.bodyMedium,
              focusNode: _keyboardfocus,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              onInputChanged: (phone) => print(phone.phoneNumber)),
          Divider(),
          AppServices.addHeight(20.h),
          Row(
            children: [
              Checkbox(
                  value: radioValue,
                  onChanged: (v) => setState(() => radioValue = !radioValue)),
              Expanded(
                  child: SizedBox(
                child: Text.rich(TextSpan(
                    text: "By Signing up, you agree to the ",
                    style: AppStyles.bodySmall
                        .copyWith(color: AppStyles.textColorBlack50),
                    children: [
                      TextSpan(
                          text: "Term of Service",
                          style: AppStyles.bodySmall
                              .copyWith(color: AppStyles.textColorBlack100)),
                      TextSpan(
                          text: " and ",
                          style: AppStyles.bodySmall
                              .copyWith(color: AppStyles.textColorBlack50)),
                      TextSpan(
                          text: "Privacy Policy",
                          style: AppStyles.bodySmall
                              .copyWith(color: AppStyles.textColorBlack100)),
                    ])),
              ))
            ],
          ),
          AppServices.addHeight(100.h),
          Row(
            children: [
              ExpandedButtonView(
                btnName: "Send Otp",
                onPress: () => AppServices.pushTo(
                    context, OtpVerificationView(isEmail: false)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
