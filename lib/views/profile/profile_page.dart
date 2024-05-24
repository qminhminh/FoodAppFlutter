import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodappflutter/common/custom_button.dart';
import 'package:foodappflutter/common/custom_container.dart';
import 'package:foodappflutter/constants/constants.dart';
import 'package:foodappflutter/controllers/login_controller.dart';
import 'package:foodappflutter/models/login_response.dart';
import 'package:foodappflutter/views/auth/login_redirect.dart';
import 'package:foodappflutter/views/auth/verification_page.dart';
import 'package:foodappflutter/views/orders/user_orders.dart';
import 'package:foodappflutter/views/profile/addresses_page.dart';
import 'package:foodappflutter/views/profile/widget/profile_app_bar.dart';
import 'package:foodappflutter/views/profile/widget/profile_tile_widget.dart';
import 'package:foodappflutter/views/profile/widget/user_info_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponse? user;
    final controller = Get.put(LoginController());

    final box = GetStorage();

    String? token = box.read('token');

    if (token != null) {
      user = controller.getUserInfo();
    }

    if (token == null) {
      return const LoginRedirect();
    }

    if (user != null && user.verification == false) {
      return const VerificationPage();
    }

    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h), child: const ProfileAppBar()),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              UserInfoWidget(user: user),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 185.h,
                decoration: const BoxDecoration(color: kLightWhite),
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ProfileTileWidget(
                        onTap: () {
                          Get.to(() => const UserOrders(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 900));
                        },
                        title: "Đơn đặt hàng của tôi",
                        icon: Ionicons.fast_food_outline),
                    ProfileTileWidget(
                        onTap: () {},
                        title: "Địa điểm yêu thích của tôi",
                        icon: Ionicons.heart_outline),
                    ProfileTileWidget(
                        onTap: () {},
                        title: "Ôn tập",
                        icon: Ionicons.chatbubble_outline),
                    ProfileTileWidget(
                        onTap: () {},
                        title: "Phiếu giảm giá",
                        icon: MaterialCommunityIcons.tag_outline),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 185.h,
                decoration: const BoxDecoration(color: kLightWhite),
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ProfileTileWidget(
                        onTap: () {
                          Get.to(
                            () => const Addresses(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 900),
                          );
                        },
                        title: "Địa chỉ giao hàng",
                        icon: SimpleLineIcons.location_pin),
                    ProfileTileWidget(
                        onTap: () {},
                        title: "Trung tâm dịch vụ",
                        icon: AntDesign.customerservice),
                    ProfileTileWidget(
                        onTap: () {},
                        title: "Phiếu giảm giá",
                        icon: MaterialIcons.rss_feed),
                    ProfileTileWidget(
                        onTap: () {},
                        title: "Cài đặt",
                        icon: AntDesign.setting),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                onTap: () {
                  controller.logout();
                },
                btnColor: kRed,
                text: "Đăng xuất",
                radius: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
