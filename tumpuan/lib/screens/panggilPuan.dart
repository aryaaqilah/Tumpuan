import 'package:flutter/material.dart';
import 'package:tumpuan/components/contactBox.dart';

class PanggilPuan extends StatefulWidget {
  const PanggilPuan({super.key});

  @override
  State<PanggilPuan> createState() {
    return _PanggilPuanState();
  }
}

class _PanggilPuanState extends State<PanggilPuan> {
  @override
  Widget build(BuildContext context) {
    final dataContact = [
      ['Ayah', 'images/profileDefault.jpg', '082122504942', 'Email', 'Address'],
      ['Ibu', 'images/profileDefault.jpg', '0000000000', '', ''],
      ['Ayah2', 'images/profileDefault.jpg', '082122504942', '', ''],
      ['Ayah3', 'images/profileDefault.jpg', '082122504942', '', ''],
      ['Ayah4', 'images/profileDefault.jpg', '082122504942', '', ''],
      ['Ayah5', 'images/profileDefault.jpg', '082122504942', '', ''],
      ['Ayah6', 'images/profileDefault.jpg', '082122504942', '', ''],
      ['Ayah7', 'images/profileDefault.jpg', '082122504942', '', ''],
    ];

    final datanya = ['Ayah', 'images/profileDefault.jpg', '082122504942'];

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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Emergency Contacts',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15),
            // ContactBox(
            //     name: 'Ayah',
            //     image: 'images/profileDefault.jpg',
            //     number: '082122504942'),
            getDataContact(dataContact),
            SizedBox(height: 10),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_circle,
                  size: 35,
                )),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
