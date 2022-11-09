import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

import '../../components/circular_badge.dart';

class SuggestedPlaymatesView extends StatefulWidget {
  const SuggestedPlaymatesView({Key? key}) : super(key: key);

  @override
  State<SuggestedPlaymatesView> createState() => _SuggestedPlaymatesViewState();
}

class _SuggestedPlaymatesViewState extends State<SuggestedPlaymatesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppStyles.redHighLightColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h)
            .copyWith(top: 0),
        child: Column(
          children: [
            Text(
              "Interested in Padel",
              textScaleFactor: AppServices.scaleFactorText(context),
              style: AppStyles.heading2.copyWith(fontWeight: FontWeight.w900),
            ),
            Text(
              "200 other users",
              textScaleFactor: AppServices.scaleFactorText(context),
              style: AppStyles.captionLarge.copyWith(),
            ),
            SizedBox(
              width: 120,
              child: Stack(
                children: List.generate(
                    5,
                    (i) => CircularBadgeView(
                          isIcon: true,
                          child: AppImages.profileImage,
                          expandImage: true,
                          radius: 30,
                          bgColor: AppStyles.whiteColor,
                          transformValue: i * (120 / 5).w,
                        )),
              ),
            ),
            AppServices.addHeight(20.h),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (ctx, i) => Row(
                          children: [
                            AnimatedScale(
                                scale: AppServices.scaleFactorText(context),
                                duration: const Duration(milliseconds: 200),
                                child: Container(
                                    height: 138.h,
                                    width: 105.w,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                AppImages.playerImage),
                                            fit: BoxFit.cover)))),
                            Expanded(
                              child: SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w, vertical: 6.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("John, 20",
                                              textScaleFactor:
                                                  AppServices.scaleFactorText(
                                                      context),
                                              style: AppStyles.bodyMedium
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500)),
                                          GestureDetector(
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  width: 30.w,
                                                  height: 30.w,
                                                  decoration: const BoxDecoration(
                                                      color: AppStyles
                                                          .redHighLightColor,
                                                      shape: BoxShape.circle),
                                                  child: Text("+",
                                                      textScaleFactor:
                                                          AppServices
                                                              .scaleFactorText(
                                                                  context),
                                                      style: AppStyles.heading2
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: AppStyles
                                                                  .whiteColor),
                                                      textAlign:
                                                          TextAlign.center)))
                                        ],
                                      ),
                                      AppServices.addHeight(5.h),
                                      Text(
                                        "1.5 km away",
                                        textScaleFactor:
                                            AppServices.scaleFactorText(
                                                context),
                                        style: AppStyles.captionLarge.copyWith(
                                            fontWeight: FontWeight.w300),
                                      ),
                                      AppServices.addHeight(5.h),
                                      Text(
                                        "Looking for football players.",
                                        textScaleFactor:
                                            AppServices.scaleFactorText(
                                                context),
                                        style: AppStyles.bodySmall.copyWith(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      AppServices.addHeight(5.h),
                                      Wrap(
                                        runSpacing: 10.w,
                                        spacing: 10.w,
                                        children: List.generate(5, (index) {
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w, vertical: 5.h),
                                            decoration: BoxDecoration(
                                                color: AppStyles
                                                    .redHighLightColor
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Football",
                                                    textScaleFactor: AppServices
                                                        .scaleFactorText(
                                                            context),
                                                    style: AppStyles.caption
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                AppServices.addWidth(3.w),
                                                Image.asset(
                                                    AppIcons.footballIcon,
                                                    scale: AppServices
                                                        .scaleFactorText(
                                                            context),
                                                    height: 10.h)
                                              ],
                                            ),
                                          );
                                        }),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
