import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  final auth = FirebaseAuth.instance;

  Future signInAnonimouslyHandle() async {
    try {
      await auth
          .signInAnonymously()
          .then(
            (value) => print('success sign in'),
          )
          .catchError((e) => print(e));
    } catch (e) {
      print(e);
    }
  }

  Future signOutAnonimouslyHandle() async {
    try {
      await auth
          .signOut()
          .then((value) => print('success sign out'))
          .catchError((e) => print(e));
    } catch (e) {
      print(e);
    }
  }

  Future signInWithEmailAndPasswordHandle(email, password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => print('success sign in'))
          .catchError((e) => print(e));
    } catch (e) {
      print(e);
    }
  }

  Future registerWithEmailAndPasswordHandle(email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => print('success register'))
          .catchError((e) => print(e));
    } catch (e) {
      print(e);
    }
  }

  getCurrentUser() async {
    return await auth.currentUser();
  }
}
