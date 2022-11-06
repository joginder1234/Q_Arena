import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/models/basic_models.dart';
import 'package:q_arena_user_application/screens/LookUp_Playmate/invite.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  List<MessageClass> message = [
    MessageClass("Esha", "Hey, do you want to play at aspire court?",
        "09:34 PM", AppImages.profileImage, true, true),
    MessageClass("Nicki", "Thanks, Yessie! lets book soon.", "09:34 PM",
        AppImages.profileImage, true, false),
    MessageClass("Micheal", "No rush buddy, we can play next week.", "09:34 PM",
        AppImages.profileImage, true, true),
    MessageClass("Arnold", "Okay, I will invite her to the team.", "09:34 PM",
        AppImages.profileImage, true, true),
    MessageClass("Sebastien", "Cool, friday game is on!", "09:34 PM",
        AppImages.profileImage, false, true),
    MessageClass("John", "Great game today, well done!", "09:34 PM",
        AppImages.profileImage, true, true),
    MessageClass("Disha", "Wanna play padel tommorrow?", "09:34 PM",
        AppImages.profileImage, true, true),
    MessageClass("Emily", "Hey! let's go bowling on Friday.", "09:34 PM",
        AppImages.profileImage, false, true),
    MessageClass("Kai", "No rush buddy, we can play next week.", "09:34 PM",
        AppImages.profileImage, true, true),
    MessageClass("Ruby", "Okay, I will invite her to the team.", "09:34 PM",
        AppImages.profileImage, true, true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Messages",
            style: AppStyles.heading2.copyWith(
                fontWeight: FontWeight.w900,
                color: AppStyles.textColorBlack100),
          ),
          foregroundColor: AppStyles.redHighLightColor),
      body: SafeArea(
          child: Column(
        children: [
          AppServices.addHeight(25.h),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w)
                      .copyWith(bottom: 20.h),
                  child: Column(
                    children: List.generate(
                        message.length,
                        (index) => GestureDetector(
                              onTap: () {
                                AppServices.pushTo(context, InviteView());
                              },
                              child: Card(
                                child: ListTile(
                                  leading: Stack(children: [
                                    CircleAvatar(
                                      radius: 20.r,
                                      backgroundImage: const AssetImage(
                                          AppImages.profileImage),
                                    ),
                                    Positioned(
                                      bottom: 3,
                                      right: 3,
                                      child: message[index].isOnline == true
                                          ? Container(
                                              width: 7,
                                              height: 7,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppStyles.greenColor,
                                              ),
                                            )
                                          : const SizedBox(),
                                    )
                                  ]),
                                  title: Text(
                                    message[index].name,
                                    style: AppStyles.captionLarge
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      message[index].isSeen == true
                                          ? Image.asset(
                                              AppIcons.doneAllIcon,
                                              width: 12.w,
                                              height: 8.h,
                                            )
                                          : const SizedBox(),
                                      AppServices.addWidth(4),
                                      Expanded(
                                        child: SizedBox(
                                          child: Text(
                                            message[index].message,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyles.caption.copyWith(
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  trailing: Text(
                                    message[index].time,
                                    style: AppStyles.caption
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            )),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
