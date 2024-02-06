import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:our_chat/models/chat_user.dart';

class Apis {
  static FirebaseAuth auth = FirebaseAuth.instance;

  // For accessing cloud firestore database

  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User get user => auth.currentUser!;

// for cheaking if user exists or not
  static Future<bool> userExists() async {
    return (await firestore.collection('user').doc(user.uid).get()).exists;
  }

// for creating a new user
  static Future<void> createtoUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final chatUser = ChatUser(
        id: user.uid,
        name: user.displayName.toString(),
        email: user.email.toString(),
        about: "Hey, I'm using Our Chat!",
        image: user.photoURL.toString(),
        createdAt: time,
        isOnline: false,
        lastActive: time,
        pushToken: '');

    return await firestore
        .collection('user')
        .doc(user.uid)
        .set(chatUser.toJson());
  }
}
