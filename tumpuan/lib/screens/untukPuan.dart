import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:tumpuan/components/contactBox.dart';
import 'package:tumpuan/components/listCard.dart';
import 'package:tumpuan/components/searchCard.dart';
import 'package:tumpuan/styles/style.dart';
import 'package:sticky_headers/sticky_headers.dart';

class UntukPuan extends StatefulWidget {
  const UntukPuan({super.key});

  @override
  State<UntukPuan> createState() => _UntukPuanState();
}

class _UntukPuanState extends State<UntukPuan> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(suffixIcon: Icon(Icons.search)),
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Container(
          //   height: 175,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage("images/bannerUntukPuan.png"))),
          // ),
          SafeArea(
            bottom: false,
            child: ListView(
              controller: _controller,
              children: [
                const SearchCard(),
                StickyHeader(
                  controller: _controller,
                  header: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          // MenuCard(text: "Italy", color: Colors.orange),
                          // MenuCard(text: "France", color: Colors.pink)
                        ],
                      ),
                    ),
                  ),
                  content: const ListCard(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final ScrollController _controller = ScrollController();

void _scrollDown() {
  _controller.animateTo(
    _controller.position.maxScrollExtent,
    duration: Duration(seconds: 2),
    curve: Curves.fastOutSlowIn,
  );
}
