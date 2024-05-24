// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodappflutter/common/app_style.dart';
import 'package:foodappflutter/common/reusable_text.dart';
import 'package:foodappflutter/constants/constants.dart';
import 'package:foodappflutter/controllers/user_location_controller.dart';
import 'package:foodappflutter/hooks/fetch_default.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomAppBar extends StatefulHookWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String? accessToken = box.read('token');

    if (accessToken != null) {
      useFetchDefault();
    }

    final controller = Get.put(UserLocationController());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      height: 110.h,
      width: width,
      color: kOffWhite,
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 22.r,
                  backgroundColor: kSecondary,
                  backgroundImage: const NetworkImage(
                      'https://res.cloudinary.com/dp2bicmif/image/upload/v1716555530/yxi1fcm3sm4i9imcnr60.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 6.h, left: 8.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                          text: "Giao hàng đến",
                          style: appStyle(13, kSecondary, FontWeight.w600)),
                      Obx(
                        () => SizedBox(
                          width: width * 0.65,
                          child: Text(
                            controller.address1 == ""
                                ? controller.address == ''
                                    ? "Vui lòng bật Dịch vụ Vị trí"
                                    : controller.address
                                : controller.address1,
                            overflow: TextOverflow.ellipsis,
                            style: appStyle(11, kGrayLight, FontWeight.normal),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Text(
              getTimeOfDay(),
              style: const TextStyle(fontSize: 35),
            )
          ],
        ),
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return ' ☀️ ';
    } else if (hour >= 12 && hour < 16) {
      return ' ⛅ ';
    } else {
      return ' 🌙 ';
    }
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Dịch vụ vị trí bị vô hiệu hóa.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Quyền vị trí bị từ chối ');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Quyền vị trí bị từ chối vĩnh viễn, chúng tôi không thể yêu cầu quyền.');
    }
    _getCurentLocation();
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
  }

  Future<void> _getCurentLocation() async {
    final controller = Get.put(UserLocationController());
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    LatLng currentLocation = LatLng(position.latitude, position.longitude);
    controller.setPosition(currentLocation);
    print(currentLocation);

    controller.getUserAddress(currentLocation);
  }
}
