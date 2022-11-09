import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:q_arena_user_application/providers/app_data_provider.dart';
import 'package:q_arena_user_application/services/base_components.dart';

import '../services/app_services.dart';
import '../services/style_sheet.dart';

class SavedCardsList extends StatefulWidget {
  const SavedCardsList({super.key});

  @override
  State<SavedCardsList> createState() => _SavedCardsListState();
}

class _SavedCardsListState extends State<SavedCardsList> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDataProvider>(context);
    return SizedBox(
      height: 150.h,
      width: AppServices.getScreenWidth(context),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              AppServices.addWidth(10.w),
              ...List.generate(cards.length, (i) {
                final card = cards[i];
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () => db.selectCard(i),
                        child: Hero(
                          tag: card.cardNumber,
                          child: AnimatedScale(
                            scale: AppServices.scaleFactorText(context),
                            duration: Duration(milliseconds: 200),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 15.w),
                              width: 230.h,
                              height: 150.h,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: SizedBox(
                                          child: Text(
                                            card.cardHolderName,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyles.bodyMedium
                                                .copyWith(
                                                    color:
                                                        AppStyles.whiteColor),
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
                                              AppServices.scaleFactorText(
                                                  context),
                                          style: AppStyles.bodyMedium.copyWith(
                                              color: AppStyles.whiteColor),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 30.w),
                                          child: Row(
                                            children: [
                                              Text("EXPIRES\nEND",
                                                  textAlign: TextAlign.right,
                                                  textScaleFactor: AppServices
                                                      .scaleFactorText(context),
                                                  style: AppStyles.caption
                                                      .copyWith(
                                                          color: AppStyles
                                                              .whiteColor,
                                                          fontSize: 5)),
                                              AppServices.addWidth(10.w),
                                              Text(card.expDate,
                                                  textScaleFactor: AppServices
                                                      .scaleFactorText(context),
                                                  style: AppStyles.bodySmall
                                                      .copyWith(
                                                          color: AppStyles
                                                              .whiteColor))
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
                      ),
                      db.getSelectedCard == i
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
              })
            ],
          )),
    );
  }
}
