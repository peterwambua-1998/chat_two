import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_chat/modals/user_modal.dart';
import '../firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService with ChangeNotifier {
 final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModal? myUserProp;

  Future signInAnon() async {
    try {
      var userCredential = await _auth.signInAnonymously();
      myUserProp = _userFromFireBase(userCredential.user!.displayName,
          userCredential.user!.uid, userCredential.user!.email);
      notifyListeners();
      return myUserProp;
    } on FirebaseAuthException catch (e) {
      print('error===${e.toString()}');
      myUserProp = null;
        notifyListeners();
      return null;
    }
  }

  // auth change user stream
  AuthService myUser() {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        myUserProp = null;
        notifyListeners();
      } else {
        myUserProp = _userFromFireBase(user.displayName, user.uid, user.email);
        notifyListeners();
      }
    });

    return this;
  }

  // sign in with email and password
  Future signInWithEmail(String email, String password) async {
    try {
      // 1. make request to firebase
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user != null) {
        myUserProp = _userFromFireBase(user.displayName, user.uid, user.email);
        notifyListeners();
      } else {
        myUserProp = null;
        notifyListeners();
      }
    } catch (e) {
      print('sign in error ==== ${e.toString()}');
      myUserProp = null;
      notifyListeners();
      return null;
    }
  }
  

  // register with email and password
  Future registerWithEmail(String email, String password) async {
    try {
      // 1. make request to firebase
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user != null) {
        myUserProp = _userFromFireBase(user.displayName, user.uid, user.email);
        notifyListeners();
      } else {
        myUserProp = null;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
      myUserProp = null;
      notifyListeners();
      return null;
    }
  }

  // sign out;
  Future signOut() async {
    try {
      await _auth.signOut();
      myUserProp = null;
      notifyListeners();
      return myUserProp;
    } catch (e) {
      print(e.toString());
    }
  }

  // create user object based on firebase user return user
  UserModal? _userFromFireBase(String? name, String? uid, String? email) {
    UserModal? user = UserModal(id: uid, name: name, email: email);
    return user;
  }
}