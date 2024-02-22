
import 'package:finalproj/consts/consts.dart';
import 'package:finalproj/controllers/auth_controller.dart';
import 'package:finalproj/views/admin/home/home_admin.dart';
import 'package:finalproj/widgets_common/applogo_widget.dart';
import 'package:finalproj/widgets_common/bg_widget.dart';
import 'package:finalproj/widgets_common/custom_textfield.dart';
import 'package:finalproj/widgets_common/our_button.dart';
import 'package:get/get.dart';

import '../../../widgets_common/text_style.dart';
import '../../auth_screen/login_screen.dart';


class LoginAdminScreen extends StatelessWidget {
  const LoginAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgWidget(
      child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(),
          10.heightBox,
          "Log in $appname".text.fontFamily(bold).white.size(18).make(),
          15.heightBox,
          Obx(
            () => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    boldText(text: "You are logging as Seller", color: Colors.black, size: 16.0),
                    (context.screenWidth-450).widthBox,
                    ourButton(
                      onPress: () {
                        Get.to(() => const LoginScreen());
                      },
                      color: darkFontGrey,
                      title: "Login as Customer",
                    ),
                    10.widthBox,

                  ],
                ),
                10.heightBox,
                customTextField(
                    title: email,
                    hint: emailHint,
                    isPass: false,
                    controller: controller.emailController),
                customTextField(
                    title: password,
                    hint: passwordHint,
                    isPass: true,
                    controller: controller.passwordController),
                5.heightBox,
                controller.isLoading.value ? const CircularProgressIndicator( 
                  valueColor: AlwaysStoppedAnimation(redColor),
                ) : ourButton(
                    color: redColor,
                    title: login,
                    textColor: whiteColor,
                    onPress: 
                      () async {
                        controller.isLoading(true);

                        await controller
                            .loginMethod(context: context)
                            .then((value) async {
                          if (value != null) {
                            print("value is not null");
                            // var adminController = Get.put(HomeAdminController());
                            // adminController.getUsername();
                            // if (adminController.username != ''){
                            //   VxToast.show(context, msg: loggedIn);
                            //   Get.offAll(() => const Home_Admin());
                            // } else {
                            //   VxToast.show(context, msg: loggedIn);
                            //   Get.offAll(() => const Home());
                            // }
                            VxToast.show(context, msg: loggedIn);
                            Get.offAll(() => const Home_Admin());
                            
                          }else{
                            print("value is null");
                            controller.isLoading(false);
                          }
                        });
                      }
                    ).box.width(context.screenWidth - 50).make(),
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          )
        ],
      )),
    ));
  }
}

