import 'package:finalproj/consts/consts.dart';
import 'package:finalproj/controllers/admin/home_admin_contronller.dart';
import 'package:finalproj/views/admin/home/home_admin_screen.dart';
import 'package:finalproj/views/admin/orders/order_admin_screen.dart';
import 'package:finalproj/views/admin/settings/settings_admin_screen.dart';
import 'package:get/get.dart';

import '../products/products_admin_screen.dart';

class Home_Admin extends StatelessWidget {
  const Home_Admin({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // var controller = Get.put(HomeAdminController());
    var controller = Get.find<HomeAdminController>();

    var navScreen = [const Home_Admin_Screen(), const Products_Admin_Screen(), const Orders_Admin_Screen(), const Setting_Admin_Screen()];

    var bottomNavBar = [
      BottomNavigationBarItem(icon: Image.asset(icHome, color: darkFontGrey, width: 24,), label: dashboard),
      BottomNavigationBarItem(icon: Image.asset(icWholeSale, color: darkFontGrey, width: 24), label: products),
      BottomNavigationBarItem(icon: Image.asset(icOrders, color: darkFontGrey, width: 24), label: aorders),
      BottomNavigationBarItem(icon: Image.asset(icSetting, color: darkFontGrey, width: 24), label: settings)
    ];
    return Scaffold(
      bottomNavigationBar: Obx(() => 
      BottomNavigationBar(
        onTap: (index) => {controller.navIndex.value = index},
        currentIndex: controller.navIndex.value,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: redColor,
        unselectedItemColor: darkFontGrey,
        items: bottomNavBar
      )),
      body: Obx(() =>
      Column(
        children: [
          Expanded(child: navScreen.elementAt(controller.navIndex.value))
        ],
      ),

    ));
  }
}