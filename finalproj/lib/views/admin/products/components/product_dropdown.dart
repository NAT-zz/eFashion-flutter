import 'package:finalproj/consts/consts.dart';
import 'package:finalproj/widgets_common/text_style.dart';


Widget ProductDropdown() {
  return DropdownButtonHideUnderline(
    child: DropdownButton<String> (
      hint: normalText(text: "Choose Category", color: fontGrey),
      value: null,
      isExpanded: true,
      items: const [],
      onChanged: (value) {},
    ),
  ).box.white.padding(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.make();
}
