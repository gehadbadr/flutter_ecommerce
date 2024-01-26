import 'package:flutter/material.dart';
import 'package:ecommerce/consts/consts.dart';

Widget cardDetails({String? count ,String? title,width}){

  return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            count!.text.color(darkFontGrey).fontFamily(bold).size(16).make(),
            5.heightBox,
            title!.text.white.color(darkFontGrey).fontFamily(semibold).make(),
          ],).box.white.roundedSM.width(width).height(80).padding(EdgeInsets.all(4)).make()

  ;
}