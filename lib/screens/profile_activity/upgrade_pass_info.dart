import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/flexible_button.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class UpgradePassInformationView extends StatelessWidget {
  const UpgradePassInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppServices.getScreenWidth(context),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Row(
        children: [
          Image.asset(
            AppImages.memberPassImage,
            scale: AppServices.scaleFactorText(context),
            height: 280.h,
          ),
          AppServices.addWidth(10.w),
          Expanded(
              child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Get membership on your favourite court or coach!",
                    textAlign: TextAlign.center, style: AppStyles.bodyMedium),
                AppServices.addHeight(20.h),
                Text("4 booking sessions per month.",
                    textAlign: TextAlign.center, style: AppStyles.bodyMedium),
                AppServices.addHeight(20.h),
                Text("Invite upto 2 playmate to a game for free!",
                    textAlign: TextAlign.center, style: AppStyles.bodyMedium),
                AppServices.addHeight(20.h),
                Text("Recieve exclusive offers upon renewal. ",
                    textAlign: TextAlign.center, style: AppStyles.bodyMedium),
                AppServices.addHeight(45.h),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            AppStyles.redHighLightColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r))),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h))),
                    onPressed: () {},
                    child: Text("UPGRADE NOW",
                        style: AppStyles.bodySmall
                            .copyWith(color: AppStyles.whiteColor)))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
