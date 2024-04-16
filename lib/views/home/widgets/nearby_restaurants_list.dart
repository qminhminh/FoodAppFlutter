import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodappflutter/constants/uidata.dart';
import 'package:foodappflutter/views/home/widgets/restaurant_widget.dart';

class NearbyRestaurants extends StatelessWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurants.length, (i) {
          var restaurant = restaurants[i];
          return RestaurantWidget(
            image: restaurant['imageUrl'] as String,
            logo: restaurant['logoUrl'] as String,
            title: restaurant['title'] as String,
            time: restaurant['time'] as String,
            rating: restaurant['ratingCount'] as String,
          );
        }),
      ),
    );
  }
}
