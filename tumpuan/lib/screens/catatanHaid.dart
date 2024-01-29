import 'package:flutter/material.dart';

class CatatanHaid extends StatefulWidget {
  const CatatanHaid({super.key});

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
        elevation: 0,
        backgroundColor: Colors.transparent,
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
          'Catatan Haid Page',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
