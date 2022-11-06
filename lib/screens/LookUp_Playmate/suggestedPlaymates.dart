import 'package:flutter/material.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class SuggestedPlaymatesView extends StatefulWidget {
  const SuggestedPlaymatesView({Key? key}) : super(key: key);

  @override
  State<SuggestedPlaymatesView> createState() => _SuggestedPlaymatesViewState();
}

class _SuggestedPlaymatesViewState extends State<SuggestedPlaymatesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppStyles.redHighLightColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Text(
            "Interested in Padel",
            style: AppStyles.heading2.copyWith(fontWeight: FontWeight.w900),
          ),
          Text(
            "200 other users",
            style: AppStyles.captionLarge.copyWith(),
          )
        ],
      )),
    );
  }
}
