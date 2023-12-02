import 'package:flutter/material.dart';
import 'package:tumpuan/login_page.dart';
import 'package:tumpuan/signUp/intro1.dart';
import 'package:tumpuan/signUpPage.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tumpuan',
              style: TextStyle(
                  fontFamily: 'Brodies',
                  color: Color.fromRGBO(251, 111, 146, 1),
                  fontSize: 40),
            ),
            Text(
              'Tempat Untuk Menguatkan Perempuan',
              style: TextStyle(
                  fontFamily: 'Satoshi',
                  color: Color.fromRGBO(251, 111, 146, 1),
                  fontSize: 13),
            ),
            SizedBox(height: 200),
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
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Intro1()));
                },
                child: Text(
                  'Sign Up',
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
