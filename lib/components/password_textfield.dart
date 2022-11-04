import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/style_sheet.dart';

class PasswordTextFieldView extends StatelessWidget {
  bool isObsecure;
  String hint;
  Function? onSuffixPressed;
  PasswordTextFieldView(
      {super.key,
      this.isObsecure = true,
      this.hint = '',
      this.onSuffixPressed});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObsecure,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle:
              AppStyles.bodyMedium.copyWith(color: AppStyles.textColorBlack50),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
          suffixIcon: IconButton(
              onPressed:
                  onSuffixPressed != null ? () => onSuffixPressed!() : null,
              icon: Icon(isObsecure
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppStyles.borderColor))),
    );
  }
}
