
import 'package:finalproj/views/admin/settings/chat_admin_screen.dart';
import 'package:finalproj/views/profile_screen/edit_profile.dart';
import 'package:finalproj/widgets_common/custom_textfield.dart';
import 'package:finalproj/widgets_common/text_style.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';
import '../../../consts/lists.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: boldText(text: "Messages", size: 16.0, color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(20, 
              (index) => ListTile(
                onTap: () {
                  Get.to(() => const ChatAdminScreen());
                },
                leading: const CircleAvatar(
                  backgroundColor: darkFontGrey,
                  child: Icon(Icons.person, color: whiteColor),
                ),
                title: boldText(text: "Username", color: fontGrey),
                subtitle: normalText(text: "Last message...", color: darkFontGrey),
                trailing: normalText(text: "10:00 PM", color: darkFontGrey),
              ),
            )
          ),
        ),
        ),
      );
  }
}