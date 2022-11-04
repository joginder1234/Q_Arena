import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class CustomTabSwitch extends StatelessWidget {
  List<String> values;
  double radius;
  Color activeColor, inActiveColor;
  TextStyle activeStyle, inActiveStyle;
  int activeIndex;
  Function(int) onValueChange;
  CustomTabSwitch({
    super.key,
    required this.values,
    required this.activeIndex,
    required this.onValueChange,
    this.radius = 15,
    this.activeColor = AppStyles.btnColorPrimary,
    this.inActiveColor = AppStyles.borderColor,
    this.activeStyle = const TextStyle(),
    this.inActiveStyle = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: inActiveColor),
      child: Row(
        children: List.generate(
            values.length,
            (index) => Expanded(
                  child: InkWell(
                    onTap: () => onValueChange(index),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                          color: activeIndex == index
                              ? activeColor
                              : inActiveColor,
                          borderRadius: BorderRadius.circular(radius)),
                      child: Center(
                        child: Text(values[index],
                            style: activeIndex == index
                                ? activeStyle
                                : inActiveStyle),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
