import 'package:flutter/material.dart';
import 'package:tumpuan/components/checkBoxSignUp.dart';
import 'package:tumpuan/screens/HomePage.dart';
import 'package:tumpuan/screens/home.dart';
import 'package:tumpuan/signUp/question2.dart';
import 'package:tumpuan/start_page.dart';
import 'package:tumpuan/styles/style.dart';

class DailyQuiz extends StatefulWidget {
  const DailyQuiz({Key? key}) : super(key: key);

  @override
  State<DailyQuiz> createState() => _DailyQuizState();
}

class _DailyQuizState extends State<DailyQuiz> {
  TextEditingController dateInputController = TextEditingController();
  List<Map<String, dynamic>> checkListItems = [
    {"id": 0, "selected": false, "title": 'My cycle is regular'},
    {"id": 1, "selected": false, "title": 'My cycle is irregular'},
    {"id": 2, "selected": false, "title": 'I don\'t know'},
    {"id": 3, "selected": false, "title": 'I don\'t know'},
  ];

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar();
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                  toolbarHeight: 70,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Is your menstrual cycle regular\n(varies by no more 7 days) ?',
                        style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                checkListItems.length,
                                (index) => LabeledCheckboxExample(
                                  sentences: checkListItems[index]["title"],
                                  value: checkListItems[index]["selected"],
                                  onChanged: (value) {
                                    setState(() {
                                      for (var i = 0;
                                          i < checkListItems.length;
                                          i++) {
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
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(251, 111, 146, 1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: TextButton(
                                      child: const Text(
                                        'Save & Next',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        // Perform action based on selected option
                                        // For example, navigate to the next page
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => const Home(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
