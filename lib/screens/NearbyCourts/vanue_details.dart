import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/screens/preference_selections/bookingCalender.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/base_components.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class VanueDetailsView extends StatefulWidget {
  const VanueDetailsView({super.key});

  @override
  State<VanueDetailsView> createState() => _VanueDetailsViewState();
}

class _VanueDetailsViewState extends State<VanueDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => share("Q_Arena Title", "https://google.com"),
              icon: Image.asset(AppIcons.shareIcon)),
          IconButton(onPressed: () {}, icon: Image.asset(AppIcons.fvrtIcon)),
        ],
      ),
      body: Container(
        width: AppServices.getScreenWidth(context),
        height: AppServices.getScreenHeight(context),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.vanueBg), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppServices.addHeight(150.h),
                Text("Aspire Football Pitch",
                    style: AppStyles.largeHeader
                        .copyWith(color: AppStyles.whiteColor)),
                Text("Al Waab Street، 23833، Doha",
                    style: AppStyles.bodyMedium
                        .copyWith(color: AppStyles.whiteColor)),
                AppServices.addHeight(15.h),
                ...List.generate(
                    facilities.length,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            children: [
                              Image.asset(facilities[index].icon, height: 18.h),
                              AppServices.addWidth(15.w),
                              Text(
                                facilities[index].facility,
                                style: AppStyles.captionLarge
                                    .copyWith(color: AppStyles.whiteColor),
                              )
                            ],
                          ),
                        )),
                AppServices.addHeight(50.h),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(color: AppStyles.whiteColor, thickness: 1.3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("80 QAR\ntotal price",
                            textAlign: TextAlign.center,
                            style: AppStyles.bodyMedium
                                .copyWith(color: AppStyles.whiteColor)),
                        const SizedBox(
                            height: 60,
                            child: VerticalDivider(
                                color: AppStyles.whiteColor, thickness: 1.3)),
                        Text("30 min\nduration",
                            textAlign: TextAlign.center,
                            style: AppStyles.bodyMedium
                                .copyWith(color: AppStyles.whiteColor)),
                        const SizedBox(
                            height: 60,
                            child: VerticalDivider(
                                color: AppStyles.whiteColor, thickness: 1.3)),
                        Text("⬤ ⬤ ⬤\nAll Levels",
                            textAlign: TextAlign.center,
                            style: AppStyles.bodyMedium
                                .copyWith(color: AppStyles.whiteColor)),
                      ],
                    ),
                    const Divider(color: AppStyles.whiteColor, thickness: 1.3)
                  ],
                ),
                AppServices.addHeight(35.h),
                Center(
                  child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20.r))),
                            constraints: BoxConstraints(
                                maxHeight:
                                    AppServices.getScreenHeight(context) *
                                        0.8.h),
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return BookingCalenderView();
                            });
                      },
                      child: Text("View Schedule",
                          style: AppStyles.bodyMedium.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppStyles.whiteColor))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
