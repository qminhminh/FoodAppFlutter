// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodappflutter/common/app_style.dart';
import 'package:foodappflutter/common/back_ground_container.dart';
import 'package:foodappflutter/common/reusable_text.dart';
import 'package:foodappflutter/common/shimmers/foodlist_shimmer.dart';
import 'package:foodappflutter/constants/constants.dart';
import 'package:foodappflutter/constants/uidata.dart';
import 'package:foodappflutter/hooks/fetch_all_categories.dart';
import 'package:foodappflutter/models/categories.dart';
import 'package:foodappflutter/views/categories/widgets/category_tile.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAlCategories();
    List<CategoriesModel>? categories = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
            text: "Categories", style: appStyle(12, kGray, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: isLoading
              ? const FoodsListShimmer()
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(categories!.length, (i) {
                    CategoriesModel category = categories[i];
                    return CategoryTile(category: category);
                  }),
                ),
        ),
      ),
    );
  }
}
