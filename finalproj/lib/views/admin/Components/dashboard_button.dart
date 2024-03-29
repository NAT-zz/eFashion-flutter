import 'package:finalproj/consts/consts.dart';

import '../../../widgets_common/text_style.dart';

Widget dashboardButton(context, {title, count, icon}) {
  var size = MediaQuery.of(context).size;
  return Row(
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    boldText(text: title, size: 16.0),
                    boldText(text: count, size: 20.0),
                  ],
                  
                )),
                Image.asset(icon, width: 40, color: whiteColor),
                
              ],
            )
              .box
              .color(darkFontGrey)
              .rounded
              .width(size.width * 0.4)
              .height(80)
              .padding(const EdgeInsets.all(8))
              .make();
}