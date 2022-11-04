import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/style_sheet.dart';

class AppTextField extends StatelessWidget {
  TextEditingController? controller;
  String hint;
  AppTextField({super.key, this.controller, this.hint = ''});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
          hintText: hint,
          hintStyle: AppStyles.bodyMedium,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppStyles.borderColor))),
    );
  }
}
