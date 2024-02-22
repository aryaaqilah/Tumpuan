import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tumpuan/services/auth_service.dart';

class SuaraPuan extends StatefulWidget {
  const SuaraPuan({Key? key}) : super(key: key);

  @override
  _SuaraPuanState createState() => _SuaraPuanState();
}

class _SuaraPuanState extends State<SuaraPuan> {
  bool isLoading = true;
  List<dynamic> dataSuaraPuan = [];
  List<dynamic> dataBannerSuara = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    final url = 'http://10.0.2.2:8000/api/suarapuans';
    final uri = Uri.parse(url);
    final response =
        await http.get(uri, headers: {'Authorization': '${AuthService.token}'});
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map;
      final List<dynamic> resultList = jsonResponse['data'] ?? [];

      setState(() {
        dataSuaraPuan = resultList;
        dataBannerSuara = resultList.sublist(
            0, 3); // Assuming the first 3 items are for the banner
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // do something
            },
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 230,
                    child: PageView(
                      children: [
                        for (var item in dataBannerSuara)
                          BannerWidget(data: item),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        for (var data in dataSuaraPuan)
                          ContentSuaraPuan(data: data),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  final dynamic data;

  const BannerWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data['title'].toString(),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Image.network(
              data['media'].toString()), // Assuming 'media' contains image URL
        ],
      ),
    );
  }
}

class ContentSuaraPuan extends StatelessWidget {
  final dynamic data;

  const ContentSuaraPuan({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data['title'].toString()),
      subtitle: Text(data['content'].toString()),
      leading: Image.network(
          data['media'].toString()), // Assuming 'media' contains image URL
    );
  }
}
