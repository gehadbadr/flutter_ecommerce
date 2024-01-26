
import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget homeButton({height ,width ,icon ,String? title,onPress}){
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon,width: 26,),
        10.heightBox,
        title!.text.color(darkFontGrey).fontFamily(semibold).make()

      ],
    ),
  ).box.shadowSm.rounded.white.size(width,height).make();
}