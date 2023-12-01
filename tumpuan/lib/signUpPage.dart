import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tumpuan/login_page.dart';
import 'package:tumpuan/styles/style.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  TextEditingController dateInputController = TextEditingController();
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
                SizedBox(height: 10),
                AppBar(
                  toolbarHeight: 70,
                  backgroundColor: AppColors.bg1,
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        ))
                  ],
                  title: Align(
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
                SizedBox(height: 40),
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
                    percent: 0.33,
                    backgroundColor: Colors.grey,
                    progressColor: AppColors.pink1,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Personal Detail',
                      style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'First and Middle Name',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Last Name',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Birth Date',
                            suffixIcon: Icon(Icons.calendar_month)),
                        controller: dateInputController,
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2050));

                          if (pickedDate != null) {
                            dateInputController.text =
                                DateFormat('dd MMMM yyyy').format(pickedDate);
                          }
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                //password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            suffixIcon: Icon(Icons.remove_red_eye_outlined)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(),
                        hint: Text('Gender'),
                        items: <String>['Female', 'Male'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: 100,
                    // padding: EdgeInsets.only(left: 0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(251, 111, 146, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextButton(
                        child: const Text(
                          'Save & Next',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
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
