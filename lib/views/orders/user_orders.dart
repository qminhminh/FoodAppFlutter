import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodappflutter/common/app_style.dart';
import 'package:foodappflutter/common/back_ground_container.dart';
import 'package:foodappflutter/common/reusable_text.dart';
import 'package:foodappflutter/constants/constants.dart';
import 'package:foodappflutter/views/orders/widgets/orders/cancelled.dart';
import 'package:foodappflutter/views/orders/widgets/orders/delivered.dart';
import 'package:foodappflutter/views/orders/widgets/orders/delivering.dart';
import 'package:foodappflutter/views/orders/widgets/orders/pending.dart';
import 'package:foodappflutter/views/orders/widgets/orders/preparing.dart';
import 'package:foodappflutter/views/orders/widgets/orders_tabs.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({super.key});

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: orderList.length, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOffWhite,
        elevation: 0,
        title: ReusableText(
            text: "Đơn đặt hàng của tôi",
            style: appStyle(14, kPrimary, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: kLightWhite,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            OrdersTabs(tabController: _tabController),
            SizedBox(height: 10.h),
            SizedBox(
              height: height * 0.7,
              width: width,
              child: TabBarView(controller: _tabController, children: const [
                Pending(),
                Preparing(),
                Delivering(),
                Delivered(),
                Cancelled()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
