import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tumpuan/screens/home.dart';
import 'package:tumpuan/screens/navScreen.dart';
import 'package:tumpuan/screens/mapScreen.dart';
import 'package:tumpuan/services/auth_service.dart';
import 'package:tumpuan/services/tumpuanServices.dart';
import 'package:tumpuan/signUp/intro1.dart';
import 'package:tumpuan/utils/snackbar_helper.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp_share/whatsapp_share.dart';
import 'package:whatsapp_sender_flutter/whatsapp_sender_flutter.dart';
import 'package:whatsapp/whatsapp.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

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
  WhatsApp whatsapp = WhatsApp();
  String? _currentAddress;
  Position? _currentPosition;

  void initState() {
    super.initState();
    getData();
  }

  List<dynamic> dataMore = [];

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
                  obscureText: false,
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
                    onPressed:
                        // if (_formKey.currentState!.validate()) {
                        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (context) => const MainScreen(),
                        //   ));
                        // }
                        doLogin,
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
                        onPressed: location
                        // share
                        // () {
                        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //       builder: (context) => const Intro1()));
                        // },
                        //     () {
                        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //       builder: (context) => MapScreen()));
                        // },
                        )
                  ],
                ),
                Text('LAT: ${_currentPosition?.latitude ?? ""}'),
                Text('LNG: ${_currentPosition?.longitude ?? ""}'),
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

  doLogin() async {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      final username = usernameController.text;
      final password = passwordController.text;

      bool isSuccess =
          await AuthService().login(username: username, password: password);

      if (!isSuccess) {
        print(isSuccess);
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ));
      }
    }
  }

  Future<void> getData() async {
    // get data from form
    // submit data to the server
    final url = 'http://10.0.2.2:8000/api/ruangPuans';
    final uri = Uri.parse(url);
    final response =
        await http.get(uri, headers: {'Authorization': '${AuthService.token}'});
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      print('items kita' + json['data'].toString());
      final result = json['data'] ?? [] as List;
      setState(() {
        dataMore = result;
      });
    } else {}
    // showsuccess or fail message based on status
    print(response.statusCode);
    print('data pas api tarik' + response.body);
  }

  Future<void> isInstalled() async {
    final val =
        await WhatsappShare.isInstalled(package: Package.businessWhatsapp);
    print('Whatsapp Business is installed: $val');
    if (val == true) {
      share();
    }
  }

  Future<void> location() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('test');
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });

    print('LAT: ${_currentPosition?.latitude ?? ""}');
    print('LNG: ${_currentPosition?.longitude ?? ""}');

    _launchUrl(_currentPosition?.latitude, _currentPosition?.longitude);
  }

  Future<void> _launchUrl(double? lat, double? long) async {
    Uri _url = Uri.parse('https://www.google.com/maps/search/${lat},${long}');
    print(_url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> share() async {
    await WhatsappShare.share(
      text: 'Whatsapp share text',
      // linkUrl: 'https://flutter.dev/',
      phone: '6285773030388',
      // package:
    );
    // await WhatsAppSenderFlutter.send(
    //   phones: [
    //     "6281368701176",
    //     "62895334296207",
    //     "6288269841977",
    //     "6285773030388"
    //   ],
    //   message: "Hello",
    // );
    // print(await whatsapp.messagesText(
    //     to: 6288269841977,
    //     message: "Hey, Flutter, follow me on https://example.com",
    //     previewUrl: true));
    // print('test');
  }
}
