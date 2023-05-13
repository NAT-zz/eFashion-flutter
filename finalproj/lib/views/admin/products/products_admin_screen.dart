import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproj/consts/lists.dart';
import 'package:finalproj/controllers/admin/product_admin_controller.dart';
import 'package:finalproj/views/admin/products/add_product.dart';
import 'package:finalproj/views/admin/products/product_detail_admin.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';
import 'package:intl/intl.dart' as intl;

import '../../../services/firestore_service.dart';
import '../../../widgets_common/loading_indicator.dart';
import '../../../widgets_common/text_style.dart';
import '../Components/appbar_widget.dart';
import '../Components/dashboard_button.dart';

class Products_Admin_Screen extends StatelessWidget {
  const Products_Admin_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductAdminController());
    // TODO: implement build
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await controller.getCategoryList();
            Get.to(() => const AddProduct());
          },
          child: const Icon(Icons.add),
        ),
        appBar: appbarWiget(products),
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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(
                        data.length,
                        (index) => ListTile(
                              onTap: () {
                                Get.to(() => const ProductDetailAdmin());
                              },
                              leading: Image.network(data[index]['p_imgs'][0],
                                  width: 100, height: 100, fit: BoxFit.cover),
                              title: boldText(
                                  text: "${data[index]['p_name']}", color: darkFontGrey),
                              subtitle: Row(
                                children: [
                                  normalText(text: "\$${data[index]['p_price']}", color: darkFontGrey),
                                  10.widthBox,
                                  boldText(
                                      text: data[index]['is_featured'] == true ? "Featured": '', color: Colors.green),
                                ],
                              ),
                              trailing: VxPopupMenu(
                                child: Icon(Icons.more_vert_rounded),
                                arrowSize: 0.0,
                                menuBuilder: () => Column(
                                  children: List.generate(
                                      popupMenuTitles.length,
                                      (index) => Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              children: [
                                                Icon(popupMenuIcons[index]),
                                                5.widthBox,
                                                normalText(
                                                    text:
                                                        popupMenuTitles[index],
                                                    color: darkFontGrey)
                                              ],
                                            ).onTap(() {
                                              Get.to(() =>
                                                  const ProductDetailAdmin());
                                            }),
                                          )),
                                ).box.white.width(200).make(),
                                clickType: VxClickType.singleClick,
                              ),
                            )),
                  ),
                ));
              }
            }));
  }
}
