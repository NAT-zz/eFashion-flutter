import 'package:finalproj/consts/consts.dart';
import 'package:finalproj/controllers/admin/product_admin_controller.dart';
import 'package:finalproj/widgets_common/text_style.dart';
import 'package:get/get.dart';

Widget productDropdown(
    hint, List<String> list, dropValue, ProductAdminController controller) {
      print('$hint: ${dropValue.value}');
  return Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: normalText(text: "$hint", color: fontGrey),
          value: dropValue.value == '' ? null : dropValue.value,
          isExpanded: true,
          items: list.map((e) {
            return DropdownMenuItem(
              value: e,
              child: e.toString().text.make(),
            );
          }).toList(),
          onChanged: (value) {
            if (hint == "Category") {
              controller.subcategoryValue.value = '';
              controller.getSubcategoryList(value.toString());
            }
            dropValue.value = value.toString();
          },
        ),
      )
          .box
          .white
          .padding(const EdgeInsets.symmetric(horizontal: 4))
          .roundedSM
          .make());
}
