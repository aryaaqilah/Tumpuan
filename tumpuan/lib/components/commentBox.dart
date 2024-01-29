import 'package:flutter/material.dart';
import 'package:tumpuan/components/callView.dart';
import 'package:tumpuan/components/editContact.dart';
import 'package:tumpuan/styles/style.dart';

Widget getDataComment(List<List<String>> dataComment) {
  String username;
  String profilePict;
  String date;
  String teks;
  String idPost;
  String likeCount;
  String commentCount;

  List<Widget> dataCommentBoxes = [];
  for (var i = 0; i < dataComment.length; i++) {
    username = dataComment[i][0];
    profilePict = dataComment[i][1];
    date = dataComment[i][2];
    teks = dataComment[i][3];
    idPost = dataComment[i][4];
    likeCount = dataComment[i][5];
    commentCount = dataComment[i][6];
    dataCommentBoxes.add(CommentBox(
      username: username,
      profilePict: profilePict,
      date: date,
      teks: teks,
      idPost: idPost,
      likeCount: likeCount,
      commentCount: commentCount,
    ));
    dataCommentBoxes.add(SizedBox(height: 10));
  }
  return Column(
    children: dataCommentBoxes,
  );
}

class CommentBox extends StatelessWidget {
  // var username;

  CommentBox(
      {super.key,
      required this.username,
      required this.profilePict,
      required this.date,
      required this.teks,
      required this.idPost,
      required this.likeCount,
      required this.commentCount});

  late final String username;
  final String profilePict;
  final String date;
  final String teks;
  final String idPost;
  final String likeCount;
  final String commentCount;

  int checker = 1;

  // if(length(img) = 0)

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      // height: 100,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // height: 100,
              // decoration: BoxDecoration(color: Colors.amber),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(profilePict),
                    radius: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 270,
                    // decoration: BoxDecoration(color: Colors.grey),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              username,
                              style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              date,
                              style: TextStyle(
                                  fontFamily: 'Satoshi', fontSize: 15),
                            )
                          ],
                        ),
                        Container(
                          width: 270,
                          // decoration: BoxDecoration(color: Colors.grey),
                          child: Text(
                            teks,
                            style:
                                TextStyle(fontFamily: 'Satoshi', fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    IconButton(icon : Icon(Icons.mode_comment_outlined), 
                    onPressed: () { 
                      // Navigator.of(context).pushReplacement(
                      // MaterialPageRoute(builder: (context) => const ()));
                    },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(commentCount)
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.favorite_border),
                    SizedBox(
                      width: 5,
                    ),
                    Text(likeCount)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    ));
  }
}
