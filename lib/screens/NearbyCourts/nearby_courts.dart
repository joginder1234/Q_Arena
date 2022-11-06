import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/app_textField.dart';
import 'package:q_arena_user_application/components/custome_tab_switch.dart';
import 'package:q_arena_user_application/screens/NearbyCourts/listView.dart';
import 'package:q_arena_user_application/screens/NearbyCourts/mapView.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';

import '../../services/images.dart';

class NearbyCourts extends StatefulWidget {
  const NearbyCourts({super.key});

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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage: const AssetImage(AppImages.profileImage),
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
            _activeIndex == 0 ? const MapView() : const ListViewScreen()
          ],
        ),
      )),
    );
  }
}
