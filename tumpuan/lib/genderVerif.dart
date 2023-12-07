import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tumpuan/accountCred.dart';
import 'package:tumpuan/start_page.dart';
import 'package:tumpuan/styles/style.dart';

class GenderVerifPage extends StatefulWidget {
  const GenderVerifPage({super.key});

  @override
  State<GenderVerifPage> createState() => _GenderVerifPageState();
}

class _GenderVerifPageState extends State<GenderVerifPage> {
  @override
  TextEditingController dateInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
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
                  backgroundColor: AppColors.bg1,
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                        onPressed: () {
                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //         builder: (context) => StartPage()));
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
                    percent: 0.67,
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
                      'Gender Verification',
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                IconButton(
                  icon: Image.asset('images/ktp.png'),
                  iconSize: 300,
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Make sure to take a clear picture of your ID',
                      style: TextStyle(fontFamily: 'Satoshi', fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //sign in button
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
                              builder: (context) => const AccountCred()));
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
