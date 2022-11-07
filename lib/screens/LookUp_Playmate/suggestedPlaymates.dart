import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

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
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(5, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.w)
                          .copyWith(top: 17.h),
                      child: Row(
                        children: [
                          Image.asset(
                            AppImages.playerImage,
                            scale: AppServices.scaleFactorText(context),
                            height: 138.h,
                          ),
                          AppServices.addWidth(8.w),
                          Expanded(
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "John, 20",
                                          textScaleFactor:
                                              AppServices.scaleFactorText(
                                                  context),
                                          style: AppStyles.bodyMedium.copyWith(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        GestureDetector(
                                            child: Container(
                                          alignment: Alignment.center,
                                          width: 30.w,
                                          height: 30.w,
                                          decoration: const BoxDecoration(
                                              color:
                                                  AppStyles.redHighLightColor,
                                              shape: BoxShape.circle),
                                          child: Text(
                                            "+",
                                            textScaleFactor:
                                                AppServices.scaleFactorText(
                                                    context),
                                            style: AppStyles.heading2.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: AppStyles.whiteColor),
                                            textAlign: TextAlign.center,
                                          ),
                                        ))
                                      ],
                                    ),
                                    AppServices.addHeight(5.h),
                                    Text(
                                      "1.5 km away",
                                      textScaleFactor:
                                          AppServices.scaleFactorText(context),
                                      style: AppStyles.captionLarge.copyWith(
                                          fontWeight: FontWeight.w300),
                                    ),
                                    AppServices.addHeight(5.h),
                                    Text(
                                      "Looking for football players.",
                                      textScaleFactor:
                                          AppServices.scaleFactorText(context),
                                      style: AppStyles.bodySmall.copyWith(
                                          fontWeight: FontWeight.w400),
                                    ),
                                    AppServices.addHeight(5.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Wrap(
                                              runSpacing: 13.h,
                                              spacing: 11.w,
                                              children:
                                                  List.generate(5, (index) {
                                                return Container(
                                                  alignment: Alignment.center,
                                                  width: 52.w,
                                                  height: 19.h,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3.w,
                                                      vertical: 5.h),
                                                  decoration: BoxDecoration(
                                                      color: AppStyles
                                                          .redHighLightColor
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Football",
                                                        textScaleFactor:
                                                            AppServices
                                                                .scaleFactorText(
                                                                    context),
                                                        style: AppStyles.caption
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                      AppServices.addWidth(3.w),
                                                      Image.asset(
                                                        AppIcons.footballIcon,
                                                        scale: AppServices
                                                            .scaleFactorText(
                                                                context),
                                                        height: 10.h,
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
