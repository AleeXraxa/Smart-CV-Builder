import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Login User

  Future<void> loginUser() async {
    String email = emailController.text.trim();
    String pass = passController.text;

    if (email.isEmpty || pass.isEmpty) {
      Get.snackbar('Login Failed', 'Please fill both fields');
      return;
    }

    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: pass);

      Get.snackbar('Login Successfully', 'Welcome Dear User');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login Failed', '$e');
    } catch (e) {
      Get.snackbar('Login Failed', 'Something went wrong');
    }
  }

  // User Registration with Email and Password

  Future<void> registerUser() async {
    String email = emailController.text.trim();
    String pass = passController.text;

    if (email.isEmpty || pass.isEmpty) {
      Get.snackbar('Login Failed', 'Please fill both fields');
      return;
    }

    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: pass);
      Get.snackbar(
          'Registration Successfully', 'Your account has been created');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login Failed', '$e');
    } catch (e) {
      Get.snackbar('Login Failed', 'Something went wrong');
    }
  }
}
