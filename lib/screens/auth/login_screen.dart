import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:havenly_admin/utils/sizedBox_extention.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/auth_component.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome Back  👋",
              style: AppStyles.blackTextStyle().copyWith(
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            8.toHeight,
            Text(
              "Sign in to manage salons, technicians, and job postings.",
              style: AppStyles.blackTextStyle().copyWith(fontSize: 16.sp,),
            ),
            16.toHeight,
            Text(
              "Email",
              style: AppStyles.blackTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),
            ),
            8.toHeight,
            CustomTextField(
              hintText: "Example@email.com",
            ),
            24.toHeight,
            Text(
              "Password",
              style: AppStyles.blackTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),
            ),
            8.toHeight,
            CustomTextField(
              hintText: "Enter your password",
            ),
            24.toHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MouseRegion(
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(kSendOtpScreenRoute);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: AppStyles.primaryTextStyle().copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            24.toHeight,
            CustomButton(
              title: "Sign In",
              onTap: () {
                // Get.toNamed(kDashboardScreenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
