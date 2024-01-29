import 'package:flutter/material.dart';
import 'package:tumpuan/screens/suaraPuan.dart';
import 'package:tumpuan/screens/untukPuan.dart';
import 'package:tumpuan/screens/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            'Tumpuan',
            style: TextStyle(
                fontFamily: 'Brodies', color: Color.fromRGBO(251, 111, 146, 1)),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            // color: Colors.amber,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: Ma,
                children: [
                  SizedBox(height: 15),
                  Container(
                    width: 600,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/BannerSuaraPuan.png"))),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAro,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SuaraPuan(
                                  // title: 'Suara Puan',
                                  )));
                          // ScreenChanger.changeScreen(SuaraPuan(), 0, () {
                          //   setState(() {});
                          // });
                        },
                        child: Container(
                          width: 145,
                          height: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("images/btn_suarapuan.png"))),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const UntukPuan(
                                    title: 'Untuk Puan',
                                  )));
                        },
                        child: Container(
                          width: 145,
                          height: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("images/btn_untukpuan.png"))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAro,
                    children: [
                      Container(
                        width: 145,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/btn_countdown.png"))),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 145,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/btn_dailyquiz.png"))),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Last Month Period',
                    style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Image(image: AssetImage('images/lastmonthperiodex.png')),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
