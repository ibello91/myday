import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthService> authServiceNotifier = ValueNotifier(AuthService());

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => FirebaseAuth.instance.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

Future<void> resetPassword(String email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  } on FirebaseAuthException catch (e) {
    throw Exception(e.message);
  }
}

Future<void> updateUsername(String newUsername) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.updateDisplayName(newUsername);
      await user.reload();
    }
  } on FirebaseAuthException catch (e) {
    throw Exception(e.message);
  }
}

Future<void> deleteAccount() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.delete();
    }
  } on FirebaseAuthException catch (e) {
    throw Exception(e.message);
  }
}
