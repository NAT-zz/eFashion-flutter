import 'package:finalproj/consts/consts.dart';
import 'package:finalproj/widgets_common/text_style.dart';

Widget orderPlaceDetailsAdmin({title1, title2, d1, d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(text: "$title1", color: fontGrey),
            boldText(text: "$d1", color: redColor)
            // "$title1".text.fontFamily(semibold).make(),
            // "$d1".text.color(redColor).fontFamily(semibold).make()
          ],
        ),
        SizedBox(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(text: "$title2", color: fontGrey),
              boldText(text: "$d2", color: redColor)
              // "$title2".text.fontFamily(semibold).make(),
              // "$d2".text.make()
            ],
          ),
        )
      ],
    ),
  );
}
