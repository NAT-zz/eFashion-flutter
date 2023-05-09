import 'package:finalproj/consts/consts.dart';
import 'package:finalproj/widgets_common/text_style.dart';


Widget ProductImage({required label, onPressed}) {
  return "$label".text.bold.color(fontGrey).size(16.0).makeCentered().box.color(lightGrey).size(100, 100).roundedSM.make();
}
