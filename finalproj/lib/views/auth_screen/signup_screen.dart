import 'package:finalproj/consts/consts.dart';
import 'package:finalproj/controllers/auth_controller.dart';
import 'package:finalproj/views/auth_screen/login_screen.dart';
import 'package:finalproj/widgets_common/applogo_widget.dart';
import 'package:finalproj/widgets_common/bg_widget.dart';
import 'package:finalproj/widgets_common/custom_textfield.dart';
import 'package:finalproj/widgets_common/our_button.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(),
          10.heightBox,
          "Sign up for $appname".text.fontFamily(bold).white.size(18).make(),
          15.heightBox,
          Obx(
            () => Column(
              children: [
                customTextField(
                    title: name,
                    hint: nameHint,
                    controller: nameController,
                    isPass: false),
                customTextField(
                    title: email,
                    hint: emailHint,
                    controller: emailController,
                    isPass: false),
                customTextField(
                    title: password,
                    hint: passwordHint,
                    controller: passwordController,
                    isPass: true),
                customTextField(
                    title: retypePassword,
                    hint: retypePassword,
                    controller: passwordRetypeController,
                    isPass: true),
                5.heightBox,
                Row(
                  children: [
                    Checkbox(
                      activeColor: redColor,
                      checkColor: whiteColor,
                      value: isCheck,
                      onChanged: (newValue) => {
                        setState(() {
                          isCheck = newValue;
                        })
                      },
                    ),
                    10.widthBox,
                    Expanded(
                        child: RichText(
                            text: const TextSpan(children: [
                      TextSpan(
                          text: "I agree to the ",
                          style: TextStyle(
                            fontFamily: regular,
                            color: fontGrey,
                          )),
                      TextSpan(
                          text: tertmAndConditoin,
                          style: TextStyle(
                            fontFamily: regular,
                            color: redColor,
                          )),
                      TextSpan(
                          text: " & ",
                          style: TextStyle(
                            fontFamily: regular,
                            color: redColor,
                          )),
                      TextSpan(
                          text: privacyPolicy,
                          style: TextStyle(
                            fontFamily: regular,
                            color: redColor,
                          ))
                    ])))
                  ],
                ),
                5.heightBox,
                if (controller.isLoading.value)
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  )
                else
                  ourButton(
                      color: isCheck == true ? redColor : lightGrey,
                      title: singUp,
                      textColor: whiteColor,
                      onPress: () async {
                        if (isCheck != false) {
                          try {
                            if (passwordController.text !=
                                    passwordRetypeController.text ||
                                emailController.text == '' ||
                                nameController.text == '' ||
                                passwordController.text == '') {
                              throw Exception(
                                  'Please recheck your information');
                            }

                            controller.isLoading(true);

                            await controller
                                .signupMethod(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) {
                              return controller.storeUserData(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text);
                            }).then((value) async {
                              VxToast.show(context, msg: signUp);
                              await auth.signOut();
                              Get.offAll(() => const LoginScreen());
                            });
                          } catch (e) {
                            VxToast.show(context, msg: e.toString());
                            controller.isLoading(false);
                            await auth.signOut();
                          }
                        }
                      }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    alreadyHaveAccount.text.color(fontGrey).make(),
                    login.text.color(redColor).make().onTap(() {
                      Get.back();
                    }),
                  ],
                ),
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
