// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'menulist.dart';

class TestMenuService extends StatelessWidget {
  // const MenuService({ Key? key }) : super(key: key);

  MenuList menuList = MenuList();

  int calindex(int i) {
    for (i = 0; i <= menuList.menuColors.length - 1; i++) {
      // i = menuList.menuColors.length;
      print(i);
    }

    return i;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 82,
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TestCustomSizedBox(
                colors: menuList.menuColors[index].menuColor,
                text: menuList.menu[0].title,
                onPress: menuList.menu[0].page),
            TestCustomSizedBox(
                colors: menuList.menuColors[index].menuColor,
                text: menuList.menu[1].title,
                onPress: menuList.menu[1].page),
          ],
        );
      },
    );
  }
}

class TestCustomSizedBox extends StatelessWidget {
  // const CustomSizedBox({Key? key}) : super(key: key);
  MenuList menuList = MenuList();

  final List<Color> colors;
  final String text;
  final void Function() onPress;

  TestCustomSizedBox(
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
