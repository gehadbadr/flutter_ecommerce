
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth =FirebaseAuth.instance;
FirebaseFirestore firebase =FirebaseFirestore.instance;
const  usersCollection = "users";
User? currentUser= auth.currentUser;
