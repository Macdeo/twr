// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../main.dart';
import '../menu/menuservices.dart';
import '../screens/contact.dart';
import '../screens/home.dart';
import 'menulist.dart';

class MenuApp extends StatefulWidget {
  const MenuApp({Key? key}) : super(key: key);

  @override
  State<MenuApp> createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseService() {}
  
  List allCategories = [];

  Future<void> getCategories() async {
    try {
      QuerySnapshot querySnapshot =
          await _db.collection("categories").orderBy("label").get();

      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

      setState(() {
        allCategories = allData;
      });
    } catch (e) {
      print(e);
    }
  }

  MenuList menuList = MenuList();
  Home getHome = Home();
  TextStyle appBarMenuStyle =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: PopupMenuButton(
        icon: Icon(
          Icons.menu_sharp,
          color: Colors.black,
        ),
        itemBuilder: (context) {
          return [
            ...(allCategories.map(
              (item) => PopupMenuItem<int>(
                onTap: () async {
                  final navigator = Navigator.of(context);
                  await Future.delayed(Duration.zero);
                  navigator.push(
                    MaterialPageRoute(
                        builder: (_) => Contact(
                            reference: item?["key"],
                            title: item?["label"]
                            ),
                            ),
                  );
                },
                child: Text(item["label"]),
                textStyle: appBarMenuStyle,
              ),
            ))
          ];
        },
        color: Colors.white,
      ),
    );
  }
}

class CustomListName extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);
  final String text;
  final void Function() onPress;

  CustomListName({required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Text(text),
    );
  }
}
