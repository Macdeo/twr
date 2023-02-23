// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:twr/Menu/menuapp.dart';
import 'package:twr/Menu/menuservices.dart';
import 'package:twr/menu/menulist.dart';
import 'package:twr/menu/navbar.dart';
import 'package:twr/menu/testmenu.dart';
import 'package:twr/screens/aboutus.dart';
import 'package:twr/screens/news.dart';
import 'package:twr/screens/survey_home.dart';
import 'package:twr/theme/banner.dart';
import 'package:twr/components/slider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Sliders sliders = Sliders();
  Banners banners = Banners();
  MenuApp menuApp = MenuApp();
  TestMenuService testMenuService = TestMenuService();
  final MenuList menuList = MenuList();
  final TextEditingController search = TextEditingController();

  int? currentIndex;
  bool searchable = false;

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseService() {}
  List allDocData = [];
  List? filteredData = [];

  Future<void> getCategories() async {
    try {
      List<dynamic> data = [];
      QuerySnapshot querySnapshot =
          await _db.collection("categories").orderBy("label").get();

      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

      List<dynamic> modifiedData = [];

      for (var i = 0; i < allData.length; i = i + 1) {
        final currentData = allData[i];

        int colorIndex = 0;

        final int lastColorIndex = (i == 0)
            ? 0
            : modifiedData[modifiedData.length - 1]!["colorIndex"] as int;

        if (i > 0) {
          if ((lastColorIndex < (menuList.menuColors.length - 1)) && (i != 0)) {
            colorIndex = lastColorIndex + 1;
          } else {
            colorIndex = 0;
          }
        }

        final newData = {...(currentData as dynamic), "colorIndex": colorIndex};

        modifiedData.add(newData);
      }

      setState(() {
        allDocData = modifiedData;
        searchable = true;
        filteredData = modifiedData;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
    getCategories();
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

  void searchData() {
    setState(() {});
  }

  // void searchContact(String query){
  //   final suggestions = allDocData.where((element) => false);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0XFFEEE4FF),
          title: Text(
            'The Waiting Room',
            style: TextStyle(color: Colors.black),
          ),
          actions: [menuApp]),
      body: SafeArea(
        child: Column(
          children: [
            banners,
            sliders,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (e) {
                    List<dynamic> list = [];
                    int length = allDocData.length | 0;

                    if ( !searchable ) return;

                    for (var i = 0; i < length; i = i + 1) {
                      
                      final currentData = allDocData[i];

                      bool compare = currentData!["label"].toString().toLowerCase().contains(e.toLowerCase());

                      if ( compare ) {

                        list.add(currentData);

                      }

                    }

                    setState(() {
                        
                      filteredData = list;

                    });

                  },
                ),
              ),
            ),
            Expanded(child: MenuService(categories: filteredData )),
          ],
        ),
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatButton(),
    );
  }
}
