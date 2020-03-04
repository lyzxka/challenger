import 'dart:async';
import 'package:challenger/pages/Ad.dart';
import 'package:challenger/pages/AppIndex.dart';
import 'package:challenger/router.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        primarySwatch: Colors.grey,
        brightness: Brightness.light,
        primaryColor: Colors.white,
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.1),
        primaryTextTheme: TextTheme(
          body1: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,),
        ),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: TextStyle(color: Colors.black54,fontSize: 20,fontWeight:FontWeight.w600)
          ),
        ),
      ),
      home: Ad(),
    );
  }
}
