import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:havenly_admin/custom_widgets/custom_text.dart';
import 'package:havenly_admin/screens/analytics_management/controller/analytics_controller.dart';
import 'package:havenly_admin/utils/app_images.dart';
import 'package:havenly_admin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/insight_container.dart';
import '../../custom_widgets/pages_layout.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class AnalyticsScreen extends GetView<AnalyticsController> {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      headerTitle: "Analytics Dashboard",
      children: [
        32.toHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 28.w,
          children: [
            insightContainer(kPrimaryColor, "Active Travelers", "12,340", kUserIcon),
            insightContainer(kPurpleColor, "Active Businesses", "20", kCalenderIcon),
            insightContainer(kGreenColor, "Searches This Month", "3,210", kSearchIcon),
            insightContainer(kRedColor, "Most Viewed Listing", "12", kStarsIcon),
          ],
        ),
        32.toHeight,
        Row(
          spacing: 28.w,
          children: [
            Expanded(
              child: Container(
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
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    spacing: 22.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Monthly Revenue Growth (Last 6 Months)",fontSize: 18,fontWeight: FontWeight.w600,),
                      SizedBox(
                        height: 200.h,
                        child: LineChart(
                          LineChartData(
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                                    return Text(months[value.toInt()], style: AppStyles.blackTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w400));
                                  },
                                  interval: 1,
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 40,
                                  interval: 10000,
                                  getTitlesWidget: (value, meta) {
                                    return Text('${(value / 1000).toStringAsFixed(0)}K', style: AppStyles.blackTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w400));
                                  },
                                ),
                              ),
                              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            ),
                            borderData: FlBorderData(show: false),
                            minX: 0,
                            maxX: 5,
                            minY: 0,
                            maxY: 30000,
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 12000),
                                  FlSpot(1, 8000),
                                  FlSpot(2, 15000),
                                  FlSpot(3, 27000),
                                  FlSpot(4, 23000),
                                  FlSpot(5, 26000),
                                ],
                                isCurved: true,
                                barWidth: 2,
                                dotData: FlDotData(
                                  show: true,
                                  getDotPainter: (spot, percent, bar, index) => FlDotCirclePainter(
                                    radius: 4,
                                    color: Colors.white,
                                    strokeWidth: 3,
                                    strokeColor: Colors.black,
                                  ),
                                ),
                                color: kPrimaryColor,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
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
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 22.h,
                    children: [
                      CustomText(text: "Top 5 Most Viewed Businesses",fontSize: 18,fontWeight: FontWeight.w600,),
                      SizedBox(
                        height: 200.h,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            maxY: 32000,
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    const businesses = [
                                      'Coral Villas',
                                      'Sunset Grill',
                                      'Ocean Breeze',
                                      'Blue Lagoon',
                                      'Island Adv.',
                                    ];
                                    return Text(businesses[value.toInt()], style: AppStyles.blackTextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w400), textAlign: TextAlign.center);
                                  },
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 10000,
                                  getTitlesWidget: (value, meta) => Text('${(value / 1000).toStringAsFixed(0)}K', style: AppStyles.blackTextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w400)),
                                ),
                              ),
                              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            ),
                            gridData: FlGridData(show: false),
                            borderData: FlBorderData(show: false),
                            barGroups: [
                              BarChartGroupData(x: 0, barRods: [
                                BarChartRodData(
                                  toY: 23000,
                                  color: kBlackColor.withValues(alpha: 0.04),
                                  width: 50.w,
                                  borderRadius: BorderRadius.circular(20),
                                )
                              ]),
                              BarChartGroupData(x: 1, barRods: [
                                BarChartRodData(
                                  toY: 24000,
                                  color: kBlackColor.withValues(alpha: 0.04),
                                  width: 50.w,
                                  borderRadius: BorderRadius.circular(20),
                                )
                              ]),
                              BarChartGroupData(x: 2, barRods: [
                                BarChartRodData(
                                  toY: 29000,
                                  color: kLightPrimaryColor,
                                  width: 50.w,
                                  borderRadius: BorderRadius.circular(20),
                                )
                              ]),
                              BarChartGroupData(x: 3, barRods: [
                                BarChartRodData(
                                  toY: 27000,
                                  color: kBlackColor.withValues(alpha: 0.04),
                                  width: 50.w,
                                  borderRadius: BorderRadius.circular(20),
                                )
                              ]),
                              BarChartGroupData(x: 4, barRods: [
                                BarChartRodData(
                                  toY: 31000,
                                  color: kLightPrimaryColor,
                                  width: 50.w,
                                  borderRadius: BorderRadius.circular(20),
                                )
                              ]),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
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
                        "Listing Name",
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
                        "Views",
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
                        "Saves",
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
                        "Clicks",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppStyles.whiteTextStyle()
                            .copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                  rows:
                  controller.pagedUsers
                      .map(
                        (user) => _buildDataRow(
                      user['name']!,
                      user['views']!,
                      user['saves']!,
                      user['clicks']!,
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
      ],
    );
  }

}
