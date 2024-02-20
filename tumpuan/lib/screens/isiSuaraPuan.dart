import 'package:flutter/material.dart';
import 'package:tumpuan/components/bannerSuaraPuan.dart';
import 'dart:ui';

class Comment {
  String text;
  DateTime date;
  String userName;
  String userProfilePic;
  Comment(this.text, this.date, this.userName, this.userProfilePic);
}

class IsiSuaraPuan extends StatefulWidget {
  const IsiSuaraPuan({super.key});

  @override
  State<IsiSuaraPuan> createState() => _IsiSuaraPuanState();
}

class _IsiSuaraPuanState extends State<IsiSuaraPuan> {
  List<Comment> comments = [];

  TextEditingController _commentController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dataSuaraPuan = [
      ['author', 'images/suaraPuanImg.png', 'date', 'category', 'title'],
      ['author2', 'images/suaraPuanImg.png', 'date2', 'category2', 'title2'],
      ['author3', 'images/suaraPuanImg.png', 'date3', 'category3', 'title3'],
      ['author4', 'images/suaraPuanImg.png', 'date4', 'category4', 'title4'],
    ];

    final dataBannerSuara = dataSuaraPuan.sublist(0, 3);
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
        actions: <Widget>[],
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
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  'images/suaraPuanImg.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 9),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Buttonscarves dan Kami. Rilis Koleksi Kolaborasi Tema Pemberdayaan Wanita',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        'Tuesday, 13/02/2024 11:00 | ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        'Lifestyle',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(251, 111, 146, 1),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                '____________________________________________________',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Dua brand lokal yang populer di kalangan hijabers berkolaborasi dan membuat gebrakan terbaru. Ialah Buttonscarves dan Kami. yang berkolaborasi mengeluarkan koleksi untuk memperdayakan wanita. Brand Kami. didirikan oleh Istafiana Candarini, Nadya Karina, dan Afina Candarini pada 2009. Sedangkan CEO dan Founder dari Buttonscarves Linda Anggrea mendirikan brandnya sejak 2016. Dalam kehidupan sehari-hari, pemilik kedua brand ini saling dekat dan mengenal satu sama lain. Kerap bertemu, tercetus lah ide untuk berkolaborasi bersama.\n\n'
                'Buttonscarves dan Kami. merilis koleksi yang dinamai Kimmonia Series. Istafiana Candarini atau akrab disapa Irin ini mengungkapkan proses awal koleksi kolaborasinya dengan Linda. "Kurang lebih selama dua tahun yang lalu ada percakapan yang membahas tentang kolaborasi. Karena pelanggan setia kita minta kita untuk kolaborasi. Dan kita mengiyakan berkolaborasi," kata Irin saat konferensi pers Buttonscarves x Kami. Kimmonia Exhibition, Senin (12/2/2024) di Pondok Indah Mall 3, Jakarta Selatan. Linda menambahkan koleksi Kimmonia tercetus karena dia, Irin dan founder Buttonscarves serta Kami. lainnya kerap berkolaborasi bukan hanya kali ini saja. Persaingan sehat terjadi dan mereka tak takut untuk bertukar pikiran mengenai industri modest fashion.\n\n'
                '"Walau pun toko kita sebelahan, kita saling tukar pikiran dan bertanya tahun depan membahas tren misalnya. Saling improve supplier dan lain-lain," kata Linda. Nadya Karina atau biasa dipanggil Karin yang merupakan creative director Kami. lebih lanjut menjelaskan arti dari Kimmonia yang merupakan nama koleksi kolaborasi dengan Buttonscarves. Kimmonia sendiri berarti perempuan hebat. "Kita pilih karena isinya di Buttonscarves dan Kami. itu perempuan semua yang sama-sama seumuran juga. Background kehidupannya sama, bisnisnya sama dan itu kenapa kita pilih nama Kimmonia," ujarnya.\n\n'
                'Dalam mewujudkan koleksi kolaborasi, membutuhkan proses yang panjang. Karin mengaku banyak belajar lagi tentang kolaborasi. "Karena kita kepengen hasil produknya maksimal dan karakter keduanya benar-benar kelihatan. Alhamdulillah teasernya benar-benar antusias kita keluar karakternya," jelas Karin. Linda yang merupakan ibu dari empat orang anak ini koleksi kolaborasi ini didominasi motif Kami., sedangkan lay out busana dan hijabnya Buttonscarves. Mereka pun menggabungkan dua logo brand sebagai motif hijab monogram.\n\n'
                '"Karena ada yang mau versinya masing-masing walau berbeda tetap satu. Kenapa tidak berkolaborasi pattern yang dilebur menjadi satu," jelasnya. Irin menambahkan menggabungkan dua DNA brand tidaklah mudah. Ada beberapa ide yang tak bisa diwujudkan bersama. "Kalau tantangannya sendiri waktu itu yang nggak jadi itu ada bros. Akhirnya fokus yang mau kita buat sekarang membawa kilas balik Jemima Series akhirnya lebih fresh," ungkap Irin.\n\n'
                'Salah satu hal menarik dari koleksi kolaborasi ini terdapat elemen kaktus, lilac series dari Buttonscarves dan Jemina Series dari Kami. Ada emblem atau logo hijab dari masing-masing brand yang bisa dibolak-balik. Koleksi Kimmonia yang merupakan kolaborasi Buttonscarves dan Kami. ini terdiri dari hijab, busana mulai dari atasan hingga dress serta baju untuk pria dan anak-anak. Harga hijab dibanderol Rp 425 Ribu dan busananya Rp 1,5 Juta. Tak hanya koleksi hijab, kolaborasi dua brand lokal ini juga mengeluarkan tote bag untuk melengkapi kebutuhan wanita. Untuk koleksi tas ini kata Linda, dia dan tim Kami. juga mencari titik temu untuk tetap mempertahankan dua DNA dari masing-masing brand.\n\n'
                '"Akhirnya ciri khasnya key chain yang bisa dilepas pasang pada tote bag. Sisi depan belakangnya ada logo Buttonscarves dan Kami. koleksi ini juga tersedia untuk pria dan anak-anak," ujar Linda. Irin menegaskan koleksi kolaborasi ini didedikasikan sebagai lambang persahabatan antar kedua brand. Linda menambahkan, mereka juga ingin memberikan contoh kepada pelaku industri untuk bisa mendukung satu sama lain. "Di Malaysia itu masih jarang antar lintas modest brand bisa berkolaborasi. Karena berkolaborasi itu ada nilai baik yang lebih banyak. Ada sesuatu hal baru yang didapatkan. Semakin sadar bahwa banyak hal yang bisa improve satu sama lain," kata Linda.\n\n',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                '____________________________________________________',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommendation',
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const IsiSuaraPuan()));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(251, 111, 146, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                '____________________________________________________',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'What do you think?                          ',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontSize: 21,
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/Happy.png'),
                  SizedBox(width: 24, height: 24, child: null),
                  Image.asset('images/Shock.png'),
                  SizedBox(width: 24, height: 24, child: null),
                  Image.asset('images/Sad.png'),
                  SizedBox(width: 24, height: 24, child: null),
                  Image.asset('images/Angry.png'),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                '____________________________________________________',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Text(
              'Comments                                       ',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontSize: 21,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        Comment comment = comments[index];
                        return ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage(comment.userProfilePic),
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Text(
                              comment.userName,
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: Text(
                                  comment.text,
                                  style: TextStyle(
                                    fontFamily: 'Satoshi',
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: Text(
                                  '${comment.date.toString().split('.')[0]}',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 35,
                        right: 22.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: _commentController,
                              decoration: InputDecoration(
                                hintText: 'Add a comment...',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.send),
                            onPressed: _postComment,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 40,
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Text('Name : ',
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _userNameController,
                              decoration: InputDecoration(
                                hintText: 'Enter your display name...',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _postComment() {
    String newCommentText = _commentController.text;
    String userName = _userNameController.text.isNotEmpty
        ? _userNameController.text
        : 'Anonymous';
    DateTime now = DateTime.now();
    Comment newComment =
        Comment(newCommentText, now, userName, 'images/profileDefault.jpg');
    setState(() {
      comments.add(newComment);
      _commentController.clear();
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    _userNameController.dispose();
    super.dispose();
  }
}
