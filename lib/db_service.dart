import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract class DBService with ChangeNotifier {
  final firestore = Firestore.instance;

  Future addUser(email, password) async {
    try {
      await firestore
          .collection('users')
          .add({
            "email": email,
            "password": password,
            "timestamp": Timestamp.now()
          })
          .then((value) => print('add ${value.documentID}'))
          .catchError((e) => print(e));
    } catch (e) {}
  }

  Future getUser(id) async {
    try {
      var result = await firestore.collection('users').document(id);
      notifyListeners();
      return result;
    } catch (e) {
      print(e);
    }
  }
}
