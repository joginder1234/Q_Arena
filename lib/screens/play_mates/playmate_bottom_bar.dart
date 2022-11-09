import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class PlayMateBottomSheet extends StatelessWidget {
  const PlayMateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 220.w,
            height: 260.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: const DecorationImage(
                    image: AssetImage(AppImages.playMateBanner),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      gradient: const LinearGradient(
                          stops: [
                            0.2,
                            0.5,
                            0.6
                          ],
                          colors: [
                            AppStyles.textColorBlack100,
                            Colors.transparent,
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Amatul, 30",
                          style: AppStyles.bodyMedium
                              .copyWith(color: AppStyles.whiteColor),
                        ),
                        AppServices.addHeight(10.h),
                        Wrap(
                          spacing: 8.w,
                          children: List.generate(
                              2,
                              (i) => Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: AppStyles.redHighLightColor),
                                    child: Text(i == 0 ? "Swimming" : "Jogging",
                                        style: AppStyles.caption.copyWith(
                                            color: AppStyles.whiteColor)),
                                  )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          AppServices.addHeight(12.h),
          Wrap(
            spacing: 12.w,
            children: [
              BottomSheetButton(icon: Icons.close, ontap: () {}),
              BottomSheetButton(icon: Icons.refresh, ontap: () {}),
              BottomSheetButton(
                  icon: Icons.add,
                  bgColor: AppStyles.redHighLightColor,
                  fgColor: AppStyles.whiteColor,
                  ontap: () {}),
            ],
          )
        ],
      ),
    );
  }
}

class BottomSheetButton extends StatelessWidget {
  IconData icon;
  Function ontap;
  Color bgColor, fgColor;
  BottomSheetButton(
      {Key? key,
      required this.icon,
      required this.ontap,
      this.bgColor = AppStyles.whiteColor,
      this.fgColor = AppStyles.redHighLightColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () => ontap(),
        child: Container(
          height: 54.w,
          width: 54.w,
          decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: AppStyles.borderColor,
                    blurRadius: 2,
                    offset: Offset(-2, 3))
              ]),
          child: Center(
            child: AnimatedScale(
              scale: AppServices.scaleFactorText(context),
              duration: Duration(milliseconds: 200),
              child: Icon(icon, color: fgColor, size: 30.sp),
            ),
          ),
        ),
      );
    });
  }
}
