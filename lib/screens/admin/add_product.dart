
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/admin_home.dart';
import 'package:ecommerce/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/services/store.dart';

class AddProduct extends StatelessWidget {
  static String id = 'AddProduct';
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _store = Store();
  String? _name,_price,_desc,_category,_img;
 // AddProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kMainColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(hint:'Product Name',icon: Icons.production_quantity_limits_sharp,onClick:(value){_name=value;}),
              SizedBox(height:20),
              CustomTextField(hint:'Product Category',icon: Icons.production_quantity_limits_sharp,onClick:(value){_category=value;}),
              SizedBox(height:20),
              CustomTextField(hint:'Product Description',icon: Icons.production_quantity_limits_sharp,onClick:(value){_desc=value;}),
              SizedBox(height:20),
              CustomTextField(hint:'Product Price',icon: Icons.production_quantity_limits_sharp,onClick:(value){_price=value;}),
              SizedBox(height:20),
              CustomTextField(hint:'Product Image',icon: Icons.production_quantity_limits_sharp,onClick:(value){_img=value;}),
              SizedBox(height:20),
              ElevatedButton(onPressed: ()async{
               if(_globalKey.currentState!.validate()){
                 _globalKey.currentState!.save();
                 await _store.addProduct(Product(
                   pName: _name,
                   pCategory: _category,
                   pDesc: _desc,
                   pPrice: _price,
                   pImg: _img,
                 ));
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product is added successfully")));
                 Navigator.pushNamed(context, AdminHome.id);

                 print("addddddddddd");
               }
              }, child:Text('Add Product'))

            ],
          ),
        ),
      ),
    );
  }
}
