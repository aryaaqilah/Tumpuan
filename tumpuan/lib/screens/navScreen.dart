import 'package:flutter/material.dart';
import 'package:tumpuan/screens/HomePage.dart';
import 'package:tumpuan/screens/catatanHaid.dart';
import 'package:tumpuan/screens/more.dart';
import 'package:tumpuan/screens/nav_bar.dart';
import 'package:tumpuan/screens/nav_model.dart';
import 'package:tumpuan/screens/panggilPuan.dart';
import 'package:tumpuan/styles/style.dart';
import 'package:whatsapp_share/whatsapp_share.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final haidNavKey = GlobalKey<NavigatorState>();
  final panggilNavKey = GlobalKey<NavigatorState>();
  final moreNavKey = GlobalKey<NavigatorState>();
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  set selectedTab(int value) {
    _selectedTab = value;
  }

  List<NavModel> items = [];

  bool sosActive = false;
  Gradient _gradient = LinearGradient(colors: [
    const Color.fromRGBO(251, 111, 146, 1),
    const Color.fromRGBO(255, 143, 171, 1)
  ]);

  Gradient _gradient2 = LinearGradient(colors: [
    Color.fromARGB(255, 37, 159, 70),
    Color.fromARGB(255, 37, 159, 70)
  ]);

  Icon icon1 = Icon(
    Icons.crisis_alert_rounded,
    size: 30,
    color: Colors.white,
  );
  Icon icon2 = Icon(
    Icons.close,
    size: 30,
    color: Colors.white,
  );

  @override
  void initState() {
    super.initState();
    items = [
      NavModel(
        page: HomePage(),
        navKey: homeNavKey,
      ),
      NavModel(
        page: CatatanHaid(),
        navKey: haidNavKey,
      ),
      NavModel(
        page: PanggilPuan(),
        navKey: panggilNavKey,
      ),
      NavModel(
        page: More(),
        navKey: moreNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      // title: Text("My title"),
      content: Text(
        "Your Location is Now Shared to Your Contacts",
        style: TextStyle(
            fontFamily: 'Satoshi', fontWeight: FontWeight.bold, fontSize: 15),
      ),
      actions: [
        // okButton,
      ],
      // backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.only(top: 440, left: 80, right: 80),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
    );

    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
        body: IndexedStack(
          index: selectedTab,
          children: items
              .map((page) => Navigator(
                    key: page.navKey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.page)
                      ];
                    },
                  ))
              .toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(top: 10),
          height: 64,
          width: 64,
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.transparent,
            // shape: RoundedRectangleBorder(
            //   side: const BorderSide(
            //       width: 0, color: Color.fromRGBO(237, 237, 237, 1)),
            //   borderRadius: BorderRadius.circular(100),
            // ),
            child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: sosActive ? _gradient2 : _gradient),
                child: sosActive ? icon2 : icon1),
            onPressed: () {
              setState(() {
                sosActive = !sosActive;
                if (sosActive) {
                  showDialog(
                      barrierColor: Color(0x01000000),
                      context: context,
                      builder: (BuildContext context) {
                        Future.delayed(Duration(seconds: 3), () {
                          Navigator.of(context).pop(true);
                        });
                        return alert;
                      });
                }
              });
              isInstalled();
              share();
            },
          ),
          // FloatingActionButton(
          //   backgroundColor: AppColors.pink1,
          //   elevation: 0,
          //   onPressed: () => debugPrint("Add Button pressed"),
          //   shape: RoundedRectangleBorder(
          //     // side: const BorderSide(
          //     //   width: 3,
          //     //   color: Color.fromRGBO(237, 237, 237, 1),
          //     // ),
          //     borderRadius: BorderRadius.circular(100),
          //   ),
          //   child: const Icon(
          //     Icons.crisis_alert_rounded,
          //     color: Color.fromARGB(255, 255, 255, 255),
          //     size: 40,
          //   ),
          // ),
        ),
        bottomNavigationBar: selectedTab == 99
            ? null
            : NavBar(
                pageIndex: selectedTab,
                onTap: (index) {
                  if (index == selectedTab) {
                    items[index]
                        .navKey
                        .currentState
                        ?.popUntil((route) => route.isFirst);
                  } else {
                    setState(() {
                      selectedTab = index;
                    });
                  }
                },
              ),
      ),
    );
  }

  Future<void> isInstalled() async {
    final val =
        await WhatsappShare.isInstalled(package: Package.businessWhatsapp);
    print('Whatsapp Business is installed: $val');
  }

  Future<void> share() async {
    await WhatsappShare.share(
      text: 'Whatsapp share text',
      linkUrl: 'https://flutter.dev/',
      phone: '085773030388',
    );
  }
}
