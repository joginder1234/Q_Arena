import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/screens/preference_selections/sap.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';

import '../../components/flexible_button.dart';
import '../../services/app_services.dart';
import '../../services/base_components.dart';
import '../../services/style_sheet.dart';

class PlayWith extends StatefulWidget {
  const PlayWith({Key? key}) : super(key: key);

  @override
  State<PlayWith> createState() => _PlayWithState();
}

class _PlayWithState extends State<PlayWith> {
  List<PlayWithClass> btns = [
    PlayWithClass(AppImages.male_avatar, "Male"),
    PlayWithClass(AppImages.female_avatar, "Female"),
    PlayWithClass(AppImages.trans_avatar, "Mix"),
  ];
  int activeBtn = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 45.w),
        child: Column(
          children: [
            AppServices.addHeight(5.h),
            stepCreator(3, context),
            AppServices.addHeight(18.h),
            Text("You want to play with?", style: AppStyles.heading2),
            AppServices.addHeight(13.h),
            Text("This helps us create your personlized plan",
                style: AppStyles.bodySmall),
            AppServices.addHeight(70.h),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 35,
              runSpacing: 35,
              children: List.generate(
                  btns.length,
                  (i) => GestureDetector(
                        onTap: () => setState(() => activeBtn = i),
                        child: Container(
                          decoration: BoxDecoration(
                              color: i == activeBtn
                                  ? AppStyles.redHighLightColor.withOpacity(0.1)
                                  : AppStyles.whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: AppStyles.textColorBlack50)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          child: Column(
                            children: [
                              Image.asset(
                                btns[i].image,
                                width: 102.w,
                                height: 112.h,
                              ),
                              AppServices.addHeight(5),
                              Text(
                                btns[i].text,
                                style: AppStyles.captionLarge
                                    .copyWith(fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      )),
            ),
            AppServices.addHeight(180.h),
            FlexibleButton(
                btnName: "Next",
                onPress: () {
                  AppServices.pushTo(context, SAPScreen());
                })
          ],
        ),
      )),
    );
  }
}

class PlayWithClass {
  String image, text;
  PlayWithClass(this.image, this.text);
}
