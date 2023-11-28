import 'package:flutter/material.dart';

class CatatanHaid extends StatefulWidget {
  @override
  State<CatatanHaid> createState() {
    return _CatatanHaidState();
  }
}

class _CatatanHaidState extends State<CatatanHaid> {
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
          'Catatan Haid Page',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
