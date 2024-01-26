import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget customTextField({String? title,String? hint,controller,isPass,onClick}) {
  //final  Function(String?)? onClick;
  String? errorMessage(String str){

    switch(hint){
      case 'Name' :return'Name is required' ;
      case 'admin@admin.com' :return'Email is required' ;
      case 'Password' :return'Password is required' ;
      case 'RePassword' :return'RePassword is required ' ;
    }
  }

  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.heightBox,
        title!.text.fontFamily(semibold).color(redColor).size(16).make(),
        5.heightBox,
        TextFormField(
          validator: (value){
            if(value!.isEmpty){return errorMessage(hint);}
          },
          onSaved: onClick,
          obscureText: isPass,
          controller: controller,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontFamily: semibold,
              color: textfieldGrey
            ),
          hintText: hint!,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: redColor))),
    ),
        5.heightBox,

      ]);
}
