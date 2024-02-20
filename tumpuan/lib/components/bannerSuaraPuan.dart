import 'package:flutter/material.dart';

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

  final String author;
  final String image;
  final String date;
  final String category;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14),
        ),
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
                  width: 390,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                // SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
