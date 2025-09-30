import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomDropdown2 extends StatelessWidget {
  final RxString selected;
  final List<String> items;
  final String hint;
  final double height;

  const CustomDropdown2({
    super.key,
    required this.selected,
    required this.items,
    required this.hint,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: Obx(() {
        final value = selected.value.isEmpty ? null : selected.value;
        return DropdownButtonFormField2<String>(
          value: value,
          isExpanded: true,
          iconStyleData: IconStyleData(
            icon: Icon(Icons.arrow_forward_ios_outlined,size: 15,color: kBlackTextColor1,)
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 230,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          hint: Text(
            hint,
            style: AppStyles.blackTextStyle().copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp,color: kBlackTextColor1),
          ),
          style: AppStyles.blackTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w400,color: kBlackTextColor1),
          decoration: InputDecoration(
            hintStyle: AppStyles.blackTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w400,color: kBlackTextColor1),
            contentPadding: EdgeInsets.symmetric(vertical: 17.h,horizontal: 14.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: kBgColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: kBgColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: kBgColor),
            ),
          ),
          items: items
              .map((e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e, style: AppStyles.blackTextStyle().copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
          ))
              .toList(),
          onChanged: (v) => selected.value = v ?? '',
        );
      }),
    );
  }
}
