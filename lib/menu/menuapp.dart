// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../main.dart';
import '../menu/menuservices.dart';
import '../screens/contact.dart';
import 'menulist.dart';

class MenuApp extends StatelessWidget {
  // const MenuApp({Key? key}) : super(key: key);
  MenuList menuList = MenuList();
  TextStyle appBarMenuStyle =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //     itemCount: 5,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Column(
    //          children: [
    //       ...(categories!.map((item) => CustomSizedBox(
    //           colors: menuList.menuColors[item?["colorIndex"]].menuColor,
    //           text: item?["label"],
    //           onPress: () => NavigationService().navigateToScreen(Contact(
    //                 reference: item?["key"],
    //                 title: item?["label"],
    //               ))))),
    //     ]
    //       );
    //     });

    return Material(
      child: PopupMenuButton(
        icon: Icon(
          Icons.menu_sharp,
          color: Colors.black,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[0].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[1].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[2].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[3].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[4].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[5].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[6].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[7].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[8].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[9].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[10].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[11].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[12].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[13].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[14].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[15].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[16].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[17].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[18].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[19].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[20].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[21].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[22].title),
              textStyle: appBarMenuStyle,
            ),
            PopupMenuItem<int>(
              onTap: () {},
              child: Text(menuList.menu[23].title),
              textStyle: appBarMenuStyle,
            ),
          ];
        },
        color: Colors.white,
      ),
    );
  }
}
