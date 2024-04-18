// ignore_for_file: unrelated_type_equality_checks

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodappflutter/common/custom_button.dart';
import 'package:foodappflutter/constants/constants.dart';
import 'package:foodappflutter/controllers/foods_controller.dart';
import 'package:foodappflutter/hooks/fetch_restaurant.dart';
import 'package:foodappflutter/models/foods_model.dart';
import 'package:foodappflutter/views/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

class FoodPage extends StatefulHookWidget {
  const FoodPage({super.key, required this.food});

  final FoodsModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurant(widget.food.restaurant);
    final controller = Get.put(FoodController());
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.r)),
            child: Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (i) {
                        controller.changePage(i);
                      },
                      itemCount: widget.food.imageUrl.length,
                      itemBuilder: (context, i) {
                        return Container(
                          width: width,
                          height: 230.h,
                          color: kLightWhite,
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: widget.food.imageUrl[i]),
                        );
                      }),
                ),
                Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(widget.food.imageUrl.length, (index) {
                          return Container(
                            margin: EdgeInsets.all(4.h),
                            width: 10.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.currrentPage == index
                                    ? kSecondary
                                    : kGrayLight),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 12.w,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Ionicons.chevron_back_circle,
                      color: kPrimary,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 12.w,
                    child: CustomButton(
                      onTap: () {
                        Get.to(() => RestaurantPage(
                              restaurant: hookResult.data,
                            ));
                      },
                      btnWidth: 120.w,
                      text: "Open Restaurant",
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
