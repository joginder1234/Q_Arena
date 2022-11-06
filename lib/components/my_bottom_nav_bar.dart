import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class MyBottomNavBar extends StatelessWidget {
  List<MyBottomBarItems> items;
  int activeIndex;
  Function(int) ontap;
  MyBottomNavBar(
      {super.key,
      required this.items,
      required this.activeIndex,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3),
      color: AppStyles.whiteColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length, (i) {
          final myIcon = items[i];
          return i == 2
              ? InkWell(
                  onTap: () => ontap(i),
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      myIcon.icon,
                      fit: BoxFit.cover,
                      height: myIcon.iconsize * 2.5,
                    ),
                  ),
                )
              : IconButton(
                  onPressed: () => ontap(i),
                  icon: Image.asset(
                    myIcon.icon,
                    height: myIcon.iconsize,
                    color: activeIndex == i
                        ? myIcon.activeColor
                        : myIcon.inActiveColor,
                  ));
        }),
      ),
    );
  }
}

class MyBottomBarItems {
  String icon;
  double iconsize;
  Color activeColor, inActiveColor;
  MyBottomBarItems(
      this.icon, this.iconsize, this.activeColor, this.inActiveColor);
}
