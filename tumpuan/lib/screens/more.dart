import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:tumpuan/components/cardMore.dart';
import 'package:tumpuan/components/headerMore.dart';
import 'package:tumpuan/components/middleBarMore.dart';
import 'package:tumpuan/components/searchCard.dart';
import 'package:tumpuan/styles/style.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() {
    return _MoreState();
  }
}

class _MoreState extends State<More> {
  final ScrollController _scrollController = ScrollController();

  final dataMore = [
    [
      'author',
      'images/profilePict.png',
      'images/suaraPuanImg.png',
      'date',
      'teks',
      'idPost',
      '1',
      '2'
    ],
    [
      'author2',
      'images/profilePict.png',
      'images/suaraPuanImg.png',
      'date2',
      'teks2',
      'idPost2',
      '3',
      '4'
    ],
    [
      'author2',
      'images/profilePict.png',
      '',
      'date2',
      'teks2',
      'idPost2',
      '3',
      '4'
    ],
  ];

  final dataUser = ['Nixonnn', 'images/profilePict.png', '12345'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.0),
                              child: TextField(
                                  decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Write your Thoughts',
                              )),
                            )),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.pink1)),
                        onPressed: () {
                          // Handle button press
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
    );
  }
}
