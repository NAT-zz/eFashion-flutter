import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproj/consts/colors.dart';
import 'package:finalproj/consts/consts.dart';
import 'package:finalproj/controllers/admin/home_admin_contronller.dart';
import 'package:finalproj/services/firestore_service.dart';
import 'package:finalproj/views/admin/home/home_admin.dart';
import 'package:finalproj/views/auth_screen/login_screen.dart';
import 'package:finalproj/views/home_screen/home.dart';
import 'package:finalproj/views/home_screen/home_screen.dart';
import 'package:finalproj/widgets_common/applogo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  
  @override
  State<SplashScreen> createState() {
      return _SplashScreenState();
   }
}

class _SplashScreenState extends State<SplashScreen>{
  
  //method to change screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      // Get.to(() => const LoginScreen());

      auth.authStateChanges().listen((User? user) {
        if(user == null && mounted){
          Get.to(() => const LoginScreen());
        }else{
          var controller = Get.put(HomeAdminController());
          print(user!.uid);
          // late QueryDocumentSnapshot snapshotData = FirestoreServices.getUser(currentUser!.uid);
          print(controller.getUsername());
          if (FirestoreServices.getUser(currentUser!.uid) != null) {
            Get.to(() => const Home_Admin());
          } else {
            Get.to(() => const Home());
          }
          
        }
       });
    });
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
              Align(alignment: Alignment.topLeft, child: Image.asset(icSplashBg, width: 300)),
              20.heightBox,
              applogoWidget(),
              10.heightBox,
              appname.text.fontFamily(bold).size(22).white.make(),
              5.heightBox,
              appversion.text.white.make(),
              const Spacer(),
              credits.text.white.fontFamily(semibold).make(),
              30.heightBox,
              //splash screen UI done
          ]),
      )
    );
  }

}