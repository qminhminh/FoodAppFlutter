// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodappflutter/constants/constants.dart';
import 'package:foodappflutter/models/api_eror.dart';
import 'package:foodappflutter/models/success_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  void registrationFunction(String data) async {
    setLoading = true;

    Uri url = Uri.parse('$appBaseUrl/register');

    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, headers: headers, body: data);

      if (response.statusCode == 201) {
        var data = successModelFromJson(response.body);

        setLoading = false;

        Get.back();

        Get.snackbar("Bạn đang được đăng ký thành công", data.message,
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: const Icon(Ionicons.fast_food_outline));
      } else {
        var error = apiErrorFromJson(response.body);

        Get.snackbar("Đăng kí thất bại", error.message,
            colorText: kLightWhite,
            backgroundColor: kRed,
            icon: const Icon(Icons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
