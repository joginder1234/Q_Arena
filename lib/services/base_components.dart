import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:q_arena_user_application/models/basic_models.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

List<String> socialBtn = [
  AppIcons.fbLogo,
  AppIcons.googleLogo,
  AppIcons.appleLogo
];

Widget footerTextBtn(String btnText1, String btnText2, Function ontap) =>
    Center(
      child: TextButton(
        onPressed: () => ontap(),
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

stepCreator(int currentStep, BuildContext context) => Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
        height: 50.w,
        width: 50.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppStyles.redHighLightColor),
            color: AppStyles.redHighLightColor.withOpacity(0.1)),
        child: Center(
          child: Text.rich(
              textScaleFactor: AppServices.scaleFactorText(context),
              TextSpan(
                  text: "$currentStep",
                  style: AppStyles.largeHeader,
                  children: [
                    TextSpan(text: "/6", style: AppStyles.bodySmall)
                  ])),
        ),
      ),
    );

List<FacilityClass> facilities = [
  FacilityClass(AppIcons.parkingIcon, "Parking Available"),
  FacilityClass(AppIcons.wheelChairIcon, "Disabled Access"),
  FacilityClass(AppIcons.showerIcon, "Chanding & Shower Room"),
  FacilityClass(AppIcons.coffeeIcon, "Cafe"),
  FacilityClass(AppIcons.trainIcon, "5 min from Metro")
];

Future<void> share(String title, String link) async {
  await FlutterShare.share(
      title: title,
      text: 'Example share text',
      linkUrl: link,
      chooserTitle: 'Example Chooser Title');
}

List<CreditCardClass> cards = [
  CreditCardClass(
      "1526798632458697", "Jahid Mohammad", "01-23", AppImages.visaLogo),
  CreditCardClass(
      "4583219867250053", "Hassan", "07-28", AppImages.masterCardLogo),
];
