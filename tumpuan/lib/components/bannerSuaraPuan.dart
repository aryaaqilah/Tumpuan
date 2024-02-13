import 'package:flutter/material.dart';
import 'package:tumpuan/components/callView.dart';
import 'package:tumpuan/components/editContact.dart';
import 'package:tumpuan/styles/style.dart';

Widget getDataBannerSuaraPuan(List<String> dataBannerSuara) {
  String author;
  String image;
  String date;
  String category;
  String title;
  List<Widget> dataBannerSuaraBoxes = [];
  // for (var i = 0; i < dataBannerSuara.length; i++) {

  //   dataBannerSuaraBoxes.add(SizedBox(height: 10));
  // }
  author = dataBannerSuara[0];
  image = dataBannerSuara[1];
  date = dataBannerSuara[2];
  category = dataBannerSuara[3];
  title = dataBannerSuara[4];
  dataBannerSuaraBoxes.add(BannerSuaraPuanBox(
    author: author,
    image: image,
    date: date,
    category: category,
    title: title,
  ));
  return Column(
    children: dataBannerSuaraBoxes,
  );
}

class BannerSuaraPuanBox extends StatelessWidget {
  BannerSuaraPuanBox(
      {super.key,
      required this.author,
      required this.image,
      required this.date,
      required this.category,
      required this.title});

  late final String author;
  final String image;
  final String date;
  final String category;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              // color: Colors.white,
              // border: Border.symmetric()
              // borderRadius: BorderRadius.all(Radius.circular(10))
              ),
          // height: 200,
          width: 330,
          child: Center(
            // padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              children: [
                Container(
                  width: 330,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(image))),
                ),
                SizedBox(height: 10),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(date,
                          style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(251, 111, 146, 1),
                              fontSize: 12)),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Text(author,
                          style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(251, 111, 146, 1),
                              fontSize: 12)),
                    ],
                  ),
                ),
                SizedBox(height: 7),
                Text(title,
                    style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                    maxLines: 2),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
