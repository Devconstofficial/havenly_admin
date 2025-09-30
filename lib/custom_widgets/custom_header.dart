import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:havenly_admin/custom_widgets/custom_textfield.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';

 Widget customHeader(String title){
  return Row(
    children: [
      Text(
        title,
        style: AppStyles.blackTextStyle()
            .copyWith(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      Spacer(),
      SizedBox(
        width: 200,
        height: 35,
        child: CustomTextField(hintText: "Search",prefix: Icon(Icons.search,size: 24,color: kBlackColor.withValues(alpha: 0.2)),fillColor: kBlackTextColor1.withValues(alpha: 0.05),isFilled: true,contentPadding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),),
      )
    ],
  );
}