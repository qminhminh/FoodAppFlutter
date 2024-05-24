import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodappflutter/common/app_style.dart';
import 'package:foodappflutter/common/custom_container.dart';
import 'package:foodappflutter/common/reusable_text.dart';
import 'package:foodappflutter/common/shimmers/foodlist_shimmer.dart';
import 'package:foodappflutter/constants/constants.dart';
import 'package:foodappflutter/controllers/login_controller.dart';
import 'package:foodappflutter/hooks/fetch_cart.dart';
import 'package:foodappflutter/models/cart_response.dart';
import 'package:foodappflutter/models/login_response.dart';
import 'package:foodappflutter/views/auth/login_redirect.dart';
import 'package:foodappflutter/views/auth/verification_page.dart';
import 'package:foodappflutter/views/cart/widget/cart_tile.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartPage extends HookWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final hookResult = useFetchCart();
    final List<CartResponse> carts = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;
    final refetch = hookResult.refetch;

    LoginResponse? user;

    final controller = Get.put(LoginController());

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: "Xe đẩy",
          style: appStyle(14, kGray, FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: isLoading
              ? const FoodsListShimmer()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: ListView.builder(
                        itemCount: carts.length,
                        itemBuilder: (context, i) {
                          var cart = carts[i];
                          return CartTile(
                              refetch: refetch, color: kLightWhite, cart: cart);
                        }),
                  ),
                ),
        ),
      ),
    );
  }
}
