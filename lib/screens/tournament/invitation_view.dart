import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/app_textField.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class TeamInvitationView extends StatefulWidget {
  const TeamInvitationView({super.key});

  @override
  State<TeamInvitationView> createState() => _TeamInvitationViewState();
}

class _TeamInvitationViewState extends State<TeamInvitationView> {
  List<int> invitedPerson = [];
  isInvited(int index) => invitedPerson.any((element) => element == index);

  sendInvite(int index) {
    if (invitedPerson.any((element) => element == index)) {
      invitedPerson.removeWhere((element) => element == index);
    } else {
      invitedPerson.add(index);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(invitedPerson.toString());
    return Scaffold(
      backgroundColor: Color(0xffdddddd),
      appBar: AppBar(
        backgroundColor: Color(0xffdddddd),
        foregroundColor: AppStyles.whiteColor,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text("View Team",
                  style:
                      AppStyles.bodyLarge.copyWith(color: AppStyles.neonColor)))
        ],
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
            color: AppStyles.whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
        child: Column(
          children: [
            AppTextField(
              icon: AppIcons.searchIcon,
              hint: "Search",
            ),
            AppServices.addHeight(30.h),
            Expanded(
                child: SizedBox(
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) => Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: SizedBox(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30.r,
                                backgroundImage:
                                    AssetImage(AppImages.profileImage),
                              ),
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text("Racheal Will",
                                    style: AppStyles.bodyMedium),
                              )),
                              TextButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(60.r))),
                                      backgroundColor: MaterialStateProperty.all(isInvited(i)
                                          ? AppStyles.bluePrimary
                                          : AppStyles.borderColor),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              horizontal: 18.w,
                                              vertical: 10.h))),
                                  onPressed: () => sendInvite(i),
                                  child: Text("Invite",
                                      style: AppStyles.bodyMedium.copyWith(
                                          color: isInvited(i)
                                              ? AppStyles.whiteColor
                                              : AppStyles.bluePrimary,
                                          fontWeight: FontWeight.w700)))
                            ],
                          ),
                        ),
                      )),
            ))
          ],
        ),
      )),
    );
  }
}
