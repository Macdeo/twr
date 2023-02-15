// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Menu/menuapp.dart';
import '../theme/banner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'conwebsite.dart';

class Contact extends StatefulWidget {
  final String? reference;
  final String? title;
  Contact({this.reference, this.title});

  @override
  State createState() =>
      _ContactState(reference: this.reference, title: this.title);
}

class _ContactState extends State<Contact> {
  final String? reference;
  final String? title;

  _ContactState({this.reference, this.title});

  Banners banners = Banners();

  MenuApp menuApp = MenuApp();

  List contacts = [];

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseService() {}

  // _makingPhoneCall() async {
  //   var url = Uri.parse(item!["directory_number"]);
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Future<void> getContacts() async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection("contacts/categories/$reference")
          .orderBy("post_title")
          .get();
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

      setState(() {
        contacts = allData;
      });
    } catch (e) {
      // print(e);
    }
  }

  Future<void> populateTor() async {
    // print(" this functions exists to populate firestore db");

    final FirebaseFirestore _db = FirebaseFirestore.instance;

    final List<Map<String, dynamic>> populatingList = [
      {
        "ID": "string",
        "post_title": "string",
        "post_excerpt": "string",
        "directory_number": "string",
        "directory_url": "string",
        "post_category": "string",
        "post_type": "string",
        "post_status": "string"
      }
    ];

    for (var i = 0; i < populatingList.length; i = i + 1) {
      if (populatingList[i]["post_category"].toString().toLowerCase() ==
          title.toString().toLowerCase()) {
        await _db.collection("contacts/categories/$reference").doc().set({
          "directory_number": populatingList[i]["directory_number"],
          "directory_url": populatingList[i]["directory_url"],
          "post_category": populatingList[i]["post_category"],
          "post_excerpt": populatingList[i]["post_excerpt"],
          "post_status": populatingList[i]["post_status"],
          "post_title": populatingList[i]["post_title"],
          "post_type": populatingList[i]["post_type"],
        });

        // print(populatingList[i]);
        // print("Data Inserted --------------");
      }
    }
  }

  @override
  void initState() {
    super.initState();

    getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: Color(0XFFEEE4FF),
          title: Text(
            ((title).toString()),
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          actions: [menuApp]),
      body: SafeArea(
          child: Column(
        children: [
          banners,
          Expanded(
            child: ListView(children: [
              ...contacts.map((item) => Column(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    CustomsCard(
                        titles: item!["post_title"],
                        subtitles: item!["post_excerpt"],
                        call: () async {
                          var url =
                              Uri.parse('tel:' + item!["directory_number"]);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        url: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      YourWebView(item!["directory_url"])));
                        }),
                    // phone: item!["directory_number"],
                    // url: item!["directory_url"]
                  ])),
            ]),
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
  final VoidCallback call;
  final VoidCallback url;

  CustomsCard(
      {required this.titles,
      required this.subtitles,
      required this.call,
      required this.url,
      Key? key})
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
                  onPressed: call,
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
                  onPressed: url,
                ),
              ),
              Ink(
                // height: 50,
                decoration: ShapeDecoration(
                  color: Color(0xFF3b5998),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.facebook,
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
                  icon: FaIcon(
                    FontAwesomeIcons.twitter,
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
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.white,
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
