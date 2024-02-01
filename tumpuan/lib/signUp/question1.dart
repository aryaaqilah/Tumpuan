import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tumpuan/components/checkBoxSignUp.dart';
import 'package:tumpuan/signUp/question2.dart';
import 'package:tumpuan/start_page.dart';
import 'package:tumpuan/styles/style.dart';

class Question1 extends StatefulWidget {
  const Question1({super.key});

  @override
  State<Question1> createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  @override
  TextEditingController dateInputController = TextEditingController();
  List<Map<String, dynamic>> checkListItems = [
    {"id": 0, "selected": false, "title": 'My cycle is regular'},
    {"id": 1, "selected": false, "title": 'My cycle is irregular'},
    {"id": 2, "selected": false, "title": 'I don\'t know'},
  ];
  @override
  Widget build(BuildContext context) {
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
                // Padding(
                //   padding: const EdgeInsets.only(left: 25.0),
                //   child: Align(
                //       alignment: Alignment.bottomLeft,
                //       child:
                //           Image(image: AssetImage('images/progressbar3.png'))),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LinearPercentIndicator(
                    // width: ,
                    lineHeight: 3.0,
                    percent: 0.2,
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
                      'Question 1',
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w900,
                          fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(height: 100),

                const Text(
                  'Is your menstrual cycle regular\n(varies by no more 7 days) ?',
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

                const SizedBox(height: 150),
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
                                  builder: (context) => const Question2()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // SizedBox(
                //   height: 15,
                // ),
                // // register button
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Have An Account?',
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     ),
                //     TextButton(
                //       child: const Text(
                //         'Login Here',
                //         style: TextStyle(
                //             color: Color.fromRGBO(251, 111, 146, 1),
                //             fontWeight: FontWeight.bold),
                //       ),
                //       onPressed: () {
                //         Navigator.of(context).pushReplacement(MaterialPageRoute(
                //             builder: (context) => LoginPage()));
                //       },
                //     )
                //   ],
                // ),
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
