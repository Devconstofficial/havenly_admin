import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final double borderRadius;
  final String title;
  final Color textColor;
  final Color color;
  final double width;
  final double height;
  final double textSize;
  final Function()? onTap;
  final bool showShadow;
  final Color? borderColor;
  final String? icon;
  final FontWeight fontWeight;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.textColor = kWhiteColor,
    this.color = kPrimaryColor,
    this.width = double.infinity,
    this.height = 56,
    this.borderRadius = 12,
    this.textSize = 18,
    this.showShadow = false,
    this.borderColor,
    this.icon,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor ?? kPrimaryColor,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? SvgPicture.asset(icon!, height: 24, width: 24)
                  : SizedBox.shrink(),
              icon != null ? SizedBox(width: 10) : SizedBox.shrink(),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppStyles.whiteTextStyle().copyWith(
                  fontSize: textSize,
                  color: textColor,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
