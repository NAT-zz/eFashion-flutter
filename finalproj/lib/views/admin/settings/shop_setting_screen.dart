
import 'package:finalproj/views/profile_screen/edit_profile.dart';
import 'package:finalproj/widgets_common/custom_textfield.dart';
import 'package:finalproj/widgets_common/text_style.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';
import '../../../consts/lists.dart';

class ShopSetting extends StatelessWidget {
  const ShopSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: darkFontGrey,
      appBar: AppBar(
       title: boldText(text: "Shop Settings", size: 16.0),
       actions: [TextButton(onPressed: () {}, child: normalText(text: "Save"))], 
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextField(
              title: "Shop's Name",
              hint: "Eg. ATT Shop",
            ),
            10.heightBox,
            customTextField(
              title: "Address",
              hint: "Eg. HCM City",
            ),
            10.heightBox,
            customTextField(
              title: "Phone number",
              hint: "Eg. 123456789",
            ),
            10.heightBox,
            customTextField(
              title: "Website",
              hint: "Eg. https://abc",
            ),
            10.heightBox,
            customTextField(
              title: "Description",
              hint: "Eg. This is ...",
            ),
          ],
        ),
      ),
    );
  }
}