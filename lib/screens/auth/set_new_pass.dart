import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:havenly_admin/utils/sizedBox_extention.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/auth_component.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';

class SetNewPassScreen extends GetView<AuthController> {
  const SetNewPassScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Set New Password",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600
              ),
            ),
            8.toHeight,
            Text(
              "Please enter your new password.",
              style: AppStyles.blackTextStyle().copyWith(fontSize: 16.sp,),
            ),
            16.toHeight,
            Text(
              "New Password",
              style: AppStyles.blackTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),
            ),
            8.toHeight,
            CustomTextField(
              hintText: "Create a secure password",
            ),
            20.toHeight,
            Text(
              "Confirm New Password",
              style: AppStyles.blackTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),
            ),
            8.toHeight,
            CustomTextField(
              hintText: "Create a secure password",
            ),
            48.toHeight,
            CustomButton(
              title: "Update Password",
              onTap: () {
                Get.toNamed(kLoginScreenRoute);
              },
            ),
          ],
        ),
      ),

    );
  }
}
