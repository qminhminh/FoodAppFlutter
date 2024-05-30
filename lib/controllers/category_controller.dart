// ignore_for_file: prefer_final_fields, unused_element

import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxString _category = ''.obs;

  String get categoryValue => _category.value;

  set updateCategory(String value) {
    _category.value = value;
  }

  RxString _title = ''.obs;

  String get titleValue => _title.value;

  set updateTitle(String value) {
    _title.value = value;
  }

  RxString _ipv4 = ''.obs;
  String get ipv4Value => _ipv4.value;

  set updateIpv4(String value) {
    _ipv4.value = value;
  }
}
