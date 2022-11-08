import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:q_arena_trainer/services/stylesheet.dart';

class SetLocationView extends StatefulWidget {
  const SetLocationView({super.key});

  @override
  State<SetLocationView> createState() => _SetLocationViewState();
}

class _SetLocationViewState extends State<SetLocationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.darkBGColor,
        centerTitle: true,
        title: Text("Set Your Location", style: GetTextTheme.sf16_Bold),
      ),
      body: Center(
        child: Text("Location Map Here", style: GetTextTheme.sf22_Bold),
      ),
    );
  }
}
