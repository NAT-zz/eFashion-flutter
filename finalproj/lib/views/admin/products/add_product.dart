import 'package:finalproj/views/profile_screen/edit_profile.dart';
import 'package:finalproj/widgets_common/custom_textfield.dart';
import 'package:finalproj/widgets_common/our_button.dart';
import 'package:finalproj/widgets_common/text_style.dart';
import 'package:get/get.dart';


import '../../../consts/consts.dart';
import '../../../consts/lists.dart';
import 'components/product_dropdown.dart';
import 'components/product_images.dart';


class AddProduct extends StatelessWidget {
  const AddProduct({super.key});
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
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextField(
                hint: "eg. Nike",
                title: "Product name"
              ),
              10.heightBox,
              customTextField(
                hint: "eg. Good product",
                title: "Description"
              ),
              10.heightBox,
              customTextField(
                hint: "eg. 100",
                title: "Price"
              ),
              10.heightBox,
              customTextField(
                hint: "eg. 10",
                title: "Quantity"
              ),
              10.heightBox,
              ProductDropdown(),
              10.heightBox,
              ProductDropdown(),
              10.heightBox,
              const Divider(color: whiteColor),
              boldText(text: "Choose product images"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3, (index) => ProductImage(label: "${index + 1}"),
                )
              ),
              5.heightBox,
              normalText(text: "First image will be your display", color: lightGrey),
              const Divider(color: whiteColor),
              10.heightBox,
              boldText(text: "Choose product images"),
              10.heightBox,
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                  9, (index) => Stack(
                    alignment: Alignment.center,
                    children: [
                      VxBox().color(Vx.randomPrimaryColor).roundedFull.size(70, 70).make(),
                      const Icon(Icons.done, color: whiteColor),
                    ]
                  ),
                )
              ),


            ],
          ),
          ),
        ),
    );
  }
}
