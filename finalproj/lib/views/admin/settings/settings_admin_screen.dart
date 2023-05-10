import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproj/views/admin/settings/message_screen.dart';
import 'package:finalproj/views/admin/settings/shop_setting_screen.dart';
import 'package:finalproj/views/profile_screen/edit_profile.dart';
import 'package:finalproj/widgets_common/text_style.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';
import '../../../consts/lists.dart';
import '../../../controllers/admin/profile_admin_controller.dart';
import '../../../services/firestore_service.dart';
import 'edit_profile_admin.dart';

class Setting_Admin_Screen extends StatelessWidget {
  const Setting_Admin_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileAdminController());
    // TODO: implement build
    return Scaffold(
      backgroundColor: darkFontGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings, size: 16.0),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const EditProfileAdminScreen());
              },
              icon: const Icon(
                Icons.edit,
                color: whiteColor,
              )),
          TextButton(onPressed: () {}, child: normalText(text: "Logout"))
        ],
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getVendor(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor)));
          } else {
            controller.snapshotData = snapshot.data!.docs[0];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset(imgB2)
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make(),
                    title: boldText(text: "${controller.snapshotData['vendor_name']}"),
                    subtitle: normalText(text: "${controller.snapshotData['email']}"),
                  ),
                  const Divider(),
                  10.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(
                          2,
                          (index) => ListTile(
                                onTap: () {
                                  switch (index) {
                                    case 0:
                                      Get.to(() => const ShopSetting());
                                      break;
                                    case 1:
                                      Get.to(() => const MessageScreen());
                                      break;
                                    default:
                                  }
                                },
                                leading: Icon(
                                  profileButtonIcons[index],
                                  color: whiteColor,
                                ),
                                title: normalText(
                                    text: profileButtonTitles[index]),
                              )),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
