// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'menulist.dart';

class MenuService extends StatelessWidget {
  // const MenuService({ Key? key }) : super(key: key);

  MenuList menuList = MenuList();

  // void calindex(int index) {
  //   for (index = 0; index <= menuList.menuColors.length - 1; index++) {
  //     index = menuList.menuColors.length;
  //     print(index);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: 82,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSizedBox(
                colors: menuList.menuColors[0].menuColor,
                text: menuList.menu[0].title,
                onPress: menuList.menu[0].page),
            CustomSizedBox(
                colors: menuList.menuColors[1].menuColor,
                text: menuList.menu[1].title,
                onPress: menuList.menu[1].page),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSizedBox(
                colors: menuList.menuColors[2].menuColor,
                text: menuList.menu[2].title,
                onPress: menuList.menu[2].page),
            CustomSizedBox(
                colors: menuList.menuColors[3].menuColor,
                text: menuList.menu[3].title,
                onPress: menuList.menu[3].page),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSizedBox(
                colors: menuList.menuColors[4].menuColor,
                text: menuList.menu[4].title,
                onPress: menuList.menu[4].page),
            CustomSizedBox(
                colors: menuList.menuColors[5].menuColor,
                text: menuList.menu[5].title,
                onPress: menuList.menu[5].page),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSizedBox(
                colors: menuList.menuColors[6].menuColor,
                text: menuList.menu[6].title,
                onPress: menuList.menu[6].page),
            CustomSizedBox(
                colors: menuList.menuColors[0].menuColor,
                text: menuList.menu[7].title,
                onPress: menuList.menu[7].page),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSizedBox(
                colors: menuList.menuColors[1].menuColor,
                text: menuList.menu[8].title,
                onPress: menuList.menu[8].page),
            CustomSizedBox(
                colors: menuList.menuColors[2].menuColor,
                text: menuList.menu[9].title,
                onPress: menuList.menu[9].page),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSizedBox(
                colors: menuList.menuColors[3].menuColor,
                text: menuList.menu[10].title,
                onPress: menuList.menu[10].page),
            CustomSizedBox(
                colors: menuList.menuColors[4].menuColor,
                text: menuList.menu[11].title,
                onPress: menuList.menu[11].page),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSizedBox(
                colors: menuList.menuColors[5].menuColor,
                text: menuList.menu[12].title,
                onPress: menuList.menu[12].page),
            CustomSizedBox(
                colors: menuList.menuColors[6].menuColor,
                text: menuList.menu[13].title,
                onPress: menuList.menu[13].page),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSizedBox(
                colors: menuList.menuColors[0].menuColor,
                text: menuList.menu[14].title,
                onPress: menuList.menu[14].page),
            CustomSizedBox(
                colors: menuList.menuColors[1].menuColor,
                text: menuList.menu[15].title,
                onPress: menuList.menu[15].page),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSizedBox(
                colors: menuList.menuColors[2].menuColor,
                text: menuList.menu[16].title,
                onPress: menuList.menu[16].page),
            CustomSizedBox(
                colors: menuList.menuColors[3].menuColor,
                text: menuList.menu[17].title,
                onPress: menuList.menu[17].page),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSizedBox(
                colors: menuList.menuColors[4].menuColor,
                text: menuList.menu[18].title,
                onPress: menuList.menu[18].page),
            CustomSizedBox(
                colors: menuList.menuColors[5].menuColor,
                text: menuList.menu[19].title,
                onPress: menuList.menu[19].page),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSizedBox(
                colors: menuList.menuColors[6].menuColor,
                text: menuList.menu[20].title,
                onPress: menuList.menu[20].page),
            CustomSizedBox(
                colors: menuList.menuColors[0].menuColor,
                text: menuList.menu[21].title,
                onPress: menuList.menu[21].page),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomSizedBox(
                colors: menuList.menuColors[1].menuColor,
                text: menuList.menu[22].title,
                onPress: menuList.menu[22].page),
            CustomSizedBox(
                colors: menuList.menuColors[2].menuColor,
                text: menuList.menu[23].title,
                onPress: menuList.menu[23].page),
          ],
        ),
      ],
    );
  }
}

class CustomSizedBox extends StatelessWidget {
  // const CustomSizedBox({Key? key}) : super(key: key);
  MenuList menuList = MenuList();

  final List<Color> colors;
  final String text;
  final void Function() onPress;

  CustomSizedBox(
      {required this.colors, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 70,
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors)),
        child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(primary: Colors.transparent),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
