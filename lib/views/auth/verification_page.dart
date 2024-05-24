// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodappflutter/common/app_style.dart';
import 'package:foodappflutter/common/custom_button.dart';
import 'package:foodappflutter/common/custom_container.dart';
import 'package:foodappflutter/common/reusable_text.dart';
import 'package:foodappflutter/constants/constants.dart';
import 'package:foodappflutter/controllers/verification_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        title: ReusableText(
          text: "Hãy xác thực tài khoản của bạn",
          style: appStyle(12, kGray, FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: CustomContainer(
        color: Colors.white,
        containerContent: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: height,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Lottie.asset("assets/anime/delivery.json"),
                SizedBox(
                  height: 10.h,
                ),
                ReusableText(
                  text: "Xác thực tài khoản của bạn",
                  style: appStyle(20, kPrimary, FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Nhập mã 6 chữ số được gửi đến email của bạn, nếu bạn không thấy mã, vui lòng kiểm tra thư mục spam của bạn.",
                  textAlign: TextAlign.justify,
                  style: appStyle(10, kGray, FontWeight.normal),
                ),
                SizedBox(
                  height: 20.h,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: kPrimary,
                  borderWidth: 2.0,
                  textStyle: appStyle(17, kDark, FontWeight.w600),
                  onCodeChanged: (String code) {},
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  onSubmit: (String verificationCode) {
                    controller.setCode = verificationCode;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  text: "XÁC NHẬN TÀI KHOẢN",
                  onTap: () {
                    controller.verificationFunction();
                  },
                  btnHeight: 35.h,
                  btnWidth: width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
