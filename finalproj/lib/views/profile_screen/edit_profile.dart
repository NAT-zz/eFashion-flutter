import 'dart:io';

import 'package:finalproj/consts/consts.dart';
import 'package:finalproj/controllers/profile_controller.dart';
import 'package:finalproj/widgets_common/bg_widget.dart';
import 'package:finalproj/widgets_common/custom_textfield.dart';
import 'package:finalproj/widgets_common/our_button.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
        child: Scaffold(
            appBar: AppBar(),
            body: Obx(() => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //if data image url and controller path is empty
                    data['imageUrl'] == '' && controller.proflieImgPath.isEmpty
                        ? Image.asset(imgProfile, width: 50, fit: BoxFit.cover)
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make()
                        // if data is not empty but controoler path is empty
                        : data['imageUrl'] != '' &&
                                controller.proflieImgPath.isEmpty
                            ? Image.network(
                                data['imageUrl'],
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make()
                            //else if controller path is not empty but data image url is
                            : Image.file(
                                File(controller.proflieImgPath.value),
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.heightBox,
                    ourButton(
                        color: redColor,
                        onPress: () {
                          controller.changeImage(context);
                        },
                        textColor: whiteColor,
                        title: "Change"),
                    const Divider(),
                    20.heightBox,
                    customTextField(
                        controller: controller.nameController,
                        hint: nameHint,
                        title: name,
                        isPass: false),
                    10.heightBox,
                    customTextField(
                        controller: controller.oldpasswordController,
                        hint: passwordHint,
                        title: oldpass,
                        isPass: true),
                    10.heightBox,
                    customTextField(
                        controller: controller.newpasswordController,
                        hint: passwordHint,
                        title: newpass,
                        isPass: true),
                    20.heightBox,
                    controller.isloading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : SizedBox(
                            width: context.screenWidth - 60,
                            child: ourButton(
                                color: redColor,
                                onPress: () async {
                                  controller.isloading(true);

                                  // if image is not selected
                                  if(controller.proflieImgPath.value.isNotEmpty)
                                  {
                                    await controller.uploadProfileImage();
                                  }else{
                                      controller.proflieImageLink = data['imageUrl'];
                                  }

                                  // if old password matches database
                                  if(data['password'] == controller.oldpasswordController.text)
                                  {
                                    await controller.changeAuthPassword(
                                      email: data['email'],
                                      password: controller.oldpasswordController.text,
                                      newpassword: controller.newpasswordController.text
                                    );


                                    await controller.updateProfile(
                                        imgUrl: controller.proflieImageLink,
                                        name: controller.nameController.text,
                                        password: controller
                                            .newpasswordController.text);

                                    VxToast.show(context, msg: "Updated");
                                     
                                  }else{
                                    VxToast.show(context, msg: "Incorrect password");
                                    controller.isloading(false);
                                  }
                                  
                                },
                                textColor: whiteColor,
                                title: "Save"),
                          ),
                  ],
                )
                    .box
                    .white
                    .shadowSm
                    .padding(const EdgeInsets.all(16))
                    .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
                    .rounded
                    .make())));
  }
}
