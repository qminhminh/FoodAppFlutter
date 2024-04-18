// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:foodappflutter/models/restaurants_model.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.restaurant!.coords.address);
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
