import 'package:finalproj/consts/consts.dart';


Widget ProductImage({required label, onPressed}) {
  return "$label".text.bold.color(fontGrey).size(16.0).makeCentered().box.color(lightGrey).size(100, 100).roundedSM.make();
}
