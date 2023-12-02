import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tumpuan/login_page.dart';
import 'package:tumpuan/signUp/intro1.dart';
import 'package:tumpuan/signUp/question1.dart';
import 'package:tumpuan/signUpPage.dart';
import 'package:tumpuan/start_page.dart';
import 'package:tumpuan/styles/style.dart';

class Intro3 extends StatefulWidget {
  const Intro3({super.key});

  @override
  State<Intro3> createState() => _Intro3State();
}

class _Intro3State extends State<Intro3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Image(image: AssetImage('images/intro3.png')),
            SizedBox(height: 15),
            Text(
              'For Awareness to Action',
              style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.bold,
                  color: AppColors.pink1,
                  fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Tumpuan App Bridges Gaps, Advocates for\nWomen\'s Rights and Well-being.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Satoshi',
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15),
            ),
            SizedBox(height: 100),
            DotsIndicator(
              dotsCount: 3,
              position: 2,
              decorator: DotsDecorator(
                color: AppColors.bg1,
                activeColor: AppColors.pink1,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 7.0),
                  child: Container(
                    width: 95,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(fontFamily: 'Satoshi'),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(251, 111, 146, 1))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Container(
                    width: 95,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpPage()));
                      },
                      child: Text(
                        'Let\'s Start',
                        style: TextStyle(fontFamily: 'Satoshi'),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(251, 111, 146, 1))),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
