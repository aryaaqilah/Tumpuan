import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:tumpuan/components/commentBox.dart';
import 'package:tumpuan/components/searchCard.dart';
import 'package:tumpuan/styles/style.dart';

class Comment extends StatefulWidget {
  const Comment({super.key, required this.idPost});

  final String idPost;

  @override
  State<Comment> createState() {
    return _CommentState();
  }
}

class _CommentState extends State<Comment> {
  final ScrollController _scrollController = ScrollController();

  final dataComment = [
    ['author', 'images/profilePict.png', 'date', 'teks', 'idPost', '1', '2'],
    [
      'author2',
      'images/profilePict.png',
      'date2',
      'teks2',
      'idPost2',
      '3',
      '4'
    ],
    [
      'author2',
      'images/profilePict.png',
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Comments',
          style: TextStyle(color: Colors.black),
        ),
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    getDataComment(dataComment),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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
                              hintText: 'Write your Comment',
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
            )
          ],
        ),
      ),
    );
  }
}
