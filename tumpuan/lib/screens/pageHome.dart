import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  @override
  State<PageHome> createState() {
    return _PageHomeState();
  }
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      appBar: AppBar(
        title: Text('PageHome'),
      ),
      body: Center(
        child: Text(
          'PageHome Screen',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
