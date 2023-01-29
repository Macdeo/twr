// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../Menu/menuapp.dart';
import '../theme/banner.dart';

class Contact extends StatefulWidget {
  Contact({this.app});
  final FirebaseApp? app;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  // const Contact({Key? key}) : super(key: key);
  Banners banners = Banners();

  MenuApp menuApp = MenuApp();

  final referenceDatabase = FirebaseDatabase.instance;

  // final databaseReference = FirebaseDatabase.instance.ref();
  // DatabaseReference dataRef = databaseReference.child("your_node_name");

  // Query dbRef = FirebaseDatabase.instance.ref().child(
  //     'https://thewaitingroom-6f4c0-default-rtdb.europe-west1.firebasedatabase.app/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0XFFEEE4FF),
          title: Text(
            'Housing and Homelessness',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          actions: [menuApp]),
      body: SafeArea(
          child: Column(
        children: [
          banners,
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomsCard(
                    titles: 'Focus Housing Ltd',
                    subtitles:
                        'Provision of Social Housing to Adults with Substance Misuse, Alcohol Issues and Homelessness'),
                SizedBox(
                  height: 10,
                ),
                CustomsCard(
                    titles: 'Birmingham City Council - Housing',
                    subtitles: 'Housing support - advice'),
                SizedBox(
                  height: 10,
                ),
                CustomsCard(
                    titles: 'MyBnk - The Money House',
                    subtitles:
                        'Helps young people in, or about to move into, independent housing manage their money & maintain their tenancy. Finance / Education'),
                SizedBox(
                  height: 10,
                ),
                CustomsCard(
                    titles: 'Witton Lodge Community Association',
                    subtitles:
                        'Local community housing & support based in Perry Common'),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class CustomsCard extends StatelessWidget {
  // const CustomCard({Key? key}) : super(key: key);

  final String titles;
  final String subtitles;

  CustomsCard({required this.titles, required this.subtitles, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            tileColor: Color(0xFF4cc3f4),
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  titles,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                subtitles,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Ink(
                height: 45,
                decoration: ShapeDecoration(
                  color: Color(0xFF3c7bff),
                  shape: RoundedRectangleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.call),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
              Ink(
                height: 45,
                decoration: ShapeDecoration(
                  color: Color(0xFF3c7bff),
                  shape: RoundedRectangleBorder(),
                ),
                child: TextButton(
                  child: Text(
                    'Website',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  onPressed: () {},
                ),
              ),
              Ink(
                // height: 50,
                decoration: ShapeDecoration(
                  color: Color(0xFF3b5998),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
              Ink(
                decoration: ShapeDecoration(
                  color: Color(0xff83c3f3),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
              Ink(
                decoration: ShapeDecoration(
                  color: Color(0xFF0077b5),
                  shape: CircleBorder(),
                ),
                child: TextButton(
                  child: Text(
                    'in',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                ),
              ),
              Ink(
                decoration: ShapeDecoration(
                  color: Colors.red,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
