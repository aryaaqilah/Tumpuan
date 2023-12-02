import 'package:flutter/material.dart';
import 'package:tumpuan/login_page.dart';
import 'package:tumpuan/signUp/question1.dart';
import 'package:tumpuan/signUpPage.dart';

class AllSetPage extends StatefulWidget {
  const AllSetPage({super.key});

  @override
  State<AllSetPage> createState() => _AllSetPageState();
}

class _AllSetPageState extends State<AllSetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Image(image: AssetImage('images/allset.png')),
            SizedBox(height: 50),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontFamily: 'Satoshi'),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(251, 111, 146, 1))),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
