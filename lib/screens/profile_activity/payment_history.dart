import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:q_arena_user_application/components/saved_cards_listview.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class PaymentHistoryView extends StatefulWidget {
  const PaymentHistoryView({super.key});

  @override
  State<PaymentHistoryView> createState() => _PaymentHistoryViewState();
}

class _PaymentHistoryViewState extends State<PaymentHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.whiteColor,
        foregroundColor: AppStyles.textColorBlack100,
        elevation: 0,
        centerTitle: true,
        title: Text("SAVED CARDS", style: AppStyles.heading2),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SavedCardsList(),
          AppServices.addHeight(15.h),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("PAYMENT HISTORY", style: AppStyles.heading2),
                  Text(DateFormat("MMM d y").format(DateTime.now()),
                      style: AppStyles.bodyMedium),
                  AppServices.addHeight(10.h),
                  Expanded(
                      child: SizedBox(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (ctx, i) {
                          return ListTile(
                            leading: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage(AppImages.profileImage)),
                            title: Text("Jhone Doe",
                                style: AppStyles.captionLarge
                                    .copyWith(fontWeight: FontWeight.w700)),
                            subtitle: Text("06:30 PM - 08:00 PM",
                                style: AppStyles.caption
                                    .copyWith(fontWeight: FontWeight.w400)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("QAR 50",
                                        style: AppStyles.captionLarge.copyWith(
                                            fontWeight: FontWeight.w400)),
                                    Text("IN PROGRESS",
                                        style: AppStyles.caption.copyWith(
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
