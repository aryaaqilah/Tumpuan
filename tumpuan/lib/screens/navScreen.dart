import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tumpuan/screens/HomePage.dart';
import 'package:tumpuan/screens/catatanHaid.dart';
import 'package:tumpuan/screens/more.dart';
import 'package:tumpuan/screens/nav_bar.dart';
import 'package:tumpuan/screens/nav_model.dart';
import 'package:tumpuan/screens/panggilPuan.dart';
import 'package:tumpuan/styles/style.dart';
import 'package:whatsapp_share/whatsapp_share.dart';
import 'package:whatsapp/whatsapp.dart';
import 'package:geolocator/geolocator.dart';
import 'package:telephony/telephony.dart';
import 'package:direct_sms/direct_sms.dart';
import 'package:permission_handler/permission_handler.dart';

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

  WhatsApp whatsapp = WhatsApp();
  String? _currentAddress;
  Position? _currentPosition;
  static const platform = const MethodChannel('sendSms');
  final Telephony telephony = Telephony.instance;
  var directSms = DirectSms();

  final List listNum = [
    '6285773030388',
    '6281368701176',
    '62895334296207',
    '6288269841977'
  ];

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
                        location();
                        return alert;
                      });
                }
              });
              // isInstalled();
              location();
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

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> location() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('test');
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });

    print('LAT: ${_currentPosition?.latitude ?? ""}');
    print('LNG: ${_currentPosition?.longitude ?? ""}');

    _launchUrl(_currentPosition?.latitude, _currentPosition?.longitude);
  }

  Future<void> _launchUrl(double? lat, double? long) async {
    Uri _url = Uri.parse('https://www.google.com/maps/search/${lat},${long}');
    print(_url);
    // if (!await launchUrl(_url)) {
    //   throw Exception('Could not launch $_url');
    // }

    // sendSms(_url);
    // telephony.sendSmsByDefaultApp(to: "6285773030388", message: "${_url}");
    final permission = Permission.sms.request();
    if (await permission.isGranted) {
      for (var i = 0; i < listNum.length; i++) {
        directSms.sendSms(message: "${_url}", phone: "${listNum[i]}");
      }
    }
  }
}
