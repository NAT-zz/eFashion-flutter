
import 'package:finalproj/views/profile_screen/edit_profile.dart';
import 'package:finalproj/widgets_common/text_style.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';
import '../../../consts/lists.dart';

class Setting_Admin_Screen extends StatelessWidget {
  const Setting_Admin_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings, size: 16.0),
        actions: [
          IconButton(onPressed: () {
            Get.to(() => EditProfileScreen());
          }, icon: const Icon(Icons.edit)),
          TextButton(onPressed: () {}, child: normalText(text: "Logout"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(imgB2).box.roundedFull.clip(Clip.antiAlias).make(),
              title: boldText(text: "Vendor name"),
              subtitle: normalText(text: "admin@gmail.com"),
            ),
            const Divider(),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List.generate(2, (index) => ListTile(
                  leading: Icon(profileButtonIcons[index], color: whiteColor,),
                  title: normalText(text: profileButtonTitles[index]),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}