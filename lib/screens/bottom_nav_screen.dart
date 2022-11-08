import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:q_arena_trainer/classes/basic_models.dart';
import 'package:q_arena_trainer/components/my_nav_bar.dart';
import 'package:q_arena_trainer/services/icons.dart';

class BottomNavScreenView extends StatefulWidget {
  const BottomNavScreenView({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
          items: _items,
          ontap: (value) => setState(() => activeIndex = value),
          activeIndex: activeIndex),
    );
  }
}
