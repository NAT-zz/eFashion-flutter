
import 'package:finalproj/consts/lists.dart';
import 'package:finalproj/views/admin/products/add_product.dart';
import 'package:finalproj/views/admin/products/product_detail_admin.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';
import 'package:intl/intl.dart' as intl;

import '../../../widgets_common/text_style.dart';
import '../Components/appbar_widget.dart';
import '../Components/dashboard_button.dart';

class Products_Admin_Screen extends StatelessWidget {
  const Products_Admin_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddProduct());
        },
        child: const Icon(Icons.add),
        ),
      appBar: appbarWiget(products),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: List.generate(20, (index) => ListTile(
                onTap: () {
                  
                },
                leading: Image.asset(imgB1, width: 100, height: 100, fit: BoxFit.cover),
                title: boldText(text: "Product Title", color: darkFontGrey),
                subtitle: normalText(text: "\$40", color: darkFontGrey),
                trailing: VxPopupMenu(
                  child: Icon(Icons.more_vert_rounded),
                  arrowSize: 0.0,
                  menuBuilder: () => Column(
                    children: List.generate(popupMenuTitles.length, (index) => Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                        Icon(popupMenuIcons[index]),
                        5.widthBox,
                        normalText(text: popupMenuTitles[index], color: darkFontGrey)
                      ],
                      ).onTap(() {
                        Get.to(() => const ProductDetailAdmin());
                      }),
                    )
                    ),
                  ).box.white.width(200).make(),
                  clickType: VxClickType.singleClick,
                ),
              )
              ),
            ),
        ) 
        ),
    );
  }
}