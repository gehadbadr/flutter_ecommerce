import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class Store {

    addProduct(Product product) async {
      await firestore.collection(KProductCollection).add({
        KProductName: product.pName,
        KProductCat: product.pCategory,
        KProductDesc: product.pDesc,
        KProductPrice: product.pPrice,
        KProductImg: product.pImg,
      });
    }

    Future<void> getData11() async {
      CollectionReference _collectionRef =
      await FirebaseFirestore.instance.collection('collection');
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await _collectionRef.get();

      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

      print(allData);
    }

    Future getDocs() async {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(KProductCollection).get();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        var a = querySnapshot.docs[i];
        print(a.id);
      }
    }

    Future<List> getProducts() async {
  /*    DocumentReference doc = await firestore.collection(KProductCollection).doc("2Uq2t4BexTDGcWGyMB3R");
      await doc.get().then((value){
        print(value.data());
      });*/
     List products = [];
     CollectionReference productsRef =
      firestore.collection(KProductCollection);
      await productsRef.get().then((value) {
        value.docs.forEach((element) {
          products.add(element.data()) ;
        });
      });
      return products;
    }

    editProduct(Product product, int id) async {
      await firestore.collection(KProductCollection).add({
        KProductName: product.pName,
        KProductCat: product.pCategory,
        KProductDesc: product.pDesc,
        KProductPrice: product.pPrice,
        KProductImg: product.pImg,
      });
    }


  }

