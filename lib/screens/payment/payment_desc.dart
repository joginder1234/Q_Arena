import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/screens/payment/pay_and_go.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/base_components.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class PaymentDescriptionView extends StatefulWidget {
  const PaymentDescriptionView({super.key});

  @override
  State<PaymentDescriptionView> createState() => _PaymentDescriptionViewState();
}

class _PaymentDescriptionViewState extends State<PaymentDescriptionView> {
  int selectedCard = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.whiteColor,
        foregroundColor: AppStyles.redHighLightColor,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            saved_card_view(context),
            AppServices.addHeight(70.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: AppStyles.textColorBlack100,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 74.w,
                        height: 74.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppImages.groundImage),
                                fit: BoxFit.cover)),
                      ),
                      AppServices.addWidth(10.w),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Aspire Football Pitch",
                              textScaleFactor:
                                  AppServices.scaleFactorText(context),
                              style: AppStyles.heading2
                                  .copyWith(color: AppStyles.whiteColor)),
                          AppServices.addHeight(10.h),
                          Text("Al Waab Street، 23833، Doha",
                              textScaleFactor:
                                  AppServices.scaleFactorText(context),
                              style: AppStyles.captionLarge
                                  .copyWith(color: AppStyles.whiteColor)),
                        ],
                      )
                    ],
                  ),
                  AppServices.addHeight(15.h),
                  Text("Date: 12 June 2022",
                      style: AppStyles.captionLarge
                          .copyWith(color: AppStyles.whiteColor)),
                  AppServices.addHeight(7.h),
                  Text("Time: 6:45 pm - 08:00 pm",
                      style: AppStyles.captionLarge
                          .copyWith(color: AppStyles.whiteColor)),
                  AppServices.addHeight(7.h),
                  Text("Total Players : 11 players",
                      style: AppStyles.captionLarge
                          .copyWith(color: AppStyles.whiteColor)),
                  AppServices.addHeight(7.h),
                  Text("Cost : QAR 150 Each",
                      style: AppStyles.captionLarge
                          .copyWith(color: AppStyles.whiteColor)),
                  Divider(color: AppStyles.whiteColor, thickness: 1.2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total:",
                          style: AppStyles.captionLarge
                              .copyWith(color: AppStyles.whiteColor)),
                      Text("QAR 1,650",
                          style: AppStyles.captionLarge
                              .copyWith(color: AppStyles.whiteColor)),
                    ],
                  )
                ],
              ),
            ),
            AppServices.addHeight(70.h),
            Row(
              children: [
                ExpandedButtonView(
                    btnName: "Proceed to payment",
                    radius: 60.r,
                    bgColor: AppStyles.redHighLightColor,
                    onPress: () => AppServices.pushTo(context,
                        PayAndGoView(cardDetails: cards[selectedCard]))),
              ],
            )
          ],
        ),
      )),
    );
  }

  SizedBox saved_card_view(BuildContext context) {
    return SizedBox(
      height: 115,
      width: AppServices.getScreenWidth(context),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: List.generate(cards.length, (i) {
              final card = cards[i];
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => selectedCard = i),
                      child: Hero(
                        tag: card.cardNumber,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.w),
                          width: 190.w,
                          height: 160.h,
                          decoration: BoxDecoration(
                              color: AppStyles.redHighLightColor,
                              borderRadius: BorderRadius.circular(15.r),
                              image: DecorationImage(
                                  image: AssetImage("assets/card.jpg"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              Expanded(
                                  child: SizedBox(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: SizedBox(
                                      child: Text(
                                        card.cardHolderName,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppStyles.bodyMedium.copyWith(
                                            color: AppStyles.whiteColor),
                                      ),
                                    )),
                                    AppServices.addWidth(7.w),
                                    Image.asset(card.cardType,
                                        scale: AppServices.scaleFactorText(
                                            context),
                                        width: 50),
                                  ],
                                ),
                              )),
                              Expanded(
                                  child: SizedBox(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppServices.addHeight(5.h),
                                    Text(
                                      "${card.cardNumber.substring(0, 4)} XXXX XXXX ${card.cardNumber.substring(12, 16)}",
                                      textScaleFactor:
                                          AppServices.scaleFactorText(context),
                                      style: AppStyles.bodyMedium.copyWith(
                                          color: AppStyles.whiteColor),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30.w),
                                      child: Row(
                                        children: [
                                          Text("EXPIRES\nEND",
                                              textAlign: TextAlign.right,
                                              textScaleFactor:
                                                  AppServices.scaleFactorText(
                                                      context),
                                              style: AppStyles.caption.copyWith(
                                                  color: AppStyles.whiteColor,
                                                  fontSize: 5)),
                                          AppServices.addWidth(10.w),
                                          Text(card.expDate,
                                              textScaleFactor:
                                                  AppServices.scaleFactorText(
                                                      context),
                                              style: AppStyles.bodySmall
                                                  .copyWith(
                                                      color:
                                                          AppStyles.whiteColor))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    selectedCard == i
                        ? Positioned(
                            right: 10,
                            top: 5,
                            child: Icon(Icons.check_circle,
                                color: AppStyles.whiteColor, size: 20),
                          )
                        : SizedBox()
                  ],
                ),
              );
            }),
          )),
    );
  }
}
