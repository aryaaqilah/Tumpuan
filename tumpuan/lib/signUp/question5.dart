import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tumpuan/components/checkBoxSignUp.dart';
import 'package:tumpuan/signUp/allSetPage.dart';
import 'package:tumpuan/start_page.dart';
import 'package:tumpuan/styles/style.dart';

class Question5 extends StatefulWidget {
  const Question5({super.key});

  @override
  State<Question5> createState() => _Question5State();
}

class _Question5State extends State<Question5> {
  @override
  TextEditingController dateInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sentences = [
      'No, I sleep well',
      'Difficulty falling asleep',
      'Waking up tired',
      'Waking up during the night',
      'Lack of sleep schedule',
      'Insomnia',
      'Other'
    ];

    final sentences2 = [
      'Painful menstrual cramps',
      'PMS symptoms',
      'Unusual discharge',
      'Heavy menstrual flow',
      'Mood Swings',
      'Other',
      'No, nothings bother me'
    ];

    final sentences3 = [
      'None',
      'Lose weight',
      'Gain weight',
      'Maintain healthy weight',
      'Start exercising',
      'Learn about nutrition',
      'Get more energy',
      'Other'
    ];

    return Scaffold(
      backgroundColor: AppColors.bg,
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                AppBar(
                  toolbarHeight: 70,
                  backgroundColor: AppColors.bg,
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                        onPressed: () {
                          _showCloseDialog(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ))
                  ],
                  title: const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Tumpuan',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Brodies',
                          color: Color.fromRGBO(251, 111, 146, 1),
                          fontSize: 40),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LinearPercentIndicator(
                    // width: ,
                    lineHeight: 3.0,
                    percent: 1,
                    backgroundColor: Colors.grey,
                    progressColor: AppColors.pink1,
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Question 5',
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w900,
                          fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'What\'s your fitness goal?',
                  style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: sentences3
                        .map((sentence) => Column(
                              children: [
                                LabeledCheckboxExample(sentences: sentence),
                                const SizedBox(height: 7)
                              ],
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        width: 100,
                        // padding: EdgeInsets.only(left: 0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(251, 111, 146, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: TextButton(
                            child: const Text(
                              'Back',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        width: 100,
                        // padding: EdgeInsets.only(left: 0),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(251, 111, 146, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: TextButton(
                            child: const Text(
                              'Finish',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AllSetPage()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _showCloseDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // title: Text(
        //   'Canceling Registration?',
        //   style: TextStyle(fontFamily: 'Satoshi'),
        // ),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Image(image: AssetImage('images/cancelRegist.png')),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppColors.pink1),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Yes', style: TextStyle(color: AppColors.pink1)),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const StartPage()),
              );
            },
          ),
        ],
      );
    },
  );
}
