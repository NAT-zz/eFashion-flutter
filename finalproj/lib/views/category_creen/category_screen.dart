import 'package:finalproj/consts/consts.dart';
import 'package:finalproj/consts/lists.dart';
import 'package:finalproj/controllers/product_controller.dart';
import 'package:finalproj/views/category_creen/category_details.dart';
import 'package:finalproj/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 200), itemBuilder: (context, index) {
            return Column(
              children: [
                Image.asset(categoriesImages[index], height: 120, width: 200, fit: BoxFit.cover),
                10.heightBox,
                categoriesList[index].text.color(darkFontGrey).align(TextAlign.center).make(),
              ],
            ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {

              controller.getSubCategories(categoriesList[index]);
              Get.to(() => CategoryDetails(title: categoriesList[index]));
            });
          }))
      )
    );
  }
}