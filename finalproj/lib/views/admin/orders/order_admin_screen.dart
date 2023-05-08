
import 'package:finalproj/views/admin/orders/order_admin_detail.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';
import '../../../widgets_common/text_style.dart';
import '../Components/appbar_widget.dart';
import 'package:intl/intl.dart' as intl;

class Orders_Admin_Screen extends StatelessWidget {
  const Orders_Admin_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        ),
      appBar: appbarWiget(aorders),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: List.generate(20, (index) => ListTile(
                onTap: () {
                  Get.to(() => const OrderDetailAdmin());
                },
                tileColor: textfieldGrey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                leading: Image.asset(imgB1, width: 100, height: 100, fit: BoxFit.cover),
                title: boldText(text: "OrderID", color: redColor),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, color: fontGrey),
                        10.widthBox,
                        boldText(text: intl.DateFormat().add_yMd().format(DateTime.now()), color: fontGrey),

                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.payment, color: fontGrey),
                        10.widthBox,
                        boldText(text: unpaid, color:redColor),

                      ],
                    ),
                  ],
                  ),
                  trailing: boldText(text: "\$40", color: darkFontGrey),
              )
              ),
            ),
        ) 
        ),
    );
  }
}