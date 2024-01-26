
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/services/store.dart';

class FirestoreServices {
  //get user data
  static getUser(uid){
    return firestore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }
}