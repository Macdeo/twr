// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  const Banners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 10,
            width: 50,
            color: Color(0xFFe2007b),
          ),
        ),
        Expanded(
          child: Container(
            height: 10,
            width: 50,
            color: Color(0xFF3f9de0),
          ),
        ),
        Expanded(
          child: Container(
            height: 10,
            width: 50,
            color: Color(0xFF78b74d),
          ),
        ),
        Expanded(
          child: Container(
            height: 10,
            width: 50,
            color: Color(0xFFa20b7c),
          ),
        ),
        Expanded(
          child: Container(
            height: 10,
            width: 50,
            color: Color(0xFFf37404),
          ),
        ),
        Expanded(
          child: Container(
            height: 10,
            width: 50,
            color: Color(0xFFe2007b),
          ),
        ),
        Expanded(
          child: Container(
            height: 10,
            width: 50,
            color: Color(0xFF3f9de0),
          ),
        ),
        Expanded(
          child: Container(
            height: 10,
            width: 50,
            color: Color(0xFF78b74d),
          ),
        ),
      ],
    );
  }
}
