import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Apis {
  static FirebaseAuth auth = FirebaseAuth.instance;

  // For accessing cloud firestore database

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  
}