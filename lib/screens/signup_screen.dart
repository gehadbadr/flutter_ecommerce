
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/provider/modelHud.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/widgets/applogo.dart';
import 'package:ecommerce/widgets/bg_widget.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_textfield.dart';
import 'package:ecommerce/widgets/custom_textfield1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class SignupScreen extends StatefulWidget {
   SignupScreen({super.key});
  static String id = 'SignupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  GlobalKey<FormState>globalkey = GlobalKey<FormState>();
  bool? ischeck =false;
  var authcontroller = Get.put(AuthController());
  var nameController =TextEditingController();
  var passwordController =TextEditingController();
  var repasswordController =TextEditingController();
  var emailController =TextEditingController();


  @override
  Widget build(BuildContext context) {
    double height = context.screenHeight;
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              (height*0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Join to ${appname}".text.fontFamily(bold).white.size(18).make(),
              10.heightBox,
              Obx(()=>Form(
                key: globalkey,
                child: Column(
                    children:[
                      customTextField(title: name,hint:nameHint,controller: nameController,isPass: false,onClick:(value){nameController.text=value;}),
                      customTextField(title: email,hint:emailHint,controller: emailController,isPass: false,onClick:(value){emailController.text=value;}),
                      customTextField(title: password,hint:passwordHint,controller: passwordController,isPass: true,onClick:(value){passwordController.text=value;}),
                      customTextField(title: repassword,hint:repasswordHint,controller: repasswordController,isPass: true,onClick:(value){repasswordController.text=value;}),
                      10.heightBox,
                      Row(
                        children: [
                          Checkbox(value: ischeck , onChanged: (value){ setState((){ischeck=value;});} ,checkColor: redColor,activeColor: whiteColor,),
                          5.widthBox,
                          Expanded(
                            child: RichText(text: TextSpan(
                                children: [
                                  TextSpan(text:"I agree to the ",style: TextStyle(
                                      fontFamily: regular,
                                      color:fontGrey
                                  )),
                                  TextSpan(text:termAndCond,style: TextStyle(
                                      fontFamily: bold,
                                      color:redColor
                                  )),
                                  TextSpan(text:" & ",style: TextStyle(
                                      fontFamily: regular,
                                      color:fontGrey
                                  )),
                                  TextSpan(text:privacyPolicy,style: TextStyle(
                                      fontFamily: bold,
                                      color:redColor
                                  ))
                                ]
                            ),),
                          ),
                        ],
                      ),
                      10.heightBox,
                      authcontroller.isLoading.value? CircularProgressIndicator(
                        valueColor : AlwaysStoppedAnimation(redColor),
                      )
                      :customButton(
                          bgColor: ischeck == true ? redColor:lightGrey,
                          textColor: whiteColor,
                          title: signup,
                          onPress: ()async{
                            authcontroller.isLoading(true);
                            if(ischeck == true){
                              if(globalkey.currentState!.validate()) {
                                globalkey.currentState?.save();
                                if(passwordController.text == repasswordController.text){
                                  try {
                                    await authcontroller.signupMehtod(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        context: context)
                                        .then((value) {
                                      authcontroller.isLoading(false);
                                    });
                                  } catch (e) {
                                    auth.signOut();
                                    authcontroller.isLoading(false);
                                  }
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Retype password is not correct")));
                                }
                                authcontroller.isLoading(false);
                              }else{
                                authcontroller.isLoading(false);
                              }
                            }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("You have to agree")));
                                authcontroller.isLoading(false);
                            }
                          }
                      ).box.width(context.screenWidth-50).make(),
                      10.heightBox,
                      RichText(text: TextSpan(
                          children: [

                            TextSpan(text:alreadyHaveAccount,style: TextStyle(
                                fontFamily: bold,
                                color:fontGrey
                            )),
                            TextSpan(text:login,style: TextStyle(
                                fontFamily: bold,
                                color:redColor
                            ))
                          ]
                      ),).onTap(() {/* Get.back();*/ Get.to(()=>LoginScreen());})

                    ]
                ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),
              ))
            ],
          ),
        ),
      ),
    ),
    );  }
}




