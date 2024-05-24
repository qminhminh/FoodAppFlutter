import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodappflutter/common/custom_appbar.dart';
import 'package:foodappflutter/common/custom_container.dart';
import 'package:foodappflutter/common/heading.dart';
import 'package:foodappflutter/constants/constants.dart';
import 'package:foodappflutter/controllers/category_controller.dart';
import 'package:foodappflutter/views/home/all_fastest_foods_page.dart';
import 'package:foodappflutter/views/home/all_nearby_restaurants.dart';
import 'package:foodappflutter/views/home/recommendations_page.dart';
import 'package:foodappflutter/views/home/widgets/category_foods_list.dart';
import 'package:foodappflutter/views/home/widgets/category_list.dart';
import 'package:foodappflutter/views/home/widgets/food_list.dart';
import 'package:foodappflutter/views/home/widgets/nearby_restaurants_list.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: const CustomAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              const CategoryList(),
              Obx(
                () => controller.categoryValue == ''
                    ? Column(
                        children: [
                          Heading(
                            text: "Hãy thử một cái gì đó mới",
                            onTap: () {
                              Get.to(
                                () => const RecommendationsPage(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 900),
                              );
                            },
                          ),
                          const FoodsList(),
                          Heading(
                            text: "Quán nước gần đó",
                            onTap: () {
                              Get.to(
                                () => const AllNearbyRestaurants(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 900),
                              );
                            },
                          ),
                          const NearbyRestaurants(),
                          Heading(
                            text: "Nước uống gần bạn hơn",
                            onTap: () {
                              Get.to(
                                () => const AllFastestFoods(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 900),
                              );
                            },
                          ),
                          const FoodsList(),
                        ],
                      )
                    : CustomContainer(
                        containerContent: Column(
                          children: [
                            Heading(
                              more: true,
                              text: "Khám phá ${controller.titleValue} Loại",
                              onTap: () {
                                Get.to(
                                  () => const RecommendationsPage(),
                                  transition: Transition.cupertino,
                                  duration: const Duration(milliseconds: 900),
                                );
                              },
                            ),
                            const CategoryFoodsList()
                          ],
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
