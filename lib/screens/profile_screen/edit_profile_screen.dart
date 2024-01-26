import 'dart:io';

import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/controllers/profile_controller.dart';
import 'package:ecommerce/screens/profile_screen/profile_screen.dart';
import 'package:ecommerce/widgets/bg_widget.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  GlobalKey<FormState>globalkey = GlobalKey<FormState>();

  EditProfileScreen({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    var authController = Get.put(AuthController());
    var profileController = Get.put(ProfileController());
    profileController.nameController.text = data['name'];
    profileController.oldPasswordController.text = data['password'];
    profileController.newPasswordController.text = data['password'];

    return bgWidget(Scaffold(
      appBar:AppBar() ,
      body: Obx(()=> Form(
            key: globalkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
               // mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  data['imageUrl'] ==''&& profileController.profileImgPath.isEmpty
                  ? Image.asset(imgProfile2,width:100,fit:BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                  : data['imageUrl'] !=''&& profileController.profileImgPath.isEmpty
                  ?Image.network(data['imageUrl'],width:100,fit:BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                  :Image.file(File(profileController.profileImgPath.value),width:100,fit:BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.heightBox,
                  customButton(bgColor: redColor,textColor: whiteColor ,title: 'Change' ,onPress: (){profileController.changeImage(context);}),
                  Divider(),
                  20.heightBox,
                  customTextField(title: name,hint:nameHint,controller: profileController.nameController,isPass: false,onClick:(value){profileController.nameController.text=value;}),
                  customTextField(title: oldPassword,hint:passwordHint,controller: profileController.oldPasswordController,isPass: true,onClick:(value){profileController.oldPasswordController.text=value;}),
                  customTextField(title: newPassword,hint:passwordHint,controller: profileController.newPasswordController,isPass: true,onClick:(value){profileController.newPasswordController.text=value;}),
                  20.heightBox,
                  profileController.isLoading.value? CircularProgressIndicator(
                    valueColor : AlwaysStoppedAnimation(redColor),
                  ):SizedBox(child: 'save'.text.fontFamily(semibold).align(TextAlign.center).white.make(),).box.color(redColor).width(context.screenWidth-60).roundedSM.padding(EdgeInsets.all(10)).make()
                      .onTap(()async {
                        profileController.isLoading(true);
                        if(globalkey.currentState!.validate()) {
                          globalkey.currentState?.save();
                          if(profileController.profileImgPath.value.isNotEmpty){
                            await profileController.uploadProfileImage();
                          }else{
                            profileController.profileImgLink = data['imageUrl'];
                          }
                          if( data['password'] == profileController.oldPasswordController.text){
                            await profileController.changeAuthPassword(
                                email: data['email'],
                                password: profileController.oldPasswordController.text,
                                newPassword: profileController.newPasswordController.text,
                                context: context
                            );
                            await profileController.updateProfile(
                                name: profileController.nameController.text,
                                password: profileController.newPasswordController.text,
                                imgUrl: profileController.profileImgLink
                            );
                            profileController.isLoading(false);
                            VxToast.show(context, msg: "Your data are updated");
                            Get.offAll(ProfileScreen());
                          }else{
                            VxToast.show(context, msg: "Wrong old password");
                            profileController.isLoading(false);
                          }
                        }else{
                          profileController.isLoading(false);
                        }
                      }
                  ),
                  10.heightBox,
                ],
              ).box.white.padding(EdgeInsets.all(18)).margin(EdgeInsets.symmetric(horizontal: 10)).roundedSM.shadowSm.make(),
            ),
          ) ),

    ));
  }
}
