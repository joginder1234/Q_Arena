import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/app_textField.dart';
import 'package:q_arena_user_application/components/custome_tab_switch.dart';
import 'package:q_arena_user_application/screens/NearbyCourts/listView.dart';
import 'package:q_arena_user_application/screens/NearbyCourts/mapView.dart';
import 'package:q_arena_user_application/screens/profile_activity/profile_main.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';

import '../../services/images.dart';

class NearbyCourts extends StatefulWidget {
  String type;
  NearbyCourts({super.key, required this.type});

  @override
  State<NearbyCourts> createState() => _NearbyCourtsState();
}

class _NearbyCourtsState extends State<NearbyCourts> {
  int _activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                AppServices.pushTo(context, const MainProfileView());
              },
              child: CircleAvatar(
                radius: 20.r,
                backgroundImage: const AssetImage(AppImages.profileImage),
              ),
            ),
            AppServices.addHeight(4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: AppTextField(
                hint: "Look up nearby sports venue",
                icon: AppIcons.searchIcon,
              ),
            ),
            AppServices.addHeight(15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: CustomTabSwitch(
                  values: const [
                    Text("Map"),
                    Text("List"),
                  ],
                  activeIndex: _activeIndex,
                  onValueChange: (v) {
                    setState(() => _activeIndex = v);
                  }),
            ),
            Expanded(
                child: SizedBox(
              child: _activeIndex == 0
                  ? const MapView()
                  : ListViewScreen(type: widget.type),
            ))
          ],
        ),
      )),
    );
  }
}
