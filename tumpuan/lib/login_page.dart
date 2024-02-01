import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tumpuan/screens/home.dart';
import 'package:tumpuan/services/tumpuanServices.dart';
import 'package:tumpuan/signUp/intro1.dart';
import 'package:tumpuan/utils/snackbar_helper.dart';

class LoginPage extends StatefulWidget {
  final Map? login;

  const LoginPage({super.key, this.login});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visible = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      // ignore: prefer_const_constructors
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tumpuan',
                style: TextStyle(
                    fontFamily: 'Brodies',
                    color: Color.fromRGBO(251, 111, 146, 1),
                    fontSize: 40),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //sign in button
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(251, 111, 146, 1))),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontFamily: 'Satoshi'),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              // register button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          color: Color.fromRGBO(251, 111, 146, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Intro1()));
                      // submitData();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> submitData() async {
    // submit data to the server
    final isSuccess = await TumpuanServices.Login(body);
    // show succes or fail message based on status

    if (isSuccess) {
      usernameController.text = '';
      passwordController.text = '';
      showSuccessMessage(context, message: 'Creation Success');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Intro1()));
    } else {
      showErrorMessage(context, message: 'Creation Error');
    }
    // print(response.statusCode);
  }

  Map get body {
    // get the data form

    final username = usernameController.text;
    final password = passwordController.text;

    return {
      "username": username,
      "password": password,
    };
  }
}
