import 'package:flutter/material.dart';

class PanggilPuan extends StatefulWidget {
  @override
  State<PanggilPuan> createState() {
    return _PanggilPuanState();
  }
}

class _PanggilPuanState extends State<PanggilPuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 237, 237, 1),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Tumpuan',
            style: TextStyle(
                fontFamily: 'Brodies', color: Color.fromRGBO(251, 111, 146, 1)),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Panggil Puan Page',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
