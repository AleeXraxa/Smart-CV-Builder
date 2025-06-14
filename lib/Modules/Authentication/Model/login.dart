import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cv_builder/Modules/Authentication/Controller/authController.dart';
import 'package:smart_cv_builder/Modules/Authentication/Model/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _authController = Get.find<Authcontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Login'),
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
                  _authController.loginUser();
                },
                child: Text('Login')),
            ElevatedButton(
                onPressed: () {
                  Get.to(Register());
                },
                child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
