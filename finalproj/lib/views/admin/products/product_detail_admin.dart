import 'package:finalproj/views/profile_screen/edit_profile.dart';
import 'package:finalproj/widgets_common/custom_textfield.dart';
import 'package:finalproj/widgets_common/our_button.dart';
import 'package:finalproj/widgets_common/text_style.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';
import '../../../consts/lists.dart';

class ProductDetailAdmin extends StatelessWidget {
  const ProductDetailAdmin({Key? key}) : super(key: key);

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
          title: boldText(text: "Product details", size: 16.0, color: fontGrey),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          VxSwiper.builder(
              autoPlay: true,
              height: 350,
              aspectRatio: 16 / 9,
              itemCount: 3,
              viewportFraction: 1.0,
              itemBuilder: (context, index) {
                return Image.network(
                  imgB3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              }),
          10.heightBox,
          // title and detais section
          // title!.text
          //     .size(16)
          //     .color(darkFontGrey)
          //     .fontFamily(semibold)
          //     .make(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                boldText(text: "Product title", color: fontGrey, size: 16.0),
                10.heightBox,
                //rating
                VxRating(
                  isSelectable: false,
                  value: 3.0,
                  // value: double.parse(data['p_rating']),
                  onRatingUpdate: (value) {},
                  normalColor: textfieldGrey,
                  selectionColor: golden,
                  count: 5,
                  size: 25,
                  maxRating: 5,
                ),
                10.heightBox,
                boldText(text: "Price", color: redColor, size: 18.0),
                // "${data['p_price']}"
                //     .numCurrency
                //     .text
                //     .color(redColor)
                //     .fontFamily(bold)
                //     .size(18)
                //     .make(),

                20.heightBox,
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: normalText(text: "Color", color: fontGrey),
                          // child: "Color: ".text.color(textfieldGrey).make(),
                        ),
                        Row(
                          children: List.generate(
                              3,
                              (index) => 
                                      VxBox()
                                          .size(40, 40)
                                          .roundedFull
                                          .color(Vx.randomPrimaryColor
                                              .withOpacity(1.0))
                                          .margin(const EdgeInsets.symmetric(
                                              horizontal: 4))
                                          .make()
                                          .onTap(() {
                                      }),
                                      
                                    ),
                        )
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),
                    10.heightBox,
                    // quantity row
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: normalText(text: "Quantity", color: fontGrey)
                          // child: "Quantity: ".text.color(textfieldGrey).make(),
                        ),
                        normalText(text: "20 items", color: fontGrey),
                        
                      ],
                    ),
                  ],
                ).box.white.shadowSm.make(),
                const Divider(),
                20.heightBox,
                boldText(text: "Description", color: fontGrey),
                10.heightBox,
                normalText(text: "Description of this item", color: fontGrey)
              ],
            ),
          ),
        ])));
  }
}
