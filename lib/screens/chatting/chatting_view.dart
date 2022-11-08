import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_trainer/services/stylesheet.dart';

import '../../classes/basic_models.dart';
import '../../services/get_services.dart';
import '../../services/icons.dart';

class ChattingView extends StatefulWidget {
  const ChattingView({super.key});

  @override
  State<ChattingView> createState() => _ChattingViewState();
}

class _ChattingViewState extends State<ChattingView> {
  List<MessageClass> message = [
    MessageClass("Esha", "Hey, do you want to play at aspire court?",
        "09:34 PM", AppImages.dummyProfile, true, true),
    MessageClass("Nicki", "Thanks, Yessie! lets book soon.", "09:34 PM",
        AppImages.dummyProfile, true, false),
    MessageClass("Micheal", "No rush buddy, we can play next week.", "09:34 PM",
        AppImages.dummyProfile, true, true),
    MessageClass("Arnold", "Okay, I will invite her to the team.", "09:34 PM",
        AppImages.dummyProfile, true, true),
    MessageClass("Sebastien", "Cool, friday game is on!", "09:34 PM",
        AppImages.dummyProfile, false, true),
    MessageClass("John", "Great game today, well done!", "09:34 PM",
        AppImages.dummyProfile, true, true),
    MessageClass("Disha", "Wanna play padel tommorrow?", "09:34 PM",
        AppImages.dummyProfile, true, true),
    MessageClass("Emily", "Hey! let's go bowling on Friday.", "09:34 PM",
        AppImages.dummyProfile, false, true),
    MessageClass("Kai", "No rush buddy, we can play next week.", "09:34 PM",
        AppImages.dummyProfile, true, true),
    MessageClass("Ruby", "Okay, I will invite her to the team.", "09:34 PM",
        AppImages.dummyProfile, true, true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: AppColors.darkBGColor,
          foregroundColor: AppColors.whiteColor,
          title: Text(
            "Messages",
            textScaleFactor: FlutterService.scaleFactorText(context),
            style: GetTextTheme.sf16_Bold,
          ),
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
                        padding: EdgeInsets.symmetric(horizontal: 25.w)
                            .copyWith(bottom: 20.h, top: 30.h),
                        child: Column(
                          children: List.generate(
                              message.length,
                              (index) => GestureDetector(
                                    onTap: () {
                                      // FlutterService.pushTo(context, InviteView());
                                    },
                                    child: Card(
                                      child: ListTile(
                                          leading: Stack(children: [
                                            CircleAvatar(
                                                radius: 20.r,
                                                backgroundImage:
                                                    const AssetImage(AppImages
                                                        .dummyProfile)),
                                            Positioned(
                                                bottom: 3,
                                                right: 3,
                                                child: message[index]
                                                            .isOnline ==
                                                        true
                                                    ? Container(
                                                        width: 7,
                                                        height: 7,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: AppColors
                                                              .greenHighlighterColor,
                                                        ))
                                                    : const SizedBox())
                                          ]),
                                          title: Text(message[index].name,
                                              textScaleFactor: FlutterService
                                                  .scaleFactorText(context),
                                              style: GetTextTheme.sf12_Bold),
                                          subtitle: Row(children: [
                                            message[index].isSeen == true
                                                ? const Icon(Icons.done_all,
                                                    size: 14)
                                                : const SizedBox(),
                                            FlutterService.addWidth(4),
                                            Expanded(
                                                child: SizedBox(
                                                    child: Text(
                                                        message[index].message,
                                                        textScaleFactor:
                                                            FlutterService
                                                                .scaleFactorText(
                                                                    context),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GetTextTheme
                                                            .sf10_regular)))
                                          ]),
                                          trailing: Text(message[index].time,
                                              textScaleFactor: FlutterService
                                                  .scaleFactorText(context),
                                              style:
                                                  GetTextTheme.sf10_regular)),
                                    ),
                                  )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
