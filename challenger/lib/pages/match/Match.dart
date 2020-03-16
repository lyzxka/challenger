import 'dart:async';

import 'package:challenger/Global.dart';
import 'package:challenger/component/BottomLabel.dart';
import 'package:challenger/component/MatchItem.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/model/MatchGlobal.dart';
import 'package:challenger/pages/match/TopTab.dart';
import 'package:challenger/utils/baseUtils.dart';
import 'package:challenger/utils/provider/ChangeNotifierProvider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-21 9:37
/// description: 
class Match extends StatefulWidget {
  MatchState createState() => MatchState();
}

class MatchState extends State<Match> {
  List<Widget> initList=[];
  int page;
  int currentPage=1;
  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
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
                  ChangeNotifierProvider.of<MatchGlobal>(context).getList(ChangeNotifierProvider.of<MatchGlobal>(context).currentCategoryId, 1);
                   await Future<int>.delayed(Duration(seconds: 2),(){
//                    getData(Global.matchCurrentTopTap, currentPage);
                    return 1;
                  });
                   print("更新了${ChangeNotifierProvider.of<MatchGlobal>(context).currentCategoryId}");
                  return null;
                }),
                notificationPredicate:((ScrollNotification notification){
                  double progress = notification.metrics.maxScrollExtent-notification.metrics.pixels;
                  if(notification.metrics.axisDirection==AxisDirection.down&&progress<10){
                    print("分页更新${currentPage+1}");
                    if(progress<=200){
                      ChangeNotifierProvider.of<MatchGlobal>(context).getList(ChangeNotifierProvider.of<MatchGlobal>(context).currentCategoryId,ChangeNotifierProvider.of<MatchGlobal>(context).currentPage+1);
                    }
                  }
                  return true;
                }),
                color: Colors.blue,
                child: ListView.builder(
                  addAutomaticKeepAlives: false,
                  itemCount: ChangeNotifierProvider.of<MatchGlobal>(context).data.isEmpty
                      ?initList.length:ChangeNotifierProvider.of<MatchGlobal>(context).data.length,
                  itemBuilder: (BuildContext context, int position) {
                    return ChangeNotifierProvider.of<MatchGlobal>(context).data.isEmpty
                        ?initList[position]:ChangeNotifierProvider.of<MatchGlobal>(context).data[position];
                  }
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void initData() async{
    Response response = await Dio().post(
        Constant.API_URL + "/app/match/list",
        data: {
          "categoryId": 0,
          "page": 1,
          "limit": 10
        }
    );
    if (response.data['code'] == 0) {
      var list = response.data['data'];
      list.forEach((item){
        initList.add(MatchItem(
            id: item['id'],
            title: item['title'],
            content: item['content'],
            img: item['imgUrl'],
            looks: item['views']));
      });
    }
    setState(() {

    });
  }
}