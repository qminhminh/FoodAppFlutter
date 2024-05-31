// ignore_for_file: prefer_final_fields

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodappflutter/common/app_style.dart';
import 'package:foodappflutter/constants/constants.dart';
import 'package:foodappflutter/models/restaurants_model.dart';
import 'package:foodappflutter/views/restaurant/widget/restaurant_bottom_bar.dart';
import 'package:foodappflutter/views/restaurant/widget/restaurant_menu.dart';
import 'package:foodappflutter/views/restaurant/widget/restaurant_top_bar.dart';
import 'package:foodappflutter/views/restaurant/widget/row_text.dart';
import 'package:foodappflutter/views/restaurant/widget/xplore_widget.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kLightWhite,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: width,
                  child: CachedNetworkImage(
                      fit: BoxFit.cover, imageUrl: widget.restaurant!.imageUrl),
                ),
                Positioned(
                    bottom: 0,
                    child: RestaurantBottomBar(restaurant: widget.restaurant)),
                Positioned(
                    top: 40.h,
                    left: 0,
                    right: 0,
                    child: RestaurantTopBar(restaurant: widget.restaurant))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  const RowText(
                    first: "Khoảng cách đến nhà hàng",
                    second: "2.7 km",
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const RowText(
                    first: "Giá ước tính",
                    second: "vnd 5.000",
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const RowText(
                    first: "Thơi gian dự định",
                    second: "30 phút",
                  ),
                  const Divider(
                    thickness: 0.7,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                height: 25.h,
                width: width,
                decoration: BoxDecoration(
                    color: kOffWhite,
                    borderRadius: BorderRadius.circular(25.r)),
                child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                        color: kPrimary,
                        borderRadius: BorderRadius.circular(25.r)),
                    labelPadding: EdgeInsets.zero,
                    labelColor: kLightWhite,
                    labelStyle: appStyle(12, kLightWhite, FontWeight.normal),
                    unselectedLabelColor: kGrayLight,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: width / 2,
                          height: 25,
                          child: const Center(
                            child: Text("Thực đơn"),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: width / 2,
                          height: 25,
                          child: const Center(
                            child: Text("Khám phá"),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: SizedBox(
                height: height,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RestaurantMenuWidget(
                      restaurantId: widget.restaurant!.id,
                    ),
                    XploreWidget(
                      code: widget.restaurant!.code,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
