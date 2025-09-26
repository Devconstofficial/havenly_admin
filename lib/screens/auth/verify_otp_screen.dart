import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:havenly_admin/utils/sizedBox_extention.dart';
import 'package:otp_text_field/style.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/auth_component.dart';
import '../../custom_widgets/custom_button.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';

class VerifyOtpScreen extends GetView<AuthController> {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Verify OTP",
              style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600
              ),
            ),
            8.toHeight,
            Text(
              "Please enter the 5 digit code to confirm verification.",
              style: AppStyles.blackTextStyle().copyWith(fontSize: 16.sp,),
            ),
            16.toHeight,
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceBetween,
              fieldWidth: 56,
              otpFieldStyle: OtpFieldStyle(enabledBorderColor: kBlackTextColor2,borderColor: kBlackTextColor2,focusBorderColor: kPrimaryColor,disabledBorderColor: kBlackTextColor2),
              fieldStyle: FieldStyle.box,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              outlineBorderRadius: 12.r,
              style: AppStyles.blackTextStyle().copyWith(fontSize: 20.sp,fontWeight: FontWeight.w600),
              onChanged: (pin) {

              },
              onCompleted: (pin) async {},
            ),
            48.toHeight,
            CustomButton(
              title: "Verify OTP",
              onTap: () {
                Get.toNamed(kSetNewPassScreenRoute);
              },
            ),
          ],
        ),
      ),

    );
  }
}
