import 'package:flutter/material.dart';
import 'package:tumpuan/Widgets/sliver_list.dart';
import 'package:tumpuan/Widgets/sliver_list2.dart';
import 'package:tumpuan/Widgets/sliver_list3.dart';
import 'package:tumpuan/components/bannerSuaraPuan.dart';
import 'package:tumpuan/components/content_suaraPuan.dart';

class SuaraPuan extends StatefulWidget {
  const SuaraPuan({super.key});

  @override
  State<SuaraPuan> createState() => _SuaraPuanState();
}

class _SuaraPuanState extends State<SuaraPuan> {
  @override
  Widget build(BuildContext context) {
    final dataSuaraPuan = [
      ['author', 'images/suaraPuanImg.png', 'date', 'category', 'title'],
      ['author2', 'images/suaraPuanImg.png', 'date2', 'category2', 'title2'],
    ];

    final dataBannerSuara = dataSuaraPuan;

    final PageController controller = PageController();
    int currentTab = 0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.search, color: Colors.black)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'For You',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Satoshi',
                      color: Color.fromRGBO(251, 111, 146, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
            Container(
              height: 230,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    currentTab = index;
                  });
                },
                children: [
                  for (var item in dataBannerSuara) getDataBannerSuaraPuan(item)
                ],
              ),
            ),
            Container(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  getDataSuaraPuan(dataSuaraPuan),
                ],
              ),
            )),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
