import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/admin_home.dart';
import 'package:ecommerce/services/store.dart';
import 'package:ecommerce/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';


class EditProduct extends StatelessWidget {
  // EditProduct({super.key});
  static String id = 'EditProduct';
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String? _name,_price,_desc,_category,_img;
  final _store = Store();
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product is updated successfully")));
                  Navigator.pushNamed(context, AdminHome.id);
                  print("egittttttt");
                }
              }, child:Text('Update Product')),
              ElevatedButton(onPressed: ()async{
                _store.getProducts();
               print("ch");
              }, child: Text("test"))

            ],
          ),
        ),
      ),
    );
  }
}
