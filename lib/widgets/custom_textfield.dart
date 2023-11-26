import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final  Function(String?)? onClick;
  String? _errorMessage(String str){

    switch(hint){
      case 'Enter your name' :return'Name is empty' ;
      case 'Enter your email' :return'Email is empty' ;
      case 'Product Name':return'Product Name is empty' ;
      case 'Product Price':return'Product Price is empty' ;
      case 'Product Description' :return'Product Description is empty' ;
      case 'Product Category' :return'Product Category is empty' ;
      case 'Product Image' :return'Product Image is empty' ;
      case 'Enter your password' :return'Password is empty' ;
      case 'Enter your password' :return'Password is empty' ;

    }
  }

  CustomTextField({/*super.key,*//*required*/ this.onClick,required this.hint, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            //return'Name is empty' ;
            return _errorMessage(hint);
          }
         // print(onClick);
        },
        onSaved: onClick,
        obscureText: hint == 'Enter your password'? true:false,
        cursorColor: kMainColor,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: kMainColor,
          ),
          filled: true,
          fillColor: kSecondaryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
