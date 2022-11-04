import 'package:flutter/material.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

List<String> socialBtn = [
  AppIcons.fbLogo,
  AppIcons.googleLogo,
  AppIcons.appleLogo
];

footerTextBtn(String btnText1, String btnText2) => Center(
      child: TextButton(
        onPressed: () {},
        child: Text.rich(TextSpan(
            text: "$btnText1 ",
            style: AppStyles.bodyMedium
                .copyWith(color: AppStyles.textColorBlack100),
            children: [
              TextSpan(
                  text: btnText2,
                  style: AppStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppStyles.btnColorPrimary))
            ])),
      ),
    );
