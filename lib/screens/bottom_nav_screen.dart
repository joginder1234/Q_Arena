import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:q_arena_trainer/classes/basic_models.dart';
import 'package:q_arena_trainer/components/my_nav_bar.dart';
import 'package:q_arena_trainer/screens/chatting/chatting_view.dart';
import 'package:q_arena_trainer/screens/history/booking_history.dart';
import 'package:q_arena_trainer/screens/home/homepage.dart';
import 'package:q_arena_trainer/screens/profile/profile_view.dart';
import 'package:q_arena_trainer/screens/schedule/schedule_view.dart';
import 'package:q_arena_trainer/services/icons.dart';

class BottomNavScreenView extends StatefulWidget {
  int screenIndex;
  BottomNavScreenView({super.key, this.screenIndex = 0});

  @override
  State<BottomNavScreenView> createState() => _BottomNavScreenViewState();
}

class _BottomNavScreenViewState extends State<BottomNavScreenView> {
  int activeIndex = 0;
  final List<BottomNavItemsClass> _items = [
    BottomNavItemsClass(AppIcons.homeIcon),
    BottomNavItemsClass(AppIcons.calenderIcon),
    BottomNavItemsClass(AppIcons.usersIcon),
    BottomNavItemsClass(AppIcons.messageIcon),
    BottomNavItemsClass(AppIcons.profileIcon)
  ];
  final List<Widget> _screens = [
    const Homepage(),
    const MyScheduleView(),
    const BookingHistoryView(),
    const ChattingView(),
    const ProfileView()
  ];

  @override
  void initState() {
    super.initState();
    setState(() => activeIndex = widget.screenIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[activeIndex],
      bottomNavigationBar: MyBottomNavBar(
          items: _items,
          iconSize: 20,
          ontap: (value) => setState(() => activeIndex = value),
          activeIndex: activeIndex),
    );
  }
}
