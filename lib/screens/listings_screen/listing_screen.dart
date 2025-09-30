import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:havenly_admin/custom_widgets/custom_button.dart';
import 'package:havenly_admin/custom_widgets/custom_dialog.dart';
import 'package:havenly_admin/custom_widgets/custom_dropdown.dart';
import 'package:havenly_admin/custom_widgets/custom_text.dart';
import 'package:havenly_admin/custom_widgets/custom_textfield.dart';
import 'package:havenly_admin/utils/app_images.dart';
import 'package:havenly_admin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/pages_layout.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import 'controller/listing_controller.dart';

class ListingsScreen extends GetView<ListingController> {
  const ListingsScreen({super.key});

  updateDialog(){
    return CustomDialog(
      title: "Update Status",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Listing Status",fontSize: 14,fontWeight: FontWeight.w400,),
            11.toHeight,
            CustomDropdown2(selected: controller.selectedValue, items: ["Active", "Paused"], hint: "Active"),
            24.toHeight,
            Center(child: CustomButton(title: "Save", onTap: (){},width: 93.w,height: 40.h,textSize: 14,fontWeight: FontWeight.w400,))
          ],
        )
    );
  }

  addListing(){
    return CustomDialog(
      title: "Add Listing",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Business Name",fontSize: 14,fontWeight: FontWeight.w400,),
            11.toHeight,
            CustomTextField(hintText: "Enter your business name"),
            16.toHeight,
            CustomText(text: "Category",fontSize: 14,fontWeight: FontWeight.w400,),
            11.toHeight,
            CustomDropdown2(selected: controller.selectedValue1, items: ["Category 1", "Category 2"], hint: "Select a category"),
            16.toHeight,
            CustomText(text: "Select Listing Type",fontSize: 14,fontWeight: FontWeight.w400,),
            11.toHeight,
            CustomDropdown2(selected: controller.selectedValue2, items: ["Listing 1", "Listing 2"], hint: "Select listing type"),
            16.toHeight,
            Row(
              spacing: 24.w,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Working Hours",fontSize: 14,fontWeight: FontWeight.w400,),
                      11.toHeight,
                      CustomTextField(hintText: "Working hours"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Pricing",fontSize: 14,fontWeight: FontWeight.w400,),
                      11.toHeight,
                      CustomTextField(hintText: "Pricing"),
                    ],
                  ),
                ),
              ],
            ),
            16.toHeight,
            CustomText(text: "Business Name",fontSize: 14,fontWeight: FontWeight.w400,),
            11.toHeight,
            CustomTextField(hintText: "Enter your business name",maxLines: 2,),

            16.toHeight,
            CustomText(text: "What's Included",fontSize: 14,fontWeight: FontWeight.w400,),
            11.toHeight,
            CustomTextField(hintText: "Enter your business name"),

            16.toHeight,
            CustomText(text: "Address",fontSize: 14,fontWeight: FontWeight.w400,),
            11.toHeight,
            CustomTextField(hintText: "Business address"),

            24.toHeight,
            Center(child: CustomButton(title: "Create Listing", onTap: (){
              Get.back();
            }))
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      headerTitle: "Listings Management",
      children: [
        32.toHeight,
        Container(
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: kWhiteColor,
              border: Border.all(
                  color: kGreyColor5,
                  width: 0.3
              )
          ),
          child: Obx(() => Stack(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(14)
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: DataTable(
                  columnSpacing: 0,
                  headingRowHeight: 50,
                  dataRowMinHeight: 90,
                  dataRowMaxHeight: 90,
                  dividerThickness: 0.4,
                  columns: [
                    DataColumn(
                      label: Text(
                        "Listing",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppStyles.whiteTextStyle()
                            .copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Business Name",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppStyles.whiteTextStyle()
                            .copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Category",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppStyles.whiteTextStyle()
                            .copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Location",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppStyles.whiteTextStyle()
                            .copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Status",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppStyles.whiteTextStyle()
                            .copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    DataColumn(
                      headingRowAlignment: MainAxisAlignment.center,
                      label: Text(
                        "Actions",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppStyles.whiteTextStyle()
                            .copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),

                  ],
                  rows:
                  controller.pagedUsers
                      .map(
                        (user) => _buildDataRow(
                          user['img']!,

                      user['name']!,
                      user['category']!,
                      user['loc']!,
                      user['status']!,
                      context,
                    ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),),
        ),
        32.toHeight,
        Obx(() => CustomPagination(
          currentPage: controller.currentPage1.value,
          visiblePages: controller.visiblePageNumbers,
          onPrevious: controller.goToPreviousPage,
          onNext: controller.goToNextPage,
          onPageSelected: controller.goToPage,
        )),
      ],
    );
  }

  DataRow _buildDataRow(
      String img,
      String name,
      String category,
      String loc,
      String status,
      context,
      ) {
    return DataRow(
      cells: [
        DataCell(
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              height: 62,
              width: 62,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(img,fit: BoxFit.cover,)),
            ),
          ),
        ),
        DataCell(
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: AppStyles.blackTextStyle().copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        DataCell(
          Text(
            category,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        DataCell(
          Text(
            loc,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        DataCell(
          Center(
            child: Container(
              height: 27,
              width: 95,
              decoration: BoxDecoration(
                  color: status == "Paused" ?
                  kRedColor.withValues(alpha: 0.2) : kPrimaryColor.withValues(alpha: 0.17),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                child: Text(
                  status,
                  textAlign: TextAlign.center,
                  style: AppStyles.blackTextStyle().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: status == "Paused" ?
                    kRedColor : kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.dialog(updateDialog());
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor
                    ),
                    child: Center(
                      child: Image.asset(
                        kEditIcon,
                        height: 15.h,
                        width: 15.w,
                      ),
                    ),
                  ),
                ),
              ),
              13.toWidth,
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.dialog(addListing());
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor
                    ),
                    child: Center(
                      child: Image.asset(
                        kEyeIcon,
                        height: 18.h,
                        width: 18.w,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
