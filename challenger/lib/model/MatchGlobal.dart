import 'package:challenger/Global.dart';
import 'package:challenger/component/BottomLabel.dart';
import 'package:challenger/component/MatchItem.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/http/MatchHttp.dart';
import 'package:challenger/utils/Toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-31 21:42
/// description: 比赛页面共享数据信息
class MatchGlobal extends ChangeNotifier {

  List<Widget> data=[];
  num currentCategoryId=0;
  int currentPage=1;
  bool updating=false;

  getList (num categoryId,int page) async {
    if (updating) {
      print("更新中");
      return ;
    }
    updating = true;
    if(categoryId==0&&page==2&&data.length==0){
      updating=false;
      getList(0, 1);
    }
    Response response = await Dio().post(
        Constant.API_URL + "/app/match/list",
        data: {
          "categoryId": categoryId,
          "page": page,
          "limit": 10
        }
    );
    if (response.data['code'] == 0) {
      var list = response.data['data'];
      if (list.isNotEmpty) {
        List<Widget> newData = [];
        list.forEach((item) {
          newData.add(MatchItem(
              id: item['id'],
              title: item['title'],
              content: item['content'],
              img: item['imgUrl'],
              looks: item['views']));
        });
        print("更新前" + data.length.toString());
        if (page == 1) {
          data = [];
          data = newData;
        } else {
          data.addAll(newData);
        }
        print("更新后" + data.length.toString());
        if (newData.length < 10) {
          data.add(BottomLabel(text: "已经到底了",));
        }
        currentPage = page;
        currentCategoryId = categoryId;
        print("当前页$currentPage===$currentCategoryId");
      } else {
        if(page==1){
          data.add(BottomLabel(text: "当前没有数据",));
        }
      }
    } else {}
    updating = false;
    notifyListeners();
  }

  List<Widget> initList=[];

  /*static initData(){
    MatchHttp.getList(0,1);
  }*/
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}