import 'package:challenger/component/BottomLabel.dart';
import 'package:challenger/component/MatchItem.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/model/MatchGlobal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// author: zzxka
/// date: 2020/3/1
/// description:  比赛接口
class MatchHttp {

//  int currentPage=MatchGlobal.currentCategoryId;


  /*static getList (num categoryId,int page) async {
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
        print("更新前" + MatchGlobal.initList.length.toString());
        if (page == 1) {
          MatchGlobal.initList = [];
          MatchGlobal.initList = newData;
        } else {
          MatchGlobal.initList.addAll(newData);
        }
        print("更新后" + MatchGlobal.initList.length.toString());
        if (newData.length < 10) {
          MatchGlobal.initList.add(BottomLabel());
        }
      } else {
        // TODO 后期可以加一下获取数据为空的提示
//        list=[];
      }
    } else {}
  }*/
}