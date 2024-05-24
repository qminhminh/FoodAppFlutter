// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodappflutter/controllers/tab_index_controller.dart';
import 'package:foodappflutter/hooks/fetch_default.dart';
import 'package:foodappflutter/views/cart/cart_page.dart';
import 'package:foodappflutter/views/home/home_page.dart';
import 'package:foodappflutter/views/profile/profile_page.dart';
import 'package:foodappflutter/views/search/search_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/constants.dart';

class MainScreen extends HookWidget {
  MainScreen({super.key});

  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String? token = box.read("token");
    debugPrint(token);
    if (token != null) {
      useFetchDefault();
    }

    final controller = Get.put(TabIndexController());
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            pageList[controller.tabIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: kPrimary),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  unselectedIconTheme:
                      const IconThemeData(color: Colors.black38),
                  selectedIconTheme: const IconThemeData(color: kSecondary),
                  onTap: (value) {
                    controller.setTabIndex = value;
                  },
                  currentIndex: controller.tabIndex,
                  items: [
                    BottomNavigationBarItem(
                        icon: controller.tabIndex == 0
                            ? const Icon(AntDesign.appstore1)
                            : const Icon(AntDesign.appstore_o),
                        label: 'Trang chủ'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.search), label: 'Tìm kiếm'),
                    const BottomNavigationBarItem(
                        icon: Badge(
                            label: Text('1'),
                            child: Icon(FontAwesome.opencart)),
                        label: 'Xe đẩy'),
                    BottomNavigationBarItem(
                        icon: controller.tabIndex == 3
                            ? const Icon(FontAwesome.user_circle)
                            : const Icon(FontAwesome.user_circle_o),
                        label: 'Hồ sơ'),
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
