import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/core/errors/exception.dart';

class FirebaseServices {
    Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseServices.createUserWithEmailAndPassword ${e.toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomeException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomeException(message: 'This email is already registered.');
      } else if (e.code == 'network-request-failed') {
        throw CustomeException(message: 'Please check your internet connection.');
      } else {
        throw CustomeException(message: 'An error occurred. Please try again.');
      }
    } catch (e) {
      log("Exception in FirebaseServices.createUserWithEmailAndPassword");
      throw CustomeException(message: 'An error occurred. Please try again.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseServices.signInWithEmailAndPassword ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomeException(message: 'Incorrect email or password.');
      } else if (e.code == 'wrong-password') {
        throw CustomeException(message: 'Incorrect email or password.');
      } else if (e.code == 'network-request-failed') {
        throw CustomeException(message: 'Please check your internet connection.');
      } else {
        throw CustomeException(message: 'An error occurred. Please try again.');
      }
    } catch (e) {
      log("Exception in FirebaseServices.signInWithEmailAndPassword");
      throw CustomeException(message: 'An error occurred. Please try again.');
    }
  }
}
