import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/screens/admin/add_product.dart';
import 'package:ecommerce/screens/admin/edit_product.dart';
import 'package:ecommerce/screens/admin/products_view.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});
  static String id = 'AdminHome';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: kMainColor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
             SizedBox(width:double.infinity),
              ElevatedButton(
                onPressed: () { Navigator.pushNamed(context, AddProduct.id); },
                child:  Text('Add product'),
              ),
              ElevatedButton(
                onPressed: () { Navigator.pushNamed(context, Products.id); },
                child:  Text('All product'),
              ),
              SizedBox(height:20),
              ElevatedButton(
                onPressed: () { Navigator.pushNamed(context, EditProduct.id);  },
                child:  Text('Edit product'),
              ),
              SizedBox(height:20),

              ElevatedButton(
                onPressed: () {  },
                child:  Text('Remove product'),
              ),

          ],),
        );
  }
}
