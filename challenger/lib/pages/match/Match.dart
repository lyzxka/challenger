import 'package:challenger/component/HomeMatchItem.dart';
import 'package:challenger/component/MatchItem.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/pages/match/TopTab.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-21 9:37
/// description: 
class Match extends StatefulWidget {
  MatchState createState() => MatchState();
}

class MatchState extends State<Match> {
  int  index=1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        TopTab(),
        Positioned(
          top: 50,bottom: 0,
          left: 0,right: 0,
          child: ListView(
            children: <Widget>[
              MatchItem(id:1,title: "sss",content: "sadasdasdas",img: Constant.ASSETS_IMG+"default_head_icon.jpg",looks: "1111")
            ],
          ),
        )
      ],
    );
  }
}