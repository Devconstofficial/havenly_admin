import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:havenly_admin/utils/sizedBox_extention.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/auth_component.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';

class SendOtpScreen extends GetView<AuthController> {
  const SendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Forget Password?",
              style: AppStyles.blackTextStyle().copyWith(
                fontSize: 28.sp,
                fontWeight: FontWeight.w600
              ),
            ),
            8.toHeight,
            Text(
              "Please enter your email to reset your password.",
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
            48.toHeight,
            CustomButton(
              title: "Submit",
              onTap: () {
                Get.toNamed(kVerifyOtpScreenRoute);
              },
            ),
          ],
        ),
      ),

    );
  }
}
