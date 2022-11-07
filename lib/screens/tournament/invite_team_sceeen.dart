import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/screens/tournament/invitation_view.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class InviteTeamMatesView extends StatefulWidget {
  const InviteTeamMatesView({super.key});

  @override
  State<InviteTeamMatesView> createState() => _InviteTeamMatesViewState();
}

class _InviteTeamMatesViewState extends State<InviteTeamMatesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bluePrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppStyles.whiteColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("Invite Team mates",
                style:
                    AppStyles.largeHeader.copyWith(color: AppStyles.neonColor)),
          ),
          AppServices.addHeight(7.h),
          Center(
            child: Text("Aspire Football Pitch",
                style:
                    AppStyles.bodyMedium.copyWith(color: AppStyles.whiteColor)),
          ),
          AppServices.addHeight(7.h),
          Center(
            child: Text("12 June 2022- 06:45 pm to 8:00 pm",
                style:
                    AppStyles.bodyMedium.copyWith(color: AppStyles.whiteColor)),
          ),
          AppServices.addHeight(65.h),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                child: Image.asset(AppImages.inviteMarkers),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                          (index) => InkWell(
                                onTap: () => AppServices.pushTo(
                                    context, TeamInvitationView()),
                                child: Image.asset(
                                  AppIcons.addIcon,
                                  height: 45.h,
                                ),
                              )),
                    ),
                    AppServices.addHeight(50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (i) => Container(
                                transform: Matrix4.translationValues(
                                    0, i == 1 ? -20 : 0, 0),
                                child: InkWell(
                                  onTap: () => AppServices.pushTo(
                                      context, TeamInvitationView()),
                                  child: Image.asset(
                                    AppIcons.addIcon,
                                    height: 45.h,
                                  ),
                                ),
                              )),
                    ),
                    AppServices.addHeight(25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                          (index) => InkWell(
                                onTap: () => AppServices.pushTo(
                                    context, TeamInvitationView()),
                                child: Image.asset(
                                  AppIcons.addIcon,
                                  height: 45.h,
                                ),
                              )),
                    ),
                    AppServices.addHeight(30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (i) => Container(
                                transform: Matrix4.translationValues(
                                    0, i == 1 ? -20 : 0, 0),
                                child: InkWell(
                                  onTap: () => AppServices.pushTo(
                                      context, TeamInvitationView()),
                                  child: Image.asset(
                                    AppIcons.addIcon,
                                    height: 45.h,
                                  ),
                                ),
                              )),
                    ),
                    AppServices.addHeight(45.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                          (index) => InkWell(
                                onTap: () => AppServices.pushTo(
                                    context, TeamInvitationView()),
                                child: Image.asset(
                                  AppIcons.addIcon,
                                  height: 45.h,
                                ),
                              )),
                    ),
                    AppServices.addHeight(50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (i) => Container(
                                transform: Matrix4.translationValues(
                                    0, i == 1 ? -20 : 0, 0),
                                child: InkWell(
                                  onTap: () => AppServices.pushTo(
                                      context, TeamInvitationView()),
                                  child: Image.asset(
                                    AppIcons.addIcon,
                                    height: 45.h,
                                  ),
                                ),
                              )),
                    ),
                    AppServices.addHeight(50.h),
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
