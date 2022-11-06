import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:q_arena_user_application/bottom_nav_bar.dart';
import 'package:q_arena_user_application/components/flexible_button.dart';
import 'package:q_arena_user_application/dashboard.dart';
import 'package:q_arena_user_application/providers/app_data_provider.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class ChooseSportsView extends StatefulWidget {
  const ChooseSportsView({super.key});

  @override
  State<ChooseSportsView> createState() => _ChooseSportsViewState();
}

class _ChooseSportsViewState extends State<ChooseSportsView> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDataProvider>(context);
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      appBar: AppBar(
        backgroundColor: AppStyles.whiteColor,
        foregroundColor: AppStyles.textColorBlack100,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Choose Favorite Sports", style: AppStyles.heading2),
            AppServices.addHeight(5.h),
            Text("You can choose as many as you like",
                style: AppStyles.bodyMedium),
            AppServices.addHeight(15.h),
            Expanded(
              child: SizedBox(
                child: GridView.builder(
                    itemCount: db.getSportsList.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.w),
                    itemBuilder: (context, i) {
                      final item = db.getSportsList[i];
                      return InkWell(
                        onTap: () =>
                            onCategoryChoosen(item.title, !item.isActive, db),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 15.w),
                          decoration: BoxDecoration(
                              color: item.isActive
                                  ? AppStyles.redHighLightColor.withOpacity(0.1)
                                  : AppStyles.whiteColor,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(color: AppStyles.borderColor)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                item.icon,
                                height: 50.h,
                                scale: AppServices.scaleFactorText(context),
                              ),
                              Text(item.title,
                                  textScaleFactor:
                                      AppServices.scaleFactorText(context),
                                  style: AppStyles.bodySmall
                                      .copyWith(fontWeight: FontWeight.w700))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Center(
                child: FlexibleButton(
                    btnName: "Next",
                    onPress: () =>
                        AppServices.pushTo(context, BottomNavBarView())),
              ),
            )
          ],
        ),
      )),
    );
  }

  onCategoryChoosen(String category, bool status, AppDataProvider db) {
    db.markCategoryActive(category, status);
  }
}
