// ignore_for_file: prefer_const_constructors

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:twr/screens/contact.dart';

import '../Menu/menuapp.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../menu/navbar.dart';
import 'aboutus.dart';
import 'home.dart';
import 'survey_home.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  MenuApp menuApp = MenuApp();

  int? currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 2;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
      print(currentIndex);
    });

    switch (currentIndex) {
      case 0:
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => Home(),
          ),
          (route) => false, //if you want to disable back feature set to false
        );
        break;
      case 1:
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => AboutUs(),
          ),
          (route) => false, //if you want to disable back feature set to false
        );
        break;
      case 2:
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => Contact(),
          ),
          (route) => false, //if you want to disable back feature set to false
        );
        break;
      case 3:
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => SurveyHome(),
          ),
          (route) => false, //if you want to disable back feature set to false
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0XFFEEE4FF),
          title: Text(
            'News',
            style: TextStyle(color: Colors.black),
          ),
          actions: [menuApp]),
      body: WebView(
        initialUrl: 'https://the-waitingroom.org/news/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        // fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        currentIndex: currentIndex,
        onTap: changePage,
        backgroundColor: Colors.white,
        items: const <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Color.fromARGB(255, 122, 1, 72),
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Color.fromARGB(255, 122, 1, 72),
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Color.fromARGB(255, 56, 31, 99),
              icon: Icon(
                Icons.people,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.people,
                color: Color.fromARGB(255, 56, 31, 99),
              ),
              title: Text("About Us")),
          BubbleBottomBarItem(
              backgroundColor: Color.fromARGB(255, 27, 35, 80),
              icon: Icon(
                Icons.radio,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.radio,
                color: Color.fromARGB(255, 27, 35, 80),
              ),
              title: Text("News")),
          BubbleBottomBarItem(
              backgroundColor: Color.fromARGB(255, 30, 71, 32),
              icon: Icon(
                Icons.poll,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.poll,
                color: Color.fromARGB(255, 30, 71, 32),
              ),
              title: Text("Survey"))
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: FloatButton(),
    );
  }
}
