import 'package:finalproj/views/profile_screen/edit_profile.dart';
import 'package:finalproj/widgets_common/custom_textfield.dart';
import 'package:finalproj/widgets_common/our_button.dart';
import 'package:finalproj/widgets_common/text_style.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';
import '../../../consts/lists.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

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
          title: boldText(text: "Add Product", size: 16.0, color: fontGrey),
          actions: [
            TextButton(onPressed: () {}, child: boldText(text: "Save", color: darkFontGrey)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              customTextField(
                hint: "eg. Nike",
                title: "Product name"
              )
            ],
          ), 
        ),
    );
  }
}