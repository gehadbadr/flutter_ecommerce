import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/lists.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/provider/adminMode.dart';
import 'package:ecommerce/provider/modelHud.dart';
import 'package:ecommerce/screens/admin_home.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/widgets/applogo.dart';
import 'package:ecommerce/widgets/bg_widget.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({super.key});
  static String id = 'LoginScreen';
  GlobalKey<FormState>globalkey = GlobalKey<FormState>();
  bool? ischeck =false;
  var authcontroller = Get.put(AuthController());
  var emailController =TextEditingController();
  var passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = context.screenHeight;
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body:  SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              (height*0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Log in to ${appname}".text.fontFamily(bold).white.size(18).make(),
              10.heightBox,
              Obx(()=> Form(
                  key: globalkey,
                  child: Column(
                      children:[
                        customTextField(title: email,hint:emailHint,controller: emailController,isPass: false,onClick:(value){emailController.text=value;}),
                        customTextField(title: password,hint:passwordHint,controller: passwordController,isPass: true,onClick:(value){passwordController.text=value;}),
                        Align(alignment:Alignment.topRight,child: TextButton(onPressed: (){}, child: forgetPass.text.make())),
                        5.heightBox,
                        authcontroller.isLoading.value? CircularProgressIndicator(
                          valueColor : AlwaysStoppedAnimation(redColor),
                        )
                        :customButton(bgColor: redColor,textColor: whiteColor,title: login,onPress: ()async{
                          authcontroller.isLoading(true);
                          if(globalkey.currentState!.validate()) {
                            globalkey.currentState?.save();
                              try {
                                await authcontroller.loginMehtod(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context);
                                authcontroller.isLoading(false);
                              } catch (e) {
                                auth.signOut();
                                authcontroller.isLoading(false);
                              }
                          }else{
                            authcontroller.isLoading(false);
                          }

                        }).box.width(context.screenWidth-50).make(),
                        10.heightBox,
                        creatNewAccount.text.color(fontGrey).make(),
                        10.heightBox,
                        customButton(bgColor: lightGolden,textColor: redColor,title: signup,onPress: (){ Get.to(()=> SignupScreen()); }).box.width(context.screenWidth-50).make(),
                        10.heightBox,
                        loginWith.text.color(fontGrey).make(),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              List.generate(3, (index) => Padding(
                                padding: EdgeInsets.only(left:8),
                                child: CircleAvatar(
                                    backgroundColor:lightGrey,
                                    radius: 25,
                                    child:Image.asset(socialIconList[index],width: 30,)
                                  ),
                              )
                              ),
                        )
  ]

                  ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),
                ),
              )

            ],
          ),
        ),
      ),
      ),
    );
  }

}