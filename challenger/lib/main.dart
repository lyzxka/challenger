import 'package:challenger/pages/Ad.dart';
import 'package:challenger/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 展示广告页
  bool showAd=false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'challenger',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Stack(
        children: <Widget>[
          // 控制child展示  true为不展示
          Offstage(
            child: Home(),
            offstage: !showAd,
          ),
          Offstage(
            child: Ad(),
            offstage: showAd,
          ),
        ],
      ),
    );
  }
}
