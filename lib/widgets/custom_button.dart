import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget customButton({Color? bgColor,Color? textColor,String? title, onPress}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor!,
        padding: EdgeInsets.all(12)
      ),
      onPressed:onPress,
      child: title!.text.color(textColor).fontFamily(bold).make());
}
