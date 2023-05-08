
import 'package:finalproj/views/profile_screen/edit_profile.dart';
import 'package:finalproj/widgets_common/custom_textfield.dart';
import 'package:finalproj/widgets_common/text_style.dart';
import 'package:get/get.dart';

import '../../../consts/consts.dart';
import '../../../consts/lists.dart';
import 'components/chat_bubble.dart';

class ChatAdminScreen extends StatelessWidget {
  const ChatAdminScreen({Key? key}) : super(key: key);

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
        title: boldText(text: "Chats", size: 16.0, color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return ChatBubble();
                })
              ),
            ),
            10.heightBox,
            SizedBox(
              height: 56,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Enter message",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: darkFontGrey
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: darkFontGrey
                          )
                        )
                      ),
                    )
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send, color: darkFontGrey),
                  )
                ],
              ).box.padding(const EdgeInsets.all(12)).make(),
            )
          ],
        ),
      ),
    );
  }
}