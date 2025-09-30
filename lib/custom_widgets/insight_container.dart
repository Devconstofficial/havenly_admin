import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:havenly_admin/utils/sizedBox_extention.dart';

import '../utils/app_colors.dart';
import 'custom_text.dart';

Widget insightContainer(Color color, String title, String amount, String img) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
              color: kGreyColor2.withValues(alpha: 0.25),
              blurRadius: 5.3,
              spreadRadius: 0,
              offset: Offset(0, 1)
          ),
          BoxShadow(
              color: kBlackColor.withValues(alpha: 0.05),
              blurRadius: 12,
              spreadRadius: 0,
              offset: Offset(0, 6)
          ),
        ]
    ),
    child: Padding(
      padding: EdgeInsets.all(28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.2)
            ),
            child: Center(
              child: Image.asset(
                img,
                height: 24.h,
                width: 24.w,
                color: color,
              ),
            ),
          ),
          23.toWidth,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              CustomText(text: amount,fontWeight: FontWeight.w800,fontSize: 22.sp,color: kBlackTextColor1.withValues(alpha: 0.7),),
              CustomText(text: title,fontWeight: FontWeight.w400,fontSize: 14.sp,),
            ],
          ),
        ],
      ),
    ),
  );
}
