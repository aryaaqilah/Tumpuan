import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tumpuan/components/callView.dart';
import 'package:tumpuan/components/editContact.dart';
import 'package:tumpuan/screens/commentRuangPuan.dart';
import 'package:tumpuan/screens/more.dart';
import 'package:tumpuan/styles/style.dart';

Widget getDataUntukPuan(List<dynamic> DataUntukPuan) {
  String name;
  String image;
  String address;

  print('ini datanya : ${DataUntukPuan}');

  List<Widget> dataUntukPuanBoxes = [];
  dataUntukPuanBoxes.add(SizedBox(height: 5));
  dataUntukPuanBoxes.add(Container(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 70,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Near Me',
                  style: TextStyle(fontFamily: 'Satoshi', fontSize: 10),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 70,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Rated 4 Star',
                  style: TextStyle(fontFamily: 'Satoshi', fontSize: 10),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 70,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Cheapest Price',
                  style: TextStyle(fontFamily: 'Satoshi', fontSize: 10),
                ),
              ),
            ),
          ),
        ],
      )));
  dataUntukPuanBoxes.add(SizedBox(height: 15));
  dataUntukPuanBoxes.add(Text(
    'Our Recommendations For You',
    style: TextStyle(
        fontFamily: 'Satoshi', fontWeight: FontWeight.bold, fontSize: 20),
  ));
  dataUntukPuanBoxes.add(SizedBox(height: 15));
  for (var i = 0; i < DataUntukPuan.length; i++) {
    // name = DataUntukPuan[i]['threadName'].toString();
    // address = DataUntukPuan[i]['threadDate'].toString();
    // image = "lala";
    name = DataUntukPuan[i][0];
    image = DataUntukPuan[i][1];
    address = DataUntukPuan[i][2];
    dataUntukPuanBoxes.add(UntukPuanBox(
      image: image,
      name: name,
      address: address,
    ));
    dataUntukPuanBoxes.add(SizedBox(height: 15));
  }
  return Column(
    children: dataUntukPuanBoxes,
  );
}

class UntukPuanBox extends StatelessWidget {
  UntukPuanBox({
    super.key,
    required this.image,
    required this.name,
    required this.address,
  });
  final String image;
  final String name;
  final String address;

  int checker = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Stack(children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('images/untukPuan.png'),
                        fit: BoxFit.fill)),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Apsara Spa',
                                    style: TextStyle(
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pasar Bersih, Sentul City, Bogor',
                                    style: TextStyle(
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w100,
                                        fontSize: 12),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 190, top: 190),
          child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width / 2 - 55,
              decoration: BoxDecoration(
                  color: AppColors.pink1,
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 13,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 13,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 13,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 13,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 13,
                  ),
                  VerticalDivider(
                    color: Colors.white,
                    thickness: 0.5,
                  ),
                  Icon(Icons.monetization_on, color: Colors.green, size: 13),
                  Icon(Icons.monetization_on, color: Colors.green, size: 13),
                  Icon(Icons.monetization_on, color: Colors.green, size: 13),
                  Icon(Icons.monetization_on, color: Colors.green, size: 13),
                ],
              )),
        )
      ]),
    );
  }
}
