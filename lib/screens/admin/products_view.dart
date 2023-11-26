import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/screens/admin/edit_product.dart';
import 'package:ecommerce/services/store.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  // Products({super.key});
  final store = Store();
  static String id = 'Products';

  @override

  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override

   List products = [];


  getProducts() async {
    CollectionReference productsRef =
    firestore.collection(KProductCollection);
    await productsRef.get().then((value) {
      value.docs.forEach((element) {
        setState(() {
          products.add(element.data()) ;
        });
      });
    });
   // return products;
  }

  void initState(){
    getProducts();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainColor,
        body:ListView.builder(itemCount: products.length,itemBuilder: (context , i){
          return GestureDetector(
            onTap: (){Navigator.pushNamed(context,EditProduct.id/*+'/'+products[i][uid]*/) ;},
            child: ListTile(title: Text('Product name :${products[i][KProductName]}'),
            subtitle: Text('Cat name :${products[i][KProductCat]}'/*/products[i][uid]*/)),
          );
        })
    );

  }
}

