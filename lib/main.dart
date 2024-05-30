import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodappflutter/constants/constants.dart';
import 'package:foodappflutter/controllers/category_controller.dart';
import 'package:foodappflutter/firebase_options.dart';
import 'package:foodappflutter/views/entrypoint.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:network_info_plus/network_info_plus.dart';

Widget defaultHome = MainScreen();
final CategoryController controller = Get.put(CategoryController());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  _getGatewayIP();
  runApp(const MyApp());
}

void _getGatewayIP() async {
  final info = NetworkInfo();
  String? gatewayIP = await info.getWifiGatewayIP();
  final controller = Get.put(CategoryController());
  controller.updateIpv4 = gatewayIP ?? 'Không thể lấy địa chỉ IP';
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Thức Uống',
          theme: ThemeData(
              scaffoldBackgroundColor: kOffWhite,
              iconTheme: const IconThemeData(color: kDark),
              primarySwatch: Colors.grey),
          home: defaultHome,
        );
      },
    );
  }
}
