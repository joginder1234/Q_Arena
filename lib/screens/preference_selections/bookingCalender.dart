import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/models/basic_models.dart';
import 'package:q_arena_user_application/screens/LookUp_Playmate/messages.dart';
import 'package:q_arena_user_application/screens/Trainer_Section/trainer_details.dart';
import 'package:q_arena_user_application/screens/payment/payment_desc.dart';
import 'package:q_arena_user_application/screens/tournament/invite_team_sceeen.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/icons.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class BookingCalenderView extends StatefulWidget {
  String type;
  BookingCalenderView({Key? key, required this.type}) : super(key: key);

  @override
  State<BookingCalenderView> createState() => _BookingCalenderViewState();
}

class _BookingCalenderViewState extends State<BookingCalenderView> {
  Color getDefaultColor() {
    if (widget.type == "court") {
      return AppStyles.purpleColor;
    } else {
      return AppStyles.redHighLightColor;
    }
  }

  getnavigation() {
    if (widget.type == "court") {
      return {
        Navigator.pop(context),
        AppServices.pushTo(context, InviteTeamMatesView())
      };
    } else {
      return {
        Navigator.pop(context),
        AppServices.pushTo(context, PaymentDescriptionView())
      };
    }
  }

  final DateTime _date = DateTime.now();
  List<TimingsClass> timings = [
    TimingsClass("6:30 pm", false, false),
    TimingsClass("6:45 pm", true, true),
    TimingsClass("7:00 pm", true, false),
    TimingsClass("7:45 pm", true, false),
    TimingsClass("8:00 pm", true, false),
    TimingsClass("8:30 pm", false, false),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Choose The Best Time",
                style: AppStyles.heading1.copyWith(fontWeight: FontWeight.w400),
              ),
              IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    AppServices.pushTo(context, MessagesView());
                  },
                  icon: Image.asset(
                    AppIcons.calenderIcon,
                    width: 20.w,
                    height: 22.h,
                  ))
            ],
          ),
          AppServices.addHeight(19),
          HorizontalCalendar(
              date: _date,
              selectedColor: getDefaultColor(),
              backgroundColor: AppStyles.whiteColor,
              onDateSelected: (date) {
                print(date);
                // setState(() => _date = date);
              }),
          AppServices.addHeight(27),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(12.r),
                color: getDefaultColor()),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "A Member of Aspire ?",
                          style: AppStyles.bodyLarge
                              .copyWith(color: AppStyles.whiteColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Image.asset(
                            AppIcons.infoIcon,
                            width: 18.w,
                            height: 20.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Get 30% Off Today and much More !",
                    style: AppStyles.bodyLarge
                        .copyWith(color: AppStyles.whiteColor),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: Column(
                    children: List.generate(
                        timings.length,
                        (index) => GestureDetector(
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        actions: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w,
                                                vertical: 30.h),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    ExpandedButtonView(
                                                        bgColor: AppStyles
                                                            .redHighLightColor,
                                                        btnName: widget.type ==
                                                                "court"
                                                            ? "Invite Team Mates"
                                                            : "Pay Now",
                                                        onPress: () =>
                                                            getnavigation()),
                                                  ],
                                                ),
                                                AppServices.addHeight(15.h),
                                                Row(
                                                  children: [
                                                    ExpandedButtonView(
                                                        btnName: "Cancel",
                                                        onPress: () {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                              child: Card(
                                child: ListTile(
                                  title: Text(
                                    timings[index].time,
                                    style: AppStyles.heading2
                                        .copyWith(fontWeight: FontWeight.w900),
                                  ),
                                  subtitle: timings[index].isAvailable == true
                                      ? Text(
                                          "Available",
                                          style: AppStyles.bodyLarge.copyWith(
                                              fontWeight: FontWeight.w500),
                                        )
                                      : Text("Not Available",
                                          style: AppStyles.bodyLarge.copyWith(
                                              fontWeight: FontWeight.w500)),
                                  trailing: timings[index].isSelected == true
                                      ? Text("Selected",
                                          style: AppStyles.bodyLarge.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: getDefaultColor()))
                                      : null,
                                ),
                              ),
                            )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
