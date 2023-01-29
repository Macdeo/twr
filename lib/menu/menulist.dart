// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:twr/Menu/color.dart';
import 'package:twr/Menu/menu.dart';
import 'package:twr/screens/contact.dart';

import '../main.dart';

class MenuList {
  final List<Menu> menu = [
    Menu(
        title: 'Housing & Homelessness',
        page: () {
          NavigationService().navigateToScreen(Contact());
          print('hello');
        }),
    Menu(title: 'Criminal Justice', page: () {}),
    Menu(title: 'Help Lines', page: () {}),
    Menu(title: 'Mental Health', page: () {}),
    Menu(title: 'Later Life', page: () {}),
    Menu(title: 'Abuse', page: () {}),
    Menu(title: 'General / Directories', page: () {}),
    Menu(title: 'Addictions', page: () {}),
    Menu(title: 'Communities', page: () {}),
    Menu(title: 'Sexuality', page: () {}),
    Menu(title: 'Supporting Families', page: () {}),
    Menu(title: 'Leisure', page: () {}),
    Menu(title: 'Disability Support', page: () {}),
    Menu(title: 'Mens Health', page: () {}),
    Menu(title: 'Faith Communities', page: () {}),
    Menu(title: 'Welfare Advice', page: () {}),
    Menu(title: 'Sexual Health', page: () {}),
    Menu(title: 'Therapeutic Support', page: () {}),
    Menu(title: 'Virtual Support', page: () {}),
    Menu(title: 'Suicide Prevention', page: () {}),
    Menu(title: 'Carers', page: () {}),
    Menu(title: 'Womens Health', page: () {}),
    Menu(title: 'Education & Employment', page: () {}),
    Menu(title: 'Children & Young People', page: () {}),
  ];

  final List<MenuColors> menuColors = [
    MenuColors(menuColor: [Color(0XFF8DC73F), Color(0XFF333333)]),
    MenuColors(menuColor: [Color(0XFFF36523), Color(0XFF333333)]),
    MenuColors(menuColor: [Color(0XFF00ADEF), Color(0XFF333333)]),
    MenuColors(menuColor: [Color(0XFFEE018D), Color(0XFF333333)]),
    MenuColors(menuColor: [Color(0XFFD663FF), Color(0XFF333333)]),
    MenuColors(menuColor: [Color(0XFFFFB13D), Color(0XFF333333)]),
    MenuColors(menuColor: [Color(0XFFFFED4A), Color(0XFF333333)]),
  ];
}
