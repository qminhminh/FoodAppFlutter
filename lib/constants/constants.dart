import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodappflutter/controllers/category_controller.dart';
import 'package:get/get.dart';

String googleApiKey = 'AIzaSyDuDxriw8CH8NbVLiXtKFQ2Nb64AoRSdyg';
final controller = Get.find<CategoryController>();

const kPrimary = Color.fromARGB(255, 240, 185, 96);
const kPrimaryLight = Color(0xFF40F3EA);
const kSecondary = Color.fromARGB(255, 163, 83, 7);
const kSecondaryLight = Color(0xFFffe5db);
const kTertiary = Color(0xff0078a6);
const kGray = Color(0xff83829A);
const kGrayLight = Color(0xffC1C0C8);
const kLightWhite = Color(0xffFAFAFC);
const kWhite = Color(0xfffFFFFF);
const kDark = Color(0xff000000);
const kRed = Color(0xffe81e4d);
const kOffWhite = Color(0xffF3F4F8);

double height = 825.h;
double width = 375.w;

String appBaseUrl = "http://${controller.ipv4Value}:3000";
String appBaseUrlPayment = "http://${controller.ipv4Value}:3003";

final List<String> verificationReasons = [
  'Cập nhật thời gian thực: Nhận thông báo tức thì về trạng thái đơn đặt hàng của bạn.',
  'Giao tiếp trực tiếp: Một số được xác minh đảm bảo giao tiếp liền mạch.',
  'Bảo mật nâng cao: Bảo vệ tài khoản của bạn và xác nhận đơn đặt hàng một cách an toàn.',
  'Sắp xếp lại dễ dàng: dễ dàng giải quyết các vấn đề với một cuộc gọi nhanh.',
];

List<String> orderList = [
  "Chưa giải quyết",
  "Chuẩn bị",
  "Giao hàng",
  "Đã giao hàng",
  "Bị hủy bỏ",
];

List<String> reasonsToAddAddress = [
  "Đảm bảo rằng các đơn đặt hàng thực phẩm được giao chính xác đến vị trí của khách hàng.",
  "Cho phép người dùng kiểm tra xem dịch vụ giao hàng có sẵn trong khu vực của họ không.",
  "Đo lường quy trình thanh toán bằng cách lưu địa chỉ để đặt hàng nhanh hơn.",
  "Cho phép quản lý nhiều địa chỉ (ví dụ: nhà, công việc) để dễ dàng chuyển đổi.",
];
