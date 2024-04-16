// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodappflutter/constants/constants.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: const Text("Category Page"),
      ),
      body: Center(
        child: Text("Category Page"),
      ),
    );
  }
}
