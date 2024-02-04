import 'package:flutter/material.dart';
import 'package:tumpuan/components/dailyQuiz.dart';
import 'package:tumpuan/screens/newUntukPuan.dart';
import 'package:tumpuan/screens/suaraPuan.dart';
import 'package:tumpuan/screens/untukPuan.dart';
import 'package:tumpuan/screens/home.dart';
import 'package:tumpuan/styles/style.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int countdown = 22;
  late DateTime _rangeStartDay = DateTime.utc(2024, 2, 26);
  late DateTime _rangeEndDay = DateTime.utc(2024, 3, 3);

  @override
  Widget build(BuildContext context) {
    String formattedEndDate = DateFormat('d MMMM yyyy').format(_rangeEndDay);
    String formattedStartDate =
        DateFormat('d MMMM yyyy').format(_rangeStartDay);

    String prediction =
        'Prediction : ' + formattedStartDate + ' - ' + formattedEndDate;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
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
                  // SizedBox(height: 15),
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
                              builder: (context) => const newUntukPuan(
                                  // title: 'Untuk Puan',
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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => const DailyQuiz()));
                        },
                        child: Container(
                          width: 145,
                          height: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("images/btn_dailyquiz.png"))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Your Period Tracker',
                    style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('images/homeCircle.png'),
                      Image.asset('images/homeElipse.png'),
                      Column(
                        children: [
                          Text(
                            'Period in',
                            style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 10,
                                fontWeight: FontWeight.w200),
                          ),
                          Text(
                            '${countdown} Days',
                            style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.pink1),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    prediction,
                    style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 25,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.pink1)),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Home()));
                      },
                      child: Text(
                        'See Details',
                        style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
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
