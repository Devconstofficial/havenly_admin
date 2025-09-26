import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../screens/auth/controller/auth_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class AuthComponent extends StatelessWidget {
  Widget content;
  AuthComponent({super.key,required this.content});

  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kBgColor1,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Center(child: Image.asset(kLogoImage,height: 100.h,width: 75.w,))),

                  Center(
                    child: Container(
                      width: 472.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kWhiteColor,
                        border: Border.all(
                          color: kBgColor.withValues(alpha: 0.5)
                        )
                      ),
                        child: Padding(
                          padding: EdgeInsets.all(24),
                          child: content,
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    kAuthImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
