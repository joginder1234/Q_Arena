import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/flexible_button.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/base_components.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class ExperienceRatingView extends StatefulWidget {
  const ExperienceRatingView({Key? key}) : super(key: key);

  @override
  State<ExperienceRatingView> createState() => _ExperienceRatingViewState();
}

class _ExperienceRatingViewState extends State<ExperienceRatingView> {
  List<int> selectedIndex = [];
  bool isSelected(int index) =>
      selectedIndex.any((element) => element == index);

  setIsSelected(int index) {
    if (selectedIndex.any((element) => element == index)) {
      selectedIndex.removeWhere((element) => element == index);
    } else {
      selectedIndex.add(index);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 10.h),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "HOW WAS YOUR EXPERIENCE?",
                  textScaleFactor: AppServices.scaleFactorText(context),
                  style: AppStyles.largeHeader
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                AppServices.addHeight(21.h),
                Text(
                  "CAN CHOOSE MORE THAN 1",
                  textScaleFactor: AppServices.scaleFactorText(context),
                  style: AppStyles.bodyMedium
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                AppServices.addHeight(50.h),
                Wrap(
                  runSpacing: 23.h,
                  spacing: 23.w,
                  children: List.generate(experience.length, (i) {
                    final item = experience[i];
                    return InkWell(
                      onTap: () => setIsSelected(i),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedScale(
                            scale: AppServices.scaleFactorText(context),
                            duration: Duration(milliseconds: 200),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(18.sp),
                              width: 90.w,
                              height: 90.w,
                              decoration: BoxDecoration(
                                  color: isSelected(i)
                                      ? AppStyles.redHighLightColor
                                          .withOpacity(0.1)
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all()),
                              child: Image.asset(
                                item.image,
                                scale: AppServices.scaleFactorText(context),
                                width: 85.w,
                              ),
                            ),
                          ),
                          AppServices.addHeight(3.h),
                          Text(
                            item.text,
                            textScaleFactor:
                                AppServices.scaleFactorText(context),
                            style: AppStyles.captionLarge
                                .copyWith(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
            AppServices.addHeight(200.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlexibleButton(btnName: "Continue", onPress: () {}),
                FlexibleButton(
                  btnName: "Skip",
                  onPress: () {},
                  backGroundColor: Colors.transparent,
                  textColor: AppStyles.redHighLightColor,
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
