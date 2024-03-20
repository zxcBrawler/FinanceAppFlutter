import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');
}
