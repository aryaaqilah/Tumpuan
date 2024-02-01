import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import 'package:tumpuan/components/checkBoxSignUp.dart';
import 'package:tumpuan/signUp/question4.dart';
import 'package:tumpuan/start_page.dart';
import 'package:tumpuan/styles/style.dart';

class Question3 extends StatefulWidget {
  const Question3({super.key});

  @override
  State<Question3> createState() => _Question3State();
  
}

class _Question3State extends State<Question3> {
  @override
  TextEditingController dateInputController = TextEditingController();
  List<Map<String, dynamic>> checkListItems = [
    {"id": 0, "selected": false, "title": 'No, I sleep well'},
    {"id": 1, "selected": false, "title": 'Difficulty falling asleep'},
    {"id": 2, "selected": false, "title": 'Waking up tired'},
    {"id": 3, "selected": false, "title": 'Waking up during the night'},
    {"id": 4, "selected": false, "title": 'Lack of sleep schedule'},
    {"id": 5, "selected": false, "title": 'Insomnia'},
    {"id": 6, "selected": false, "title": 'Other'},
  ];
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
                  elevation: 0,
                  backgroundColor: Colors.transparent,
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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LinearPercentIndicator(
                    // width: ,
                    lineHeight: 3.0,
                    percent: 0.6,
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
                      'Question 3',
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w900,
                          fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Is there anything you want to\nimprove about your sleep?',
                  style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        checkListItems.length,
                        (index) => LabeledCheckboxExample(
                          sentences: checkListItems[index]["title"],
                          value: checkListItems[index]["selected"],
                          onChanged: (value) {
                            setState(() {
                              for (var i = 0; i < checkListItems.length; i++) {
                                if (i == index) {
                                  checkListItems[i]["selected"] = true;
                                } else {
                                  checkListItems[i]["selected"] = false;
                                }
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
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
                              'Save & Next',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Question4()));
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

class LabeledCheckboxExample extends StatelessWidget {
  final String sentences;
  final bool? value;
  final ValueChanged<bool?>? onChanged;

  const LabeledCheckboxExample({
    required this.sentences,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.bg1, borderRadius: BorderRadius.circular(10)),
          child: CheckboxListTile(
            // controlAffinity: ListTileControlAffinity.leading,
            // contentPadding: EdgeInsets.zero,
            dense: true,
            title: Text(
              sentences,
              style: const TextStyle(
                  fontSize: 16.0, color: Colors.black, fontFamily: 'Satoshi'),
            ),
            value: value,
            onChanged: onChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Optionally
              side: const BorderSide(color: Colors.pink),
            ),
            activeColor: const Color.fromRGBO(251, 111, 146, 1),
            checkboxShape: CircleBorder(),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
