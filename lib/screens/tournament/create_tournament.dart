import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/flexible_button.dart';
import 'package:q_arena_user_application/configs/app_config.dart';
import 'package:q_arena_user_application/screens/tournament/invite_team_sceeen.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/base_components.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class CreateTournamentView extends StatefulWidget {
  const CreateTournamentView({super.key});

  @override
  State<CreateTournamentView> createState() => _CreateTournamentViewState();
}

class _CreateTournamentViewState extends State<CreateTournamentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => share("Q_Arena League", "https://Google.com"),
              icon: Image.asset(AppIcons.shareIcon))
        ],
      ),
      body: Container(
        height: AppServices.getScreenHeight(context),
        width: AppServices.getScreenWidth(context),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 350.h,
                width: AppServices.getScreenWidth(context),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.groundImage),
                        fit: BoxFit.cover),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15.r))),
              ),
            ),
            Container(
              height: AppServices.getScreenHeight(context),
              width: AppServices.getScreenWidth(context),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppServices.addHeight(300.h),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 18.h),
                        child: Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("WEEKEND LEAGUE",
                                      style: AppStyles.bodyLarge.copyWith(
                                          fontWeight: FontWeight.w700)),
                                  AppServices.addHeight(8.h),
                                  Text("10:30 PM, 5 Jul, Al Bayt Stadium",
                                      style: AppStyles.captionLarge.copyWith(
                                          color: AppStyles.textColorBlack50)),
                                  AppServices.addHeight(12.h),
                                  Text("QAR  100 per person",
                                      style: AppStyles.bodyMedium.copyWith(
                                          color: AppStyles.redHighLightColor)),
                                ],
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                AppIcons.userGroupIcon,
                                height: 40.h,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    AppServices.addHeight(10.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.w)),
                        color: AppStyles.whiteColor,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Hosted By",
                              style: AppStyles.bodySmall
                                  .copyWith(fontWeight: FontWeight.w700)),
                          AppServices.addHeight(8.h),
                          ListTile(
                            contentPadding: EdgeInsets.only(right: 20.w),
                            leading: const CircleAvatar(
                              radius: 22,
                              backgroundImage:
                                  AssetImage(AppImages.profileImage),
                            ),
                            title: Text("Alex Captor",
                                style: AppStyles.bodyMedium
                                    .copyWith(fontWeight: FontWeight.w700)),
                            subtitle: Text("Posted on 01 June, 2022",
                                style: AppStyles.caption.copyWith(
                                    color: AppStyles.textColorBlack50)),
                            trailing: InkWell(
                                onTap: () {},
                                child: Image.asset(AppIcons.chattingIcon,
                                    height: 36.h)),
                          ),
                          AppServices.addHeight(8.h),
                          Text("About",
                              style: AppStyles.bodySmall
                                  .copyWith(fontWeight: FontWeight.w700)),
                          AppServices.addHeight(5.h),
                          Text(
                              "The Weekend League, is the weekly match. All level of players are welcome to join and compete with each other.",
                              style: AppStyles.bodySmall.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppStyles.textColorBlack50)),
                          AppServices.addHeight(12.h),
                          Row(
                            children: [
                              Expanded(
                                  child: SizedBox(
                                      child: Center(
                                          child: Text("Group A",
                                              style: AppStyles.bodyMedium
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700))))),
                              Expanded(
                                  child: SizedBox(
                                      child: Center(
                                          child: Text("Group B",
                                              style: AppStyles.bodyMedium
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700))))),
                            ],
                          ),
                          AppServices.addHeight(15.h),
                          Row(
                            children: [
                              TeamMatesGridView(),
                              SizedBox(
                                  height: 175.h,
                                  child: VerticalDivider(
                                      thickness: 1.2,
                                      color: AppStyles.redHighLightColor)),
                              TeamMatesGridView(),
                            ],
                          ),
                          AppServices.addHeight(30.h),
                          Center(
                            child: FlexibleButton(
                                btnName: "Request Join", onPress: () {}),
                          ),
                          AppServices.addHeight(30.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TeamMatesGridView extends StatelessWidget {
  const TeamMatesGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
            child: Wrap(
      alignment: WrapAlignment.center,
      spacing: 15.w,
      runSpacing: 15.w,
      children: List.generate(
          5,
          (index) => InkWell(
                onTap: () => AppServices.pushTo(context, InviteTeamMatesView()),
                child: Container(
                  height: 45.w,
                  width: 45.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(AppImages.profileImage))),
                ),
              )),
    )));
  }
}
