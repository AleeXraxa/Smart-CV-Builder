import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cv_builder/Modules/Authentication/Model/login.dart';

import '../Controller/authController.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _authController = Get.find<Authcontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Create Account'),
            SizedBox(height: 10),
            TextField(
              controller: _authController.emailController,
              decoration: InputDecoration(
                label: Text('Enter Email'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _authController.passController,
              decoration: InputDecoration(
                label: Text('Enter Password'),
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _authController.registerUser();
                },
                child: Text('Register')),
            ElevatedButton(
                onPressed: () {
                  Get.to(Login());
                },
                child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
