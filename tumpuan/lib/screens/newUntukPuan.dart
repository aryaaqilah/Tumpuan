import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:tumpuan/components/cardMore.dart';
import 'package:tumpuan/components/dataUntukPuan.dart';
import 'package:tumpuan/styles/style.dart';
import '../Widgets/sliver_list.dart';
import '../Widgets/sliver_list2.dart';
import '../Widgets/sliver_list3.dart';

class newUntukPuan extends StatefulWidget {
  const newUntukPuan({super.key});

  @override
  State<newUntukPuan> createState() {
    return _newUntukPuanState();
  }
}

class _newUntukPuanState extends State<newUntukPuan> {
  final ScrollController _scrollController = ScrollController();

  final DataUntukPuan = [
    ['Spa', 'image', 'Sentul'],
    ['Spa', 'image', 'Sentul'],
    ['Spa', 'image', 'Sentul'],
  ];

  final dataUser = ['Nixonnn', 'images/profilePict.png', '12345'];

  final PageController controller = PageController();
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    Widget konten = getDataUntukPuan(DataUntukPuan);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.search, color: Colors.black)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: false,
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          controller: _scrollController,
          children: [
            // SearchCard(),
            Container(
                child: Card(child: Image.asset('images/bannerUntukPuan.png'))),
            StickyHeader(
              controller: _scrollController,
              header: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: NavBar(
                          onTabChanged: (index) {
                            controller.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          currentTab: currentTab,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              content: Container(
                height: (260 * DataUntukPuan.length) + 120,
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentTab = index;
                    });
                  },
                  children: [konten, konten, konten],
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({Key? key, required this.onTabChanged, required this.currentTab})
      : super(key: key);

  final void Function(int) onTabChanged;
  final int currentTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTab('Spa & Massage', 0),
        _buildTab('Saloon', 1),
        _buildTab('Food', 2),
      ],
    );
  }

  Widget _buildTab(String text, int index) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () => onTabChanged(index),
      child: Text(
        text,
        style: TextStyle(
          color: currentTab == index
              ? const Color.fromRGBO(251, 111, 146, 1)
              : Colors.grey,
          fontSize: 12,
        ),
      ),
    );
  }
}
