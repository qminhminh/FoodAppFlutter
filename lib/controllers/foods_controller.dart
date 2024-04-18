import 'package:get/get.dart';

class FoodController extends GetxController {
  RxInt currrentPage = 0.obs;

  void changePage(int index) {
    currrentPage.value = index;
  }
}
