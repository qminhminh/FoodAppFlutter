import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodappflutter/common/shimmers/foodlist_shimmer.dart';
import 'package:foodappflutter/constants/constants.dart';
import 'package:foodappflutter/hooks/fetch_orders.dart';
import 'package:foodappflutter/models/client_orders.dart';
import 'package:foodappflutter/views/orders/widgets/client_order_tile.dart';

class Preparing extends HookWidget {
  const Preparing({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchOrders('Placed', 'Completed');

    List<ClientOrders> orders = hookResults.data;
    final isLoading = hookResults.isLoading;

    if (isLoading) {
      return const FoodsListShimmer();
    }

    return SizedBox(
      height: height * 0.8,
      child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, i) {
            return ClientOrderTile(food: orders[i].orderItems[0]);
          }),
    );
  }
}
