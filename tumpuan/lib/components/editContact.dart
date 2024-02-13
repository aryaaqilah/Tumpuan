import 'package:flutter/material.dart';
import 'package:tumpuan/components/contactBox.dart';
import 'package:tumpuan/styles/style.dart';

class EditContact extends StatefulWidget {
  const EditContact(
      {super.key,
      required this.name,
      required this.image,
      required this.number,
      required this.relation});

  final String name;
  final String number;
  final String image;
  final String relation;

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  late String name;
  late String number;
  late String image;
  late String email;
  late String address;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: AppColors.pink1,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Edit Contact',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ],
            ),
            SizedBox(height: 20),
            CircleAvatar(
              // backgroundImage: AssetImage(widget.image),
              radius: 40,
            ),
            SizedBox(height: 20),
            Text(
              widget.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                // width: 300,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            // readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: widget.name,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                // width: 300,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number',
                          style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            // readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: widget.number,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                // width: 300,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Relation',
                          style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            // readOnly: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: widget.relation,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
