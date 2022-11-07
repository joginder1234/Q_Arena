import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_arena_user_application/components/expanded_btn.dart';
import 'package:q_arena_user_application/models/basic_models.dart';
import 'package:q_arena_user_application/screens/passes/play_pass.dart';
import 'package:q_arena_user_application/services/app_services.dart';
import 'package:q_arena_user_application/services/images.dart';
import 'package:q_arena_user_application/services/style_sheet.dart';

class PayAndGoView extends StatefulWidget {
  CreditCardClass cardDetails;
  PayAndGoView({super.key, required this.cardDetails});

  @override
  State<PayAndGoView> createState() => _PayAndGoViewState();
}

class _PayAndGoViewState extends State<PayAndGoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppStyles.whiteColor,
          foregroundColor: AppStyles.redHighLightColor,
          elevation: 0),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.cardDetails.cardNumber,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppStyles.whiteColor,
                      image: DecorationImage(
                          image: AssetImage("assets/card.jpg"),
                          fit: BoxFit.cover)),
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                        alignment: Alignment.topRight,
                        child: Image.asset(widget.cardDetails.cardType,
                            scale: AppServices.scaleFactorText(context),
                            width: 100.w),
                      )),
                      Expanded(
                          child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppServices.addHeight(15.h),
                            Text(widget.cardDetails.cardHolderName,
                                textScaleFactor:
                                    AppServices.scaleFactorText(context),
                                style: AppStyles.bodyLarge
                                    .copyWith(color: AppStyles.whiteColor)),
                            AppServices.addHeight(8.h),
                            Text(
                                "${widget.cardDetails.cardNumber.substring(0, 4)} XXXX XXXX ${widget.cardDetails.cardNumber.substring(12, 16)}",
                                textScaleFactor:
                                    AppServices.scaleFactorText(context),
                                style: AppStyles.heading1
                                    .copyWith(color: AppStyles.whiteColor)),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            getCardDetailSection("Card Holder Name",
                widget.cardDetails.cardHolderName.toUpperCase()),
            getCardDetailSection("Card Number",
                "${widget.cardDetails.cardNumber.substring(0, 4)} - ${widget.cardDetails.cardNumber.substring(4, 8)} - ${widget.cardDetails.cardNumber.substring(8, 12)} - ${widget.cardDetails.cardNumber.substring(12, 16)}"),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  child: getCardDetailSection(
                      "Expiry (MM/YY)", widget.cardDetails.expDate),
                )),
                Expanded(
                    child: SizedBox(
                  child: getCardDetailSection("CVC", "XXX"),
                )),
              ],
            ),
            AppServices.addHeight(45.h),
            TextButton(
                onPressed: () {},
                child: Text("Delete Card",
                    style: AppStyles.bodyMedium.copyWith(
                        color: AppStyles.redHighLightColor,
                        fontWeight: FontWeight.w700))),
            AppServices.addHeight(85.h),
            Row(
              children: [
                ExpandedButtonView(
                    btnName: "Pay Now",
                    radius: 60,
                    bgColor: AppStyles.redHighLightColor,
                    onPress: () => AppServices.pushTo(context, PlayPassView()))
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget getCardDetailSection(String title, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppServices.addHeight(20.h),
        Text(title,
            style: AppStyles.bodyMedium
                .copyWith(color: AppStyles.redHighLightColor)),
        AppServices.addHeight(12.h),
        Text(value,
            textScaleFactor: AppServices.scaleFactorText(context),
            style: AppStyles.bodyMedium.copyWith(
                color: AppStyles.textColorBlack100,
                fontWeight: FontWeight.w700)),
      ],
    );
  }
}
