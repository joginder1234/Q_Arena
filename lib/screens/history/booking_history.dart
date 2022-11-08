import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/services/icons.dart';
import 'package:q_arena_trainer/services/stylesheet.dart';

import '../../services/get_services.dart';

class BookingHistoryView extends StatefulWidget {
  const BookingHistoryView({super.key});

  @override
  State<BookingHistoryView> createState() => _BookingHistoryViewState();
}

class _BookingHistoryViewState extends State<BookingHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: AppColors.darkBGColor,
          foregroundColor: AppColors.whiteColor,
          elevation: 0,
          title: Text("Messages",
              textScaleFactor: FlutterService.scaleFactorText(context),
              style: GetTextTheme.sf16_Bold),
          centerTitle: true),
      body: Stack(
        children: [
          Container(
            width: FlutterService.getScreenWidth(context),
            height: FlutterService.getScreenHeight(context) * 0.5.h,
            color: AppColors.darkBGColor,
          ),
          SafeArea(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                color: AppColors.grayLightColor),
            width: FlutterService.getScreenWidth(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: SizedBox(
                        child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
                    child: Column(
                      children: List.generate(
                          6,
                          (index) => ListTile(
                                leading: CircleAvatar(
                                    radius: 25.r,
                                    backgroundImage: const AssetImage(
                                        AppImages.dummyProfile)),
                                title: Text("Jhone Doe",
                                    textScaleFactor:
                                        FlutterService.scaleFactorText(context),
                                    style: GetTextTheme.sf14_Bold),
                                subtitle: Text("06:30 PM - 08:00 PM",
                                    textScaleFactor:
                                        FlutterService.scaleFactorText(context),
                                    style: GetTextTheme.sf12_Regular),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("QAR 100",
                                        textScaleFactor:
                                            FlutterService.scaleFactorText(
                                                context),
                                        style: GetTextTheme.sf14_Regular),
                                    FlutterService.addHeight(11.h),
                                    Text("In PROCESS",
                                        textScaleFactor:
                                            FlutterService.scaleFactorText(
                                                context),
                                        style: GetTextTheme.sf12_Regular),
                                  ],
                                ),
                              )),
                    ),
                  ),
                )))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
