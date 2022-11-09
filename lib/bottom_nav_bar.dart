import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:q_arena_user_application/components/my_bottom_nav_bar.dart';
import 'package:q_arena_user_application/configs/app_config.dart';
import 'package:q_arena_user_application/dashboard.dart';
import 'package:q_arena_user_application/screens/NearbyCourts/nearby_courts.dart';
import 'package:q_arena_user_application/screens/play_mates/playmate_main.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  PersistentTabController? _controller;

  List<String> bottomBarIcons = [
    AppIcons.homeIcon,
    AppIcons.ballIcon,
    AppConfig.appLogo,
    AppIcons.personIcon,
    AppIcons.profileIcon
  ];

  int activeScreenIndex = 0;

  List<Widget> _screens = [
    DashboardView(),
    DashboardView(),
    NearbyCourts(
      type: "court",
    ),
    NearbyCourts(type: "trainers"),
    DashboardView(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[activeScreenIndex],
      bottomNavigationBar: MyBottomNavBar(
        items: bottomBarIcons
            .map((e) => MyBottomBarItems(e, 28.h, AppStyles.redHighLightColor,
                AppStyles.textColorBlack50))
            .toList(),
        activeIndex: activeScreenIndex,
        ontap: (value) => setState(() => activeScreenIndex = value),
      ),
    );
  }
}
