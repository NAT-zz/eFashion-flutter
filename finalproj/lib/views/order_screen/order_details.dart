import 'package:finalproj/consts/consts.dart';
import 'package:finalproj/views/order_screen/components/order_status.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrdersDetails extends StatelessWidget {
  final dynamic data;
  const OrdersDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Order Details".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Column(
        children: [
          orderStatus(
            color: redColor,
            icon: Icons.done,
            title: "Placed",
            showDone: data['order_placed']
          ),
          orderStatus(
            color: Colors.blue,
            icon: Icons.thumb_up,
            title: "Confirmed",
            showDone: data['order_confirmed']
          ),
          orderStatus(
            color: Colors.yellow,
            icon: Icons.car_crash,
            title: "On Delivery",
            showDone: data['order_on_delivery']
          ),
          orderStatus(
            color: Colors.purple,
            icon: Icons.done_all_rounded,
            title: "Delivered",
            showDone: data['order_delivered']
          ),
          const Divider(),
          10.heightBox,
        ],
      )
    );
  }
}