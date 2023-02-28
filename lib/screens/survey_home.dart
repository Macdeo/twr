// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, avoid_print

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

import '../Menu/navbar.dart';
import 'aboutus.dart';
import 'home.dart';
import 'news.dart';
import 'survey_question.dart';

class SurveyHome extends StatefulWidget {
  @override
  State<SurveyHome> createState() => _SurveyHomeState();
}

class _SurveyHomeState extends State<SurveyHome> {
  // const SurveyHome({Key? key}) : super(key: key);
  var size, height, width;

  int? currentIndex;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    currentIndex = 3;
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
            builder: (BuildContext context) => News(),
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
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return LayoutBuilder(builder: (_, c) {
      final width = c.maxWidth;
      var fontSizeBold = 25.0;
      var fontSize = 20.0;
      if (width <= 480) {
        fontSizeBold = 25.0;
        fontSize = 20.0;
      } else if (width > 480 && width <= 960) {
        fontSizeBold = 40.0;
        fontSize = 30.0;
      } else {
        fontSizeBold = 40.0;
        fontSize = 30.0;
      }
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFC5A2FF),
                Color(0xFF95ACFF),
                Colors.white,
              ],
            ),
          ),
          child: SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Let us know your views',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Expanded(
                flex: 6,
                child: Image.asset('assets/images/smileys.jpg',
                    scale: 0.85, fit: BoxFit.cover),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'In order to capture your experience, we would like you to give us some feedback.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: fontSizeBold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22.0),
                          child: Text(
                            'Please fill out the quick survey',
                            style: TextStyle(
                              fontSize: fontSize,
                              fontFamily: 'Montserrat-Medium',
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Container(
                            width: width * 0.8,
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SurveyQuestion()),
                                );
                              },
                              child: Text(
                                'Start',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF7F53AC),
                                  fixedSize: Size(380, 70),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          // fabLocation: BubbleBottomBarFabLocation.end, //new
          hasNotch: true, //new
          hasInk: true, //new, gives a cute ink effect
          inkColor:
              Colors.black12, //optional, uses theme color if not specified
          currentIndex: currentIndex,
          onTap: changePage,
          backgroundColor: Colors.white,
          items: <BubbleBottomBarItem>[
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
    });
  }
}
