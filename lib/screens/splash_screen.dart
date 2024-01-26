import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/widgets/applogo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';

   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async{

    await Future.delayed(Duration(seconds: 4),(){});
    auth.authStateChanges().listen((User? user) {
      if(user == null && mounted){
        Get.to(()=> LoginScreen());
      }else{
        Get.to(()=> HomePage());
      }
    });
   // Navigator.pushReplacementNamed(context, LoginScreen.id);
    Get.to(()=>FirebaseAuth.instance.currentUser == null? LoginScreen():HomePage());
 }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(alignment:Alignment.topLeft,child: Image.asset(icSplashBg,width: 300,)),
            appLogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            Spacer(),
            credits.text.white.make(),
            30.heightBox,

          ],
        ),
      ),
    );
  }
}
