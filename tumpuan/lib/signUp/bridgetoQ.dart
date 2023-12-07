import 'package:flutter/material.dart';
import 'package:tumpuan/signUp/question1.dart';

class BridgetoQ extends StatefulWidget {
  const BridgetoQ({super.key});

  @override
  State<BridgetoQ> createState() => _BridgetoQState();
}

class _BridgetoQState extends State<BridgetoQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            const Image(image: AssetImage('images/bridging.png')),
            const SizedBox(height: 50),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const Question1()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(251, 111, 146, 1))),
                child: const Text(
                  'Next',
                  style: TextStyle(fontFamily: 'Satoshi'),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
