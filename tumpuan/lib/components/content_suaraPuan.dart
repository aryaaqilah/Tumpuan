import 'package:flutter/material.dart';
import 'package:tumpuan/components/callView.dart';
import 'package:tumpuan/components/editContact.dart';
import 'package:tumpuan/screens/isiSuaraPuan.dart';
import 'package:tumpuan/styles/style.dart';

Widget getDataSuaraPuan(List<List<String>> dataSuara) {
  String author;
  String image;
  String date;
  String category;
  String title;
  List<Widget> dataSuaraBoxes = [];
  for (var i = 0; i < dataSuara.length; i++) {
    author = dataSuara[i][0];
    image = dataSuara[i][1];
    date = dataSuara[i][2];
    category = dataSuara[i][3];
    title = dataSuara[i][4];
    dataSuaraBoxes.add(SuaraPuanBox(
      author: author,
      image: image,
      date: date,
      category: category,
      title: title,
    ));
    dataSuaraBoxes.add(SizedBox(height: 10));
  }
  return Column(
    children: dataSuaraBoxes,
  );
}

class SuaraPuanBox extends StatelessWidget {
  SuaraPuanBox(
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
        // SizedBox(
        //   height: 20,
        // ),
        Container(
          width: 330,
          child: Divider(
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 10,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const IsiSuaraPuan()));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(251, 111, 146, 1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )),
                          ),
                          child: const Text(
                            'See More',
                            style: TextStyle(fontFamily: 'Satoshi'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
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
