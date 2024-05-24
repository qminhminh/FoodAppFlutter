import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodappflutter/common/app_style.dart';
import 'package:foodappflutter/common/custom_button.dart';
import 'package:foodappflutter/common/custom_container.dart';
import 'package:foodappflutter/common/reusable_text.dart';
import 'package:foodappflutter/constants/constants.dart';
import 'package:foodappflutter/views/auth/login_page.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginRedirect extends StatelessWidget {
  const LoginRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kLightWhite,
        elevation: 0.3,
        title: ReusableText(
          text: "Vui lòng đăng nhập để truy cập trang",
          style: appStyle(12, kDark, FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              Container(
                width: width,
                height: height / 2,
                color: Colors.white,
                child: LottieBuilder.asset(
                  "assets/anime/empty.json",
                  width: width,
                  height: height / 2,
                ),
              ),
              CustomButton(
                text: "ĐĂNG NHẬP",
                onTap: () {
                  Get.to(() => const LoginPage(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 900));
                },
                btnHeight: 40.h,
                btnWidth: width - 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
