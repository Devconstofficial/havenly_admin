import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:havenly_admin/utils/sizedBox_extention.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomDialog extends StatelessWidget {
  final Widget content;
  final double? width;
  double horPadding;
  bool showTitle;
  String title;

  CustomDialog({
    super.key,
    required this.content,
    this.width,
    this.showTitle = false,
    this.horPadding = 28,
    this.title = ''
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: SizedBox(
        width: width ?? 466,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 37,horizontal: horPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    Text(title,style: AppStyles.blackTextStyle().copyWith(fontSize: 20,fontWeight: FontWeight.w600),),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kBlackTextColor1.withValues(alpha: 0.1),
                          ),
                          child: Center(child: Icon(Icons.close,size: 15,)),
                        ),
                      ),
                    ),
                  ],
                ),
                24.toHeight,
                content,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
