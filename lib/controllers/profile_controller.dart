import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


class ProfileController extends GetxController{
  var profileImgPath = ''.obs;
  var profileImgLink = '';
  var nameController =TextEditingController();
  var oldPasswordController =TextEditingController();
  var newPasswordController =TextEditingController();
  var isLoading = false.obs;

  changeImage(context)async{
    try{
      final img = await ImagePicker().pickImage(source: ImageSource.gallery ,imageQuality: 70);
      if(img == null){
        return;
      }else{
        profileImgPath.value =img.path;
      }
    }on PlatformException catch (e){
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage()async{
    var filename = basename(profileImgPath.value);
    var path = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(path);
    await ref.putFile(File(profileImgPath.value));
    profileImgLink = await ref.getDownloadURL();
  }

  updateProfile({name,password,imgUrl})async{
    var store = firebase.collection(usersCollection).doc(currentUser!.uid);
    await store.set({'name': name,'password': password,'imageUrl': imgUrl},SetOptions(merge: true));
  }

  changeAuthPassword({email,password,newPassword,context})async{
    final credential= EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(credential).then((value){
      currentUser!.updatePassword(newPassword);
    }).catchError((error){
      VxToast.show(context, msg: error.toString());
    });
 //   await store.set({'name': name,'password': password,'imageUrl': imgUrl},SetOptions(merge: true));
  }


}