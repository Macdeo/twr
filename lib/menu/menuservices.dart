// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:twr/main.dart';
import 'menulist.dart';
import 'package:twr/screens/contact.dart';

class MenuService extends StatelessWidget {
  const MenuService({Key? key, this.categories}) : super(key: key);

  final List<dynamic>? categories;

  @override
  Widget build(BuildContext context) {
    final MenuList menuList = MenuList();

    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          ...(categories!.map((item) => CustomSizedBox(
              colors: menuList.menuColors[item?["colorIndex"]].menuColor,
              text: item?["label"],
              onPress: () => NavigationService().navigateToScreen(Contact(
                    reference: item?["key"],
                    title: item?["label"],
                  ))))),
        ]);
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
