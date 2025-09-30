import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:havenly_admin/utils/app_images.dart';
import 'package:havenly_admin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/insight_container.dart';
import '../../custom_widgets/pages_layout.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import 'controller/dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      headerTitle: "Subscription & Payments",
      children: [
        32.toHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 28.w,
          children: [
            insightContainer(kPrimaryColor, "Total Earnings", "\$12,340", kDollarIcon),
            insightContainer(kPurpleColor, "Active Subscriptions", "20", kCrownIcon),
            insightContainer(kGreenColor, "This Month’s Revenue", "\$3,210", kCrownIcon),
            insightContainer(kRedColor, "Expired Subscriptions", "12", kShieldIcon),
          ],
        ),
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
                        "Plan",
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
                        "Start Date",
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
                        "Expiry Date",
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
                        "Amount (USD)",
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
                        "Status",
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
                      user['name']!,
                      user['plan']!,
                      user['startDate']!,
                      user['expDate']!,
                      user['amount']!,
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
      String name,
      String plan,
      String startDate,
      String expDate,
      String amount,
      String status,
      context,
      ) {
    return DataRow(
      cells: [
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
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              plan,
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
            startDate,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        DataCell(
          Text(
            expDate,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        DataCell(
          Text(
            amount,
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
                  color: status == "Expired" ?
                  kPurpleColor.withValues(alpha: 0.2) :
                  status == "Canceled" ?
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
                    color: status == "Expired" ?
                    kPurpleColor :
                    status == "Canceled" ?
                    kRedColor : kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
