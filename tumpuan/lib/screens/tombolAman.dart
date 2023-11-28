import 'package:flutter/material.dart';

class TombolAman extends StatefulWidget {
  @override
  State<TombolAman> createState() {
    return _TombolAmanState();
  }
}

class _TombolAmanState extends State<TombolAman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      appBar: AppBar(
        title: Text('TombolAman'),
      ),
      body: Center(
        child: Text(
          'TombolAman Screen',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
