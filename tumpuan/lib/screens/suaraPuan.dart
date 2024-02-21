import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tumpuan/Widgets/sliver_list.dart';
import 'package:tumpuan/Widgets/sliver_list2.dart';
import 'package:tumpuan/Widgets/sliver_list3.dart';
import 'package:tumpuan/components/bannerSuaraPuan.dart';
import 'package:tumpuan/components/content_suaraPuan.dart';
import 'package:tumpuan/services/auth_service.dart';
import 'package:http/http.dart' as http;

class SuaraPuan extends StatefulWidget {
  const SuaraPuan({super.key});

  @override
  State<SuaraPuan> createState() => _SuaraPuanState();
}

class _SuaraPuanState extends State<SuaraPuan> {
  bool isLoading = true;

  void initState() {
    super.initState();
    getData();
  }

  List<dynamic> dataSuaraPuan = [];

  @override
  Widget build(BuildContext context) {
    final dataSuaraPuan2 = [
      ['title1', 'images/suaraPuanImg.png', 'date1', '1', '1'],
      ['title2', 'images/suaraPuanImg.png', 'date2', '2', '2'],
      ['title3', 'images/suaraPuanImg.png', 'date3', '3', '3'],
      ['title4', 'images/suaraPuanImg.png', 'date4', '4', '4'],
    ];

    final dataBannerSuara = dataSuaraPuan2.sublist(0, 3);

    // final dots

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
              padding: const EdgeInsets.only(top: 10, left: 32),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'For You',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Satoshi-Bold',
                      color: Color.fromRGBO(251, 111, 146, 1),
                      fontWeight: FontWeight.w900,
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

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });
    // get data from form
    // submit data to the server
    final url = 'http://10.0.2.2:8000/api/suarapuans';
    final uri = Uri.parse(url);
    final response =
        await http.get(uri, headers: {'Authorization': '${AuthService.token}'});
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map;
      final List<dynamic> resultList = jsonResponse['data'] ?? [];

      for (var data in resultList) {
        var title = data['title'].toString();
        var content = data['content'].toString();
        var media = data['media'].toString();
        var dop = data['dop'].toString();
        var kategori_id = data['kategori_id'].toString();
        var user_id = data['user_id'].toString();

        dataSuaraPuan.add({
          'title': title,
          'content': content,
          'media': media,
          'dop': dop,
          'kategori_id': kategori_id,
          'user_id': user_id,
        });
      }

      setState(() {
        // Update state after fetching data
        dataSuaraPuan = resultList;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false; // Set isLoading to false if request failed
      });
    }
    // showsuccess or fail message based on status
    print(response.statusCode);
    print('data pas api tarik' + response.body);
  }
}
