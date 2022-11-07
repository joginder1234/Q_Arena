import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/screens/NearbyCourts/vanue_details.dart';
import 'package:q_arena_user_application/screens/preference_selections/bookingCalender.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../services/images.dart';

class ListViewScreen extends StatefulWidget {
  String type;
  ListViewScreen({super.key, required this.type});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  getRoute() {
    if (widget.type == "court") {
      return AppServices.pushTo(context, VanueDetailsView());
    } else {
      return showModalBottomSheet(
          isScrollControlled: true,
          constraints: BoxConstraints(
              maxHeight: AppServices.getScreenHeight(context) * 0.7),
          context: context,
          builder: (BuildContext context) =>
              BookingCalenderView(type: widget.type));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 26.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "5 Places Nearby",
            style: AppStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700),
          ),
          AppServices.addHeight(8),
          Column(
              children: List.generate(
                  5,
                  (index) => Column(
                        children: [
                          AppServices.addHeight(12),
                          Card(
                              elevation: 4,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 8.h),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 28.r,
                                      backgroundImage: const AssetImage(
                                          AppImages.profileImage),
                                    ),
                                    AppServices.addWidth(10.w),
                                    Expanded(
                                        child: SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Aspire Zone",
                                              style: AppStyles.bodyMedium),
                                          Text("Al Waab Street،23833، Doha",
                                              style: AppStyles.captionLarge),
                                          RatingBarIndicator(
                                            rating: 3.5,
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star,
                                              color:
                                                  AppStyles.redHighLightColor,
                                            ),
                                            itemCount: 5,
                                            itemSize: 15.0,
                                            direction: Axis.horizontal,
                                          )
                                        ],
                                      ),
                                    )),
                                    InkWell(
                                      onTap: () => getRoute(),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 10),
                                        decoration: BoxDecoration(
                                            color: AppStyles.redHighLightColor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          "Book",
                                          style: AppStyles.captionLarge
                                              .copyWith(
                                                  color: AppStyles.whiteColor,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )

                              // ListTile(
                              //     leading: CircleAvatar(
                              //       radius: 30.r,
                              //       backgroundImage:
                              //           const AssetImage(AppImages.profileImage),
                              //     ),
                              //     title: Text(
                              //       "Aspire Zone",
                              //       style: AppStyles.bodyMedium
                              //           .copyWith(fontWeight: FontWeight.w500),
                              //     ),
                              //     subtitle: Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       // ignore: prefer_const_literals_to_create_immutables
                              //       children: [
                              //         Text(
                              //           "AI Waab Street, 23833, Doha",
                              //           style: AppStyles.captionLarge,
                              //         ),
                              //         Row(
                              //           children: List.generate(
                              //             5,
                              //             (index) => Icon(
                              //               Icons.star,
                              //               color: AppStyles.redHighLightColor,
                              //               size: 15,
                              //             ),
                              //           ),
                              //         )
                              //       ],
                              //     ),
                              //     trailing: Container(
                              //       padding: EdgeInsets.symmetric(
                              //           horizontal: 15, vertical: 10),
                              //       decoration: BoxDecoration(
                              //           color: AppStyles.redHighLightColor,
                              //           borderRadius: BorderRadius.circular(15)),
                              //       child: Text(
                              //         "Book",
                              //         style: AppStyles.caption.copyWith(
                              //             color: AppStyles.whiteColor,
                              //             fontWeight: FontWeight.w400),
                              //       ),
                              //     )),
                              ),
                        ],
                      )))
        ],
      ),
    );
  }
}
