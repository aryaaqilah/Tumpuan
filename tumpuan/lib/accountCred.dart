import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tumpuan/signUp/bridgetoQ.dart';
import 'package:tumpuan/start_page.dart';
import 'package:tumpuan/styles/style.dart';

class AccountCred extends StatefulWidget {
  const AccountCred({super.key});

  @override
  State<AccountCred> createState() => _AccountCredState();
}

class _AccountCredState extends State<AccountCred> {
  @override
  TextEditingController dateInputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
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
                        'Account Credentials',
                        style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildTextField(
                    controller: emailController,
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  //password
                  buildTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 200),
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
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(251, 111, 146, 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const BridgetoQ(),
                                ));
                              }
                            },
                            child: const Text(
                              'Save & Next',
                              style: TextStyle(color: Colors.white),
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
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    String? Function(String?)? validator,
    Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        obscureText: hintText == 'Password' ? true : false,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: hintText == 'Password'
              ? Icon(Icons.remove_red_eye_outlined)
              : null,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: validator,
        onTap: onTap,
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
