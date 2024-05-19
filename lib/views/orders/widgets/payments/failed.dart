import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodappflutter/common/app_style.dart';
import 'package:foodappflutter/common/reusable_text.dart';
import 'package:foodappflutter/controllers/orders_controller.dart';
import 'package:foodappflutter/views/entrypoint.dart';

import 'package:get/get.dart';

class PaymentFailed extends StatefulWidget {
  const PaymentFailed({super.key});

  @override
  State<PaymentFailed> createState() => _PaymentFailedState();
}

class _PaymentFailedState extends State<PaymentFailed> {
  @override
  void initState() {
    super.initState();
    final orderController = Get.put(OrdersController());
    orderController.updateSatusPaymentFalse(orderController.orderId);
  }

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrdersController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            orderController.setPaymentUrl = '';
            Get.off(() => MainScreen());
          },
          child: const Icon(
            AntDesign.closecircleo,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/No.png",
              color: Colors.red,
            ),
            ReusableText(
                text: "Payment Failed",
                style: appStyle(28, Colors.black, FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
