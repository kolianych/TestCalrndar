import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_zadach/generated/l10n.dart';

//класс авторизации в Firebase
class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        if (e.code == 'email-already-in-use') {
          showToast(context, S.of(context).theEmailAddressIsAlreadyInUse);
        } else {
          showToast(context, S.of(context).anErrorOccurredE(e.code));
        }
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          showToast(context, S.of(context).invalidEmailOrPassword);
        } else {
          showToast(context, S.of(context).anErrorOccurredE(e.code));
        }
      }
    }
    return null;
  }

  void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
