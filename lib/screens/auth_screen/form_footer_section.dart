import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/session_divider.dart';
import '../../components/social_icon_button.dart';
import '../../services/app_services.dart';
import '../../services/base_components.dart';
import '../../services/style_sheet.dart';

class FormFooterSectionView extends StatelessWidget {
  String dividerText;
  FormFooterSectionView({super.key, required this.dividerText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SessionTextDivider(text: dividerText),
        AppServices.addHeight(15.h),
        Row(
          children: List.generate(
              socialBtn.length,
              (i) => Expanded(
                      child: SocialButtonView(
                    icon: socialBtn[i],
                    onTap: () {},
                    index: (i == 0 || i == socialBtn.length - 1) ? 0 : i,
                  ))),
        ),
      ],
    );
  }
}
