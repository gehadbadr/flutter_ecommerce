import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  var isLoading = false.obs;
  //SignUp Method

  Future<UserCredential?>signupMehtod({email,password,context,name})async{
    UserCredential? userCredential;
    try{
      userCredential= await auth.createUserWithEmailAndPassword(email: email, password: password);
      storeUserData(name:name,email: email, password: password,context: context);
    }on FirebaseAuthException catch(e){
      if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("Email is invalid")));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(
                "this email is already  registered ")));
      } else if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("Password is weak ")));
      }
    }
    return userCredential;
  }
  //Login Method
  Future<UserCredential?>loginMehtod({email,password,context})async{
    UserCredential? userCredential;
    try{
      userCredential= await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomePage());

    }on FirebaseAuthException catch(e){
      if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Email is invalid")));
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("This email is not found ")));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Wrong Password ")));
      }    }
    return userCredential;
  }

  //Add User
  storeUserData({name,password,email,context})async{
    DocumentReference store = firebase.collection(usersCollection).doc(currentUser!.uid);
    store.set({'name':name,'password':password,'email':email,'imageUrl':'','id':currentUser!.uid,'order_count':'00','wishlist_count':'00','cart_count':'00'});
    VxToast.show(context, msg:"you register successfully");
    Get.offAll(HomePage());
  }

  signoutMethod(context)async{
    try{
      auth.signOut();
     // Get.offAll(LoginScreen());
    }catch (e){
      VxToast.show(context, msg: e.toString());
    }

  }
}