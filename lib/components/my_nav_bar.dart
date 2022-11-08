import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/classes/basic_models.dart';
import 'package:q_arena_trainer/services/get_services.dart';
import 'package:q_arena_trainer/services/stylesheet.dart';

class MyBottomNavBar extends StatelessWidget {
  List<BottomNavItemsClass> items;
  double iconSize;
  int activeIndex;
  Color activeColor, inactiveColor;
  Function(int) ontap;
  MyBottomNavBar(
      {super.key,
      required this.items,
      required this.ontap,
      required this.activeIndex,
      this.activeColor = AppColors.btnColor,
      this.inactiveColor = AppColors.blackLightColor,
      this.iconSize = 25});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: const [
              BoxShadow(color: AppColors.blackLightColor, blurRadius: 5)
            ]),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: FlutterService.getScreenWidth(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              items.length,
              (i) => IconButton(
                  onPressed: () => ontap(i),
                  iconSize: iconSize.sp,
                  icon: Image.asset(
                    items[i].icon,
                    height: iconSize.h,
                    color: activeIndex == i ? activeColor : inactiveColor,
                  ))),
        ),
      ),
    );
  }
}
