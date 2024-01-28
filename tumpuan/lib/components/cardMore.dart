import 'package:flutter/material.dart';
import 'package:tumpuan/components/callView.dart';
import 'package:tumpuan/components/editContact.dart';
import 'package:tumpuan/styles/style.dart';

Widget getDataMore(List<List<String>> dataMore) {
  String username;
  String profilePict;
  String image;
  String date;
  String teks;
  String idPost;
  String likeCount;
  String commentCount;

  List<Widget> dataMoreBoxes = [];
  for (var i = 0; i < dataMore.length; i++) {
    username = dataMore[i][0];
    profilePict = dataMore[i][1];
    image = dataMore[i][2];
    date = dataMore[i][3];
    teks = dataMore[i][4];
    idPost = dataMore[i][5];
    likeCount = dataMore[i][6];
    commentCount = dataMore[i][7];
    dataMoreBoxes.add(MoreBox(
      username: username,
      profilePict: profilePict,
      image: image,
      date: date,
      teks: teks,
      idPost: idPost,
      likeCount: likeCount,
      commentCount: commentCount,
    ));
    dataMoreBoxes.add(SizedBox(height: 10));
  }
  return Column(
    children: dataMoreBoxes,
  );
}

class MoreBox extends StatelessWidget {
  // var username;

  MoreBox(
      {super.key,
      required this.username,
      required this.profilePict,
      required this.image,
      required this.date,
      required this.teks,
      required this.idPost,
      required this.likeCount,
      required this.commentCount});

  late final String username;
  final String profilePict;
  final String image;
  final String date;
  final String teks;
  final String idPost;
  final String likeCount;
  final String commentCount;

  int checker = 1;

  // if(length(img) = 0)

  @override
  Widget build(BuildContext context) {
    bool showImage = image.isNotEmpty;
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
          // if(checker = 0){}
          if (showImage) Image.asset(image),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(Icons.mode_comment_outlined),
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
