import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:tumpuan/components/cardMore.dart';
import 'package:tumpuan/components/headerMore.dart';
import 'package:tumpuan/components/middleBarMore.dart';
import 'package:tumpuan/components/searchCard.dart';
import 'package:tumpuan/screens/takePhoto.dart';
import 'package:tumpuan/services/auth_service.dart';
import 'package:tumpuan/styles/style.dart';
import 'package:http/http.dart' as http;

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() {
    return _MoreState();
  }
}

class _MoreState extends State<More> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = true;

  void initState() {
    super.initState();
    getData();
  }

  List<dynamic> dataMore = [
    // [
    //   'author',
    //   'images/profilePict.png',
    //   'images/suaraPuanImg.png',
    //   'date',
    //   'teks',
    //   'idPost',
    //   '1',
    //   '2'
    // ],
    // [
    //   'author2',
    //   'images/profilePict.png',
    //   'images/suaraPuanImg.png',
    //   'date2',
    //   'teks2',
    //   'idPost2',
    //   '3',
    //   '4'
    // ],
    // [
    //   'author2',
    //   'images/profilePict.png',
    //   '',
    //   'date2',
    //   'teks2',
    //   'idPost2',
    //   '3',
    //   '4'
    // ],
  ];

  final dataUser = ['Nixonnn', 'images/profilePict.png', '12345'];
  TextEditingController threadNameController = TextEditingController();
  File? _image;
  @override
  Widget build(BuildContext context) {
    print(dataMore);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: getData,
          child: SafeArea(
            bottom: false,
            child: ListView(
              controller: _scrollController,
              children: [
                // SearchCard(),
                HeaderMore(
                  username: dataUser[0],
                  img: dataUser[1],
                  userid: dataUser[2],
                ),
                StickyHeader(
                  controller: _scrollController,
                  header: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 7.0),
                                  child: TextField(
                                      controller: threadNameController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Write your Thoughts',
                                      )),
                                )),
                          ),
                          IconButton(
                              onPressed: () async {
                                final pickedImage = await Navigator.push<File?>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageSelectionPage(),
                                  ),
                                );
                                setState(() {
                                  _image =
                                      pickedImage ?? File('images/ktp.png');
                                });
                              },
                              icon: _image != null
                                  ? Icon(Icons.photo, color: Colors.green)
                                  : Icon(Icons.add_photo_alternate,
                                      color: Colors.grey)),
                          // ElevatedButton(
                          //     style: ButtonStyle(
                          //         backgroundColor:
                          //             MaterialStateProperty.all(AppColors.bg)),
                          //     onPressed: () {},
                          //     child: Icon(
                          //       Icons.photo,
                          //       color: Colors.grey,
                          //     )),
                          SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(AppColors.pink1)),
                            onPressed: () {
                              submitData();
                              getData();
                            },
                            child: Text('Post'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Card(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(0),
                  //     child: Row(
                  //       children: [
                  //         MenuCard(text: "Italy", color: Colors.orange),
                  //         // MenuCard(text: "France", color: Colors.pink)
                  //         // TextField(
                  //         //     decoration: InputDecoration(
                  //         //   border: InputBorder.none,
                  //         //   hintText: 'Username',
                  //         // ))
                  //         // Card(
                  //         //   child: Padding(
                  //         //     padding: const EdgeInsets.all(
                  //         //         8.0), // Add padding here as well
                  //         //     child: TextField(),
                  //         //   ),
                  //         // )
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  content: getDataMore(dataMore),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submitData() async {
    // get data from form
    final threadName = threadNameController.text;
    final threadDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final body = {
      "threadName": threadName,
      "threadDate": threadDate,
      "media": "",
      "like": 0
    };
    // submit data to the server
    final url = 'http://10.0.2.2:8000/api/ruangPuans';
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Authorization': '${AuthService.token}'
    });
    // showsuccess or fail message based on status
    print(response.statusCode);
    print(response.body);
  }

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });
    // get data from form
    // submit data to the server
    final url = 'http://10.0.2.2:8000/api/ruangPuans';
    final uri = Uri.parse(url);
    final response =
        await http.get(uri, headers: {'Authorization': '${AuthService.token}'});
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      print('items kita' + json['data'].toString());
      final result = json['data'] ?? [] as List;
      setState(() {
        dataMore = result;
      });
    }

    setState(() {
      isLoading = false;
    });
    // showsuccess or fail message based on status
    print(response.statusCode);
    print('data pas api tarik' + response.body);
  }
}
