import 'package:flutter/material.dart';
import 'package:tumpuan/components/callView.dart';
import 'package:tumpuan/components/editContact.dart';
import 'package:tumpuan/styles/style.dart';

Widget getDataContact(List<List<String>> dataContact) {
  String name;
  String image;
  String number;
  String email;
  String address;
  List<Widget> contactBoxes = [];
  for (var i = 0; i < dataContact.length; i++) {
    name = dataContact[i][0];
    image = dataContact[i][1];
    number = dataContact[i][2];
    email = dataContact[i][3];
    address = dataContact[i][4];
    contactBoxes.add(ContactBox(
      name: name,
      image: image,
      number: number,
      email: email,
      address: address,
    ));
    contactBoxes.add(SizedBox(height: 10));
  }
  return Column(
    children: contactBoxes,
  );
}

class ContactBox extends StatelessWidget {
  ContactBox(
      {super.key,
      required this.name,
      required this.image,
      required this.number,
      required this.email,
      required this.address});

  late final String name;
  final String image;
  final String number;
  final String email;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(Colo),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 120,
      width: 330,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          children: [
            // SizedBox(height: 3),
            Container(
              height: 20,
              width: 320,
              alignment: Alignment.bottomRight,
              // color: Colors.amber,
              child: IconButton(
                icon: Icon(
                  Icons.edit_rounded,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(
                          builder: (context) => EditContact(
                                name: name,
                                image: image,
                                number: number,
                                email: email,
                                address: address,
                              )));
                },
                iconSize: 15,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(
                        builder: (context) => CallView(
                              name: name,
                              number: number,
                            )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(image),
                    radius: 40,
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // color: Colors.amber,
                        width: 200,
                        child: Text(name,
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.pink1,
                            )),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 200,
                        child: Text(
                          number,
                          style:
                              TextStyle(fontSize: 15, color: AppColors.pink1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
