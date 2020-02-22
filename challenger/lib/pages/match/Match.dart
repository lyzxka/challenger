import 'package:challenger/component/BottomLabel.dart';
import 'package:challenger/component/HomeMatchItem.dart';
import 'package:challenger/component/MatchItem.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/model/MatchGlobal.dart';
import 'package:challenger/pages/match/TopTab.dart';
import 'package:challenger/utils/provider/ChangeNotifierProvider.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-21 9:37
/// description: 
class Match extends StatefulWidget {
  MatchState createState() => MatchState();
}

class MatchState extends State<Match> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MatchGlobal>(
      data: MatchGlobal(),
      child: Builder(builder: (context){
        return Stack(
          children: <Widget>[
            TopTab(),
            Positioned(
                top: 50,bottom: 0,
                left: 0,right: 0,
                child: RefreshIndicator(
                  // 下拉刷新事件
                  onRefresh: (() async {
                    await Future<int>.delayed(Duration(seconds: 3),(){
                      print("更新了${ChangeNotifierProvider.of<MatchGlobal>(context).currentTopTab}");
                      return 1;
                    });
                    return null;
                  }),
                  color: Colors.blue,
                  child:ListView(
                    children: <Widget>[
                      MatchItem(id:1,title: "齐鲁软件设计大赛",content: "这是山东省内的比赛",img: Constant.ASSETS_IMG+"default_head_icon.jpg",looks: "1111"),
                      MatchItem(id:1,title: "齐鲁软件设计大赛",content: "这是山东省内的比赛",img: Constant.ASSETS_IMG+"default_head_icon.jpg",looks: "1111"),
                      MatchItem(id:1,title: "齐鲁软件设计大赛",content: "这是山东省内的比赛",img: Constant.ASSETS_IMG+"default_head_icon.jpg",looks: "1111"),
                      MatchItem(id:1,title: "齐鲁软件设计大赛",content: "这是山东省内的比赛",img: Constant.ASSETS_IMG+"default_head_icon.jpg",looks: "1111"),
                      MatchItem(id:1,title: "齐鲁软件设计大赛",content: "这是山东省内的比赛",img: Constant.ASSETS_IMG+"default_head_icon.jpg",looks: "1111"),
                      BottomLabel(),
                    ],
                  ),
                )
            )
          ],
        );
      }),
    );
  }
}