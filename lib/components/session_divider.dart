import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/style_sheet.dart';

class SessionTextDivider extends StatelessWidget {
  String text;
  SessionTextDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox(child: Divider(thickness: 1.3))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(text, style: AppStyles.bodyMedium),
        ),
        const Expanded(child: SizedBox(child: Divider(thickness: 1.3))),
      ],
    );
  }
}
