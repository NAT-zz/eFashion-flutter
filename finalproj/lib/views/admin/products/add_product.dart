import 'package:finalproj/controllers/admin/product_admin_controller.dart';
import 'package:finalproj/views/profile_screen/edit_profile.dart';
import 'package:finalproj/widgets_common/custom_textfield.dart';
import 'package:finalproj/widgets_common/loading_indicator.dart';
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
    var controller = Get.find<ProductAdminController>();
    return Obx(()=>
    Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: darkFontGrey),
            onPressed: () {
              Get.back();
            },
          ),
          title: boldText(text: "Add Product", size: 16.0, color: fontGrey),
          actions: [
            controller.isLoading.value ? loadingIndicator() :
            TextButton(onPressed: () async {
              controller.isLoading(true);
              await controller.uploadImages();
              await controller.uploadProduct(context);
              Get.back();
            }, child: boldText(text: "Save", color: darkFontGrey)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextFieldAdmin(
                hint: "eg. Nike",
                title: "Product name",
                controller: controller.nameController,
              ),
              10.heightBox,
              customTextFieldAdmin(
                
                hint: "eg. Good product",
                title: "Description",
                controller: controller.descController,
                isDesc: true,               
              ),
              10.heightBox,
              customTextFieldAdmin(
                hint: "eg. 100",
                title: "Price",
                controller: controller.priceController,
              ),
              10.heightBox,
              customTextFieldAdmin(
                hint: "eg. 10",
                title: "Quantity",
                controller: controller.quantityController,
              ),
              10.heightBox,
              productDropdown("Category", controller.categoryList, controller.categoryValue, controller),
              10.heightBox,
              productDropdown("Subcategory", controller.subcategoryList, controller.subcategoryValue, controller),
              10.heightBox,
              const Divider(color: whiteColor),
              boldText(text: "Choose product images"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3, (index) => controller.imageList[index] != null 
                  ? Image.file(controller.imageList[index], width: 100,).onTap(() {
                    controller.pickImage(index, context);
                  })
                  : ProductImage(label: "${index + 1}").onTap(() {
                    controller.pickImage(index, context);
                  }),
                )
              ),
              5.heightBox,
              normalText(text: "First image will be your display", color: lightGrey),
              const Divider(color: whiteColor),
              10.heightBox,
              boldText(text: "Choose product images"),
              10.heightBox,
              Obx(() => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                  9, (index) => Stack(
                    alignment: Alignment.center,
                    children: [
                      VxBox().color(Vx.randomPrimaryColor).roundedFull.size(65, 65).make().onTap(() {
                        controller.selectedColorIndex.value = index;
                      }),
                      controller.selectedColorIndex.value == index 
                      ? const Icon(Icons.done, color: whiteColor) 
                      : const SizedBox(),
                    ]
                  ),
                )
              )),


            ],
          ),
          ),
        ),
    ));
  }
}
