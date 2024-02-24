// Login function
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/router/routes_names.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      print("user_cred $userCredential");
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("error ${e.code}");
      String message;
      switch (e.code) {
        case 'invalid-credential':
          message = 'Invalid credentials. Please try again.';
          break;
        case 'invalid-email':
          message = 'Please enter a valid email address.';
          break;
        case 'user-not-found':
          message = 'There is no account associated with this email.';
          break;
        case 'wrong-password':
          // Avoid revealing this specifically
          message =
              'There was a problem with your login credentials. Please try again.';
          break;
        case 'too-many-requests':
          message =
              'Too many requests. Please try again later or reset your password.';
          break;
        default:
          message = 'An error occurred. Please try again later.';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));
      return null;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Something went wrong. Please try again later."),
      ));
    }
  }

// Registration function
  Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print(e);
      return null;
    }
  }

// Logout function
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print(e);
    }
  }

// Reset password function

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      context.pushReplacement(SJMRoutes.emailSent);
    } on FirebaseAuthException catch (e) {
      print("error ${e.code}");
      // Handle errors gracefully, providing generic messages
      String message;
      switch (e.code) {
        case 'invalid-email':
          message = 'Please enter a valid email address.';
          break;
        case 'user-not-found':
          message = 'There is no account associated with this email.';
          break;
        default:
          message = 'An error occurred. Please try again later.';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
      )); // Display the error message to the user
    }
  }
}
