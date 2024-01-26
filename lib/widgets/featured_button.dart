import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget featuredButton({image,String? title}){
  return Row(
    children: [
      Image.asset(image, width:60,fit: BoxFit.fill,),
      10.widthBox,
      title!.text.color(darkFontGrey).fontFamily(semibold).make()
    ],
  ).box.width(200).margin(EdgeInsets.symmetric(horizontal: 4)).padding(EdgeInsets.all(4)).roundedSM.outerShadow.white.make();
}