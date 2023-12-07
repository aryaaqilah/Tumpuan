import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() {
    return _MoreState();
  }
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            'Tumpuan',
            style: TextStyle(
                fontFamily: 'Brodies', color: Color.fromRGBO(251, 111, 146, 1)),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'More Page',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
