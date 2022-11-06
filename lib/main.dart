import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:q_arena_user_application/configs/app_config.dart';
import 'package:q_arena_user_application/providers/app_data_provider.dart';

import 'package:q_arena_user_application/screens/auth_screen/auth_tabBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppDataProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthTabBarView(),
        ),
      ),
      splitScreenMode: false,
      designSize: const Size(AppConfig.designWidth, AppConfig.designHeight),
    );
  }
}
