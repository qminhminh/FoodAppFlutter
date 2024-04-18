import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodappflutter/common/app_style.dart';
import 'package:foodappflutter/common/reusable_text.dart';
import 'package:foodappflutter/constants/constants.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      color: kLightWhite,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 35.h,
                      width: 35.w,
                      child: const CircleAvatar(
                        backgroundColor: kGrayLight,
                        backgroundImage: NetworkImage(
                            "https://d326fntlu7tb1e.cloudfront.net/uploads/b8bac89b-b85d-4ead-bb9e-57c96e03a08b-vinci_02.jpg"),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: "Username",
                            style: appStyle(12, kGray, FontWeight.w600),
                          ),
                          ReusableText(
                            text: "emaiil@eemail.gsdfjh",
                            style: appStyle(10, kGray, FontWeight.normal),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Feather.edit,
                      color: kGray,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
