import 'package:flutter/material.dart';
import 'package:tumpuan/screens/home.dart';
import 'package:tumpuan/screens/navScreen.dart';
import 'package:tumpuan/services/tumpuanServices.dart';
import 'package:tumpuan/signUp/intro1.dart';
import 'package:tumpuan/utils/snackbar_helper.dart';

class LoginPage extends StatefulWidget {
  final Map? login;

  const LoginPage({Key? key, this.login}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = false; // Added to track password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: SafeArea(
        child: Form(
          key: _formKey,
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
                const SizedBox(height: 40),
                buildTextField(
                  controller: usernameController,
                  hintText: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),

                const SizedBox(
                  height: 20,
                ),
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
                  obscureText:
                      obscurePassword, // Pass the obscurePassword value
                  onTap: () {
                    setState(() {
                      obscurePassword =
                          !obscurePassword; // Toggle obscurePassword value
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                //sign in button
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ));
                      }
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
                  height: 15,
                ),
                // register button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                            color: Color.fromRGBO(251, 111, 146, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Intro1()));
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // The rest of your code remains unchanged
  // ...

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    String? Function(String?)? validator,
    Function()? onTap,
    bool? obscureText, // Add the obscureText parameter
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        obscureText: obscureText ??
            true, // Set obscureText based on the parameter or default to false
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: hintText == 'Password'
              ? IconButton(
                  icon: Icon(
                    obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: onTap as void Function()?,
                )
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
