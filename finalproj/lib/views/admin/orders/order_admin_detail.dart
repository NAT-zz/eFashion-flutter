
import 'package:finalproj/views/profile_screen/edit_profile.dart';
import 'package:finalproj/widgets_common/custom_textfield.dart';
import 'package:finalproj/widgets_common/our_button.dart';
import 'package:finalproj/widgets_common/text_style.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';
import '../../../consts/lists.dart';
import 'components/order_place.dart';

class OrderDetailAdmin extends StatelessWidget {
  const OrderDetailAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: darkFontGrey),
          onPressed: () {
            Get.back();
          }, 
        ),
        title: boldText(text: "Order details", size: 16.0, color: fontGrey),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: ourButton(color: Colors.green, onPress: () {}, title: "Confirm Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                //order delivery section
                Visibility(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(text: "Order Status", color: fontGrey, size: 16.0),
                    SwitchListTile(
                      activeColor: Colors.green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: "Placed", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: Colors.green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: "Confirmed", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: Colors.green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: "On Delivery", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: Colors.green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: "Delivered", color: fontGrey),
                    )
                  ],
                ).box.padding(const EdgeInsets.all(8.0)).outerShadowMd.white.border(color: lightGrey).roundedSM.make(),
                ),

                //order detail section
                Column(
                  children: [
                    orderPlaceDetailsAdmin(
                      d1: "data['order_code']",
                      d2: "data['shipping_method']",
                      title1: "Order Code",
                      title2: "Shipping Method",
                    ),
                    orderPlaceDetailsAdmin(
                      d1: DateTime.now(),
                      // d1: intl.DateFormat()
                      //     .add_yMd()
                      //     .format((data['order_date'].toDate())),
                      d2: "data['payment_method']",
                      title1: "Order Date",
                      title2: "Payment Method",
                    ),
                    orderPlaceDetailsAdmin(
                      d1: "Unpaid",
                      d2: "Order Placed",
                      title1: "Payment Status",
                      title2: "Delevery Status",
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // "Shipping Address"
                              //     .text
                              //     .fontFamily(semibold)
                              //     .make(),
                              boldText(text: "Shipping Address", color: darkFontGrey),
                              "{data['order_by_name']}".text.make(),
                              "{data['order_by_email']}".text.make(),
                              "{data['order_by_address']}".text.make(),
                              "{data['order_by_city']}".text.make(),
                              "{data['order_by_phone']}".text.make(),
                              "{data['order_by_postalcode']}".text.make(),
                            ],
                          ),
                          SizedBox(
                            width: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                boldText(text: "Total Amount", color: darkFontGrey),
                                boldText(text: "\$300", color: redColor, size: 16.0)
                                // "Total Amount".text.fontFamily(semibold).make(),
                                // "${data['total_amount']}"
                                //     .text
                                //     .color(redColor)
                                //     .fontFamily(bold)
                                //     .make()
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ).box.outerShadowMd.white.border(color: lightGrey).roundedSM.make(),
                const Divider(),
                10.heightBox,
                boldText(text: "Ordered Products", color: fontGrey, size: 16.0),
                10.heightBox,
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(3, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlaceDetailsAdmin(
                          title1: "data['orders'][index]['title']",
                          title2: "data['orders'][index]['tprice']",
                          d1: "{data['orders'][index]['qty']}x",
                          d2: "Refundable",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                              width: 30,
                              height: 20,
                              color: darkFontGrey,
                          )
                        ),
                        const Divider(),
                      ],
                    );
                  }).toList(),
                ).box.outerShadowMd.white.margin(const EdgeInsets.only(bottom: 4)).make(),
                20.heightBox,
                
              ],
            ),
          ),
      ),
    );
  }
}