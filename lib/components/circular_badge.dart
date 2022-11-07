import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/app_services.dart';
import '../services/style_sheet.dart';

class CircularBadgeView extends StatelessWidget {
  String child;
  bool isIcon, showBorder, expandImage;
  double transformValue, radius, textSize;

  Color bgColor, textColor;
  CircularBadgeView(
      {Key? key,
      this.child = '',
      this.isIcon = false,
      this.showBorder = false,
      this.expandImage = false,
      this.transformValue = 0,
      this.radius = 60,
      this.textSize = 24,
      this.textColor = AppStyles.textColorBlack100,
      this.bgColor = AppStyles.redHighLightColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: AppServices.scaleFactorText(context),
      duration: Duration(milliseconds: 200),
      child: Container(
        transform: Matrix4.translationValues(transformValue, 0, 0),
        alignment: Alignment.center,
        width: radius.w,
        height: radius.w,
        decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            border: showBorder
                ? Border.all(color: AppStyles.textColorBlack50, width: 2)
                : null),
        child: isIcon
            ? expandImage
                ? Image.asset(
                    child,
                    fit: BoxFit.cover,
                    scale: AppServices.scaleFactorText(context),
                  )
                : Image.asset(
                    child,
                    scale: AppServices.scaleFactorText(context),
                    height: 35.h,
                  )
            : Text(child,
                style: AppStyles.heading1
                    .copyWith(fontSize: textSize, color: textColor)),
      ),
    );
  }
}
