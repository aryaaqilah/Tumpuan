import 'package:flutter/material.dart';
import 'package:tumpuan/screens/catatanHaid.dart';
import 'package:tumpuan/screens/HomePage.dart';
import 'package:tumpuan/screens/more.dart';
import 'package:tumpuan/screens/pageHome.dart';
import 'package:tumpuan/screens/panggilPuan.dart';
import 'package:tumpuan/screens/tombolAman.dart';
// import 'package:flutter_app/page/dashboard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    const HomePage(),
    const PageHome(),
    const CatatanHaid(),
    const PanggilPuan(),
    const TombolAman(),
    const More()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Color.fromRGBO(251, 111, 146, 1),
                Color.fromRGBO(255, 143, 171, 1)
              ])),
          child: const Icon(
            Icons.sos,
            size: 30,
            color: Colors.white,
          ),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(237, 237, 237, 1),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const HomePage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0
                              ? const Color.fromRGBO(251, 111, 146, 1)
                              : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              color: currentTab == 0
                                  ? const Color.fromRGBO(251, 111, 146, 1)
                                  : Colors.grey,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const CatatanHaid();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: currentTab == 1
                              ? const Color.fromRGBO(251, 111, 146, 1)
                              : Colors.grey,
                        ),
                        Text(
                          'Catatan Haid',
                          style: TextStyle(
                              color: currentTab == 1
                                  ? const Color.fromRGBO(251, 111, 146, 1)
                                  : Colors.grey,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // Text(
              //   'Tombol\nAman',
              //   style: TextStyle(fontSize: 12),
              // ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const PanggilPuan();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.call,
                          color: currentTab == 3
                              ? const Color.fromRGBO(251, 111, 146, 1)
                              : Colors.grey,
                        ),
                        Text(
                          'Panggil Puan',
                          style: TextStyle(
                              color: currentTab == 3
                                  ? const Color.fromRGBO(251, 111, 146, 1)
                                  : Colors.grey,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const More();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.more_horiz,
                          color: currentTab == 4
                              ? const Color.fromRGBO(251, 111, 146, 1)
                              : Colors.grey,
                        ),
                        Text(
                          'More',
                          style: TextStyle(
                              color: currentTab == 4
                                  ? const Color.fromRGBO(251, 111, 146, 1)
                                  : Colors.grey,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
