import 'package:finalproj/consts/consts.dart';

import '../../../widgets_common/text_style.dart';
import 'package:intl/intl.dart' as intl;

AppBar appbarWiget(title) {
  return AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: title, color: darkFontGrey, size: 16.0),
        actions: [
          Center(
            child: boldText(text: intl.DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now()), color: darkFontGrey),
          ),
          10.widthBox
        ],
      );
}