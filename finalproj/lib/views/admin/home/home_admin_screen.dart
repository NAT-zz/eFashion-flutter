
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproj/views/admin/Components/appbar_widget.dart';
import 'package:finalproj/views/admin/Components/dashboard_button.dart';
import 'package:finalproj/views/admin/products/product_detail_admin.dart';
import 'package:finalproj/widgets_common/text_style.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';
import 'package:intl/intl.dart' as intl;

import '../../../services/firestore_service.dart';
import '../../../widgets_common/loading_indicator.dart';

class Home_Admin_Screen extends StatelessWidget {
  const Home_Admin_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: appbarWiget(dashboard),
      body: StreamBuilder(
         stream: FirestoreServices.getProductsByVendor(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: loadingIndicator(),
                );
              } else {
                var data = snapshot.data!.docs;
                data = data.sortedBy((a, b) => a['p_wishlist'].length.compareTo(b['p_wishlist'].length));
                return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context, title: products, count: "${data.length}", icon: icWholeSale),
                dashboardButton(context, title: aorders, count: "1", icon: icOrders),
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context, title: rating, count: "60", icon: icBrands),
                dashboardButton(context, title: totalSales, count: "15", icon: icOrder),
              ],
            ),
            10.heightBox,
            const Divider(),
            10.heightBox,
            boldText(text: "Popular Products", color: darkFontGrey, size: 16.0),
            20.heightBox,
            ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(data.length, (index) => ListTile(
                onTap: () {
                  Get.to(() => ProductDetailAdmin(data: data[index]));
                },
                leading: Image.network(data[index]['p_imgs'][0], width: 100, height: 100, fit: BoxFit.cover),
                title: boldText(text: "${data[index]['p_name']}", color: darkFontGrey),
                subtitle: normalText(text: "\$ ${data[index]['p_price']}", color: darkFontGrey),
              )
              ),
            )
          ],
        ),
        );}
              }
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           dashboardButton(context, title: products, count: "60", icon: icWholeSale),
      //           dashboardButton(context, title: aorders, count: "15", icon: icOrders),
      //         ],
      //       ),
      //       10.heightBox,
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           dashboardButton(context, title: rating, count: "60", icon: icBrands),
      //           dashboardButton(context, title: totalSales, count: "15", icon: icOrder),
      //         ],
      //       ),
      //       10.heightBox,
      //       const Divider(),
      //       10.heightBox,
      //       boldText(text: "Popular Products", color: darkFontGrey, size: 16.0),
      //       20.heightBox,
      //       ListView(
      //         physics: const BouncingScrollPhysics(),
      //         shrinkWrap: true,
      //         children: List.generate(3, (index) => ListTile(
      //           onTap: () {
                  
      //           },
      //           leading: Image.asset(imgB1, width: 100, height: 100, fit: BoxFit.cover),
      //           title: boldText(text: "Product Title", color: darkFontGrey),
      //           subtitle: normalText(text: "\$40", color: darkFontGrey),
      //         )
      //         ),
      //       )
      //     ],
      //   ),
      //   ),
    );
  }
}