import 'package:challenger/component/MatchItem.dart';
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
              MatchItem(itemId: 1,title: "1111",date: "2019-12-31"),
              MatchItem(itemId: 2,title: "1111",date: "2019-12-31"),
              MatchItem(itemId: 3,title: "1111",date: "2019-12-31"),
              MatchItem(itemId: 4,title: "1111",date: "2019-12-31"),
              MatchItem(itemId: 5,title: "1111",date: "2019-12-31"),
            ],
          ),
        )
      ],
    );
  }
}