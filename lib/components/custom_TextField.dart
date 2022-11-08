import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/services/get_services.dart';
import 'package:q_arena_trainer/services/stylesheet.dart';

class CustomTextField extends StatelessWidget {
  String hint, icon;
  TextEditingController? controller;
  CustomTextField({Key? key, this.hint = "", this.controller, this.icon = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          fillColor: AppColors.darkBGColor,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
          hintText: hint,
          hintStyle:
              GetTextTheme.sf14_Regular.copyWith(color: AppColors.whiteColor),
          contentPadding: const EdgeInsets.all(15),
          suffixIcon: icon == ""
              ? null
              : IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    icon,
                    scale: FlutterService.scaleFactorText(context),
                    height: 19.h,
                  ))),
    );
  }
}
