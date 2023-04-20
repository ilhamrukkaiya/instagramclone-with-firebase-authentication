import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instlogin/Screen/login_screen.dart';
import 'package:instlogin/Screen/signup_screen.dart';

import '../models/user.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ignore: non_constant_identifier_names
  Future<String> SignUpuser({
    required String name,
    required String email,
    required String password,
  }) async {
    String res = "some error occured";
    try {
      if (name.isNotEmpty || email.isNotEmpty || password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);
        _firestore.collection("user").doc(cred.user!.uid).set({
          "name": name,
          "uid": cred.user!.uid,
          "email": email,
          "follower": [],
          "following": []
        });
        res = "succes";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalied email") {
        res = "the email is badly formated.";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> Loginuser({
    required String email,
    required String password,
  }) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter a valid field";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<Users> getUserDetails() async {
    User CurrentUser = await _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(CurrentUser.uid).get();
   return Users.fromSnap(documentSnapshot);
    
  }

  Future<void> signout() async {
    await _auth.signOut();
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
