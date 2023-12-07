import 'package:flutter/material.dart';
import 'package:tumpuan/login_page.dart';
import 'package:tumpuan/signUp/intro1.dart';

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
            const Text(
              'Tumpuan',
              style: TextStyle(
                  fontFamily: 'Brodies',
                  color: Color.fromRGBO(251, 111, 146, 1),
                  fontSize: 40),
            ),
            const Text(
              'Tempat Untuk Menguatkan Perempuan',
              style: TextStyle(
                  fontFamily: 'Satoshi',
                  color: Color.fromRGBO(251, 111, 146, 1),
                  fontSize: 13),
            ),
            const SizedBox(height: 200),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const LoginPage()));
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
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const Intro1()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(251, 111, 146, 1))),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontFamily: 'Satoshi'),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
