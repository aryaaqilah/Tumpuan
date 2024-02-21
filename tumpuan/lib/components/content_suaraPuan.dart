import 'package:flutter/material.dart';
import 'package:tumpuan/components/callView.dart';
import 'package:tumpuan/components/editContact.dart';
import 'package:tumpuan/screens/isiSuaraPuan.dart';
import 'package:tumpuan/styles/style.dart';

Widget getDataSuaraPuan(List<dynamic> dataSuaraPuan) {
  String title;
  String content;
  String media;
  String dop;
  String kategori_id;
  String user_id;

  List<Widget> dataSuaraBoxes = [];
  for (var i = 0; i < dataSuaraPuan.length; i++) {
    title = dataSuaraPuan[i]['title'].toString();
    content = dataSuaraPuan[i]['content'].toString();
    media = dataSuaraPuan[i]['media'].toString();
    dop = dataSuaraPuan[i]['dop'].toString();
    kategori_id = dataSuaraPuan[i]['kategori_id'].toString();
    user_id = dataSuaraPuan[i]['user_id'].toString();

    dataSuaraBoxes.add(SuaraPuanBox(
        title: title,
        content: content,
        media: media,
        dop: dop,
        kategori_id: kategori_id,
        user_id: user_id));
    dataSuaraBoxes.add(SizedBox(height: 10));
  }
  return Column(
    children: dataSuaraBoxes,
  );
}

class SuaraPuanBox extends StatelessWidget {
  SuaraPuanBox(
      {super.key,
      required this.title,
      required this.content,
      required this.media,
      required this.dop,
      required this.kategori_id,
      required this.user_id});

  final String title;
  final String content;
  final String media;
  final String dop;
  final String kategori_id;
  final String user_id;

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
                        kategori_id,
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
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => IsiSuaraPuan(
                                          title: title,
                                          content: content,
                                          media: media,
                                          dop: dop,
                                          kategori_id: kategori_id,
                                          user_id: user_id,
                                        )));
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
                      image: DecorationImage(
                          image: AssetImage('images/suaraPuanImg.png'))),
                ),
                SizedBox(height: 10),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(dop,
                          style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(251, 111, 146, 1),
                              fontSize: 12)),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Text('Tumpuan',
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
