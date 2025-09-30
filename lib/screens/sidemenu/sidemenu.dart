import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:havenly_admin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_text.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import 'controller/sidemenu_controller.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final menuController = Get.put(SideMenuController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: kWhiteColor,
      elevation: 0,
      width: 220.w,
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          border: Border(
            right: BorderSide(
              color: kBlackTextColor1.withOpacity(0.1), 
              width: 1,
            ),
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 175.h,
                child: DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100.h,
                          width: 75.w,
                          child: Image.asset(kLogoImage,fit: BoxFit.contain,)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      45.toHeight,
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(0);
                              Get.toNamed(kDashboardScreenRoute);
                            },
                            child: Row(
                              children: [
                                if(menuController
                                    .selectedIndex
                                    .value ==
                                    0)
                                  Image.asset(kSideMenuIcon,height: 34),
                                menuController
                                    .selectedIndex
                                    .value ==
                                    0 ? 28.toWidth : 45.toWidth,
                                Image.asset(
                                  kCrownIcon,
                                  height: 24,
                                  width: 24,
                                  color:  menuController
                                      .selectedIndex
                                      .value ==
                                      0
                                      ? kPrimaryColor
                                      : kBlackTextColor1.withValues(alpha: 0.5),
                                ),
                                14.toWidth,
                                CustomText(text: "Subscription",fontSize: 16.sp,fontWeight: FontWeight.w600,color: menuController
                                    .selectedIndex
                                    .value ==
                                    0
                                    ? kPrimaryColor : kBlackTextColor1.withValues(alpha: 0.6),)
                              ],
                            ),
                          ),
                        );
                      }),
                      48.toHeight,
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(1);
                              Get.toNamed(kListingsScreenRoute);
                            },
                            child: Row(
                              children: [
                                if(menuController
                                    .selectedIndex
                                    .value ==
                                    1)
                                Image.asset(kSideMenuIcon,height: 34.h),
                                menuController
                                    .selectedIndex
                                    .value ==
                                    1 ? 28.toWidth : 45.toWidth,
                                Image.asset(
                                  kDashboardIcon,
                                  height: 24,
                                  width: 24,
                                  color:  menuController
                                      .selectedIndex
                                      .value ==
                                      1
                                      ? kPrimaryColor
                                      : kBlackTextColor1,
                                ),
                                14.toWidth,
                                CustomText(text: "Listings",fontSize: 16.sp,fontWeight: FontWeight.w600,color: menuController
                                    .selectedIndex
                                    .value ==
                                    1
                                    ? kPrimaryColor : kBlackTextColor1.withValues(alpha: 0.6),)
                              ],
                            ),
                          ),
                        );
                      }),
                      48.toHeight,
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(2);
                              Get.toNamed(kAnalyticsScreenRoute);
                            },
                            child: Row(
                              children: [
                                if(menuController.selectedIndex.value == 2)
                                  Image.asset(kSideMenuIcon,height: 34.h),
                                menuController
                                    .selectedIndex
                                    .value ==
                                    2 ? 28.toWidth : 45.toWidth,
                                Image.asset(
                                  kClipboardIcon,
                                  height: 24,
                                  width: 24,
                                  color:  menuController
                                      .selectedIndex
                                      .value ==
                                      2
                                      ? kPrimaryColor
                                      : kBlackTextColor1,
                                ),
                                14.toWidth,
                                CustomText(text: "Analytics",fontSize: 16.sp,fontWeight: FontWeight.w600,color: menuController
                                    .selectedIndex
                                    .value ==
                                    2
                                    ? kPrimaryColor : kBlackTextColor1.withValues(alpha: 0.6),)
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              // const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 38.0.h,left: 45.w),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Get.offAllNamed(kLoginScreenRoute);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          kLogoutIcon,
                          height: 24,
                          width: 24,
                          color: kRedColor
                        ),
                        14.toWidth,
                        CustomText(text: "Logout",fontSize: 16.sp,fontWeight: FontWeight.w600,color: kRedColor)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
