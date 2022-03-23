import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> addUser(
    {required name, required email, required year, required branch}) async {
  await Firebase.initializeApp();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  await users.doc(email).set(
    {'name': name, 'year': year, 'branch': branch, 'isAdmin': false},
  );
}
