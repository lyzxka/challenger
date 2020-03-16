
import 'package:challenger/component/BottomLabel.dart';
import 'package:challenger/component/SearchFriendsItem.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

/// author: zzxka
/// date: 2020/3/13
/// description: 
class SearchFriendGlobal extends ChangeNotifier{
  List<Widget> data=[];
  int currentPage=1;
  String matchName="";
  bool updating=false;

  getList (String matchName,int page) async {
    if (updating) {
      print("更新中");
      return ;
    }
    updating = true;
    if(""==matchName&&page==2&&data.length==0){
      updating=false;
      getList(null, 1);
      return;
    }
    Response response = await Dio().post(
        Constant.API_URL + "/app/group/groupSearchList",
        data: {
          "matchName": matchName,
          "page": page,
          "limit": 10
        }
    );
    if (response.data['code'] == 0) {
      var list = response.data['data'];
      if(page==1){
        data = [];
      }
      if (list.isNotEmpty) {
        List<Widget> newData = [];
        list.forEach((item) {
          newData.add(SearchFriendsItem(
              id: item['id'],
              userName: item['userName'],
              content: item['content'],
              userIcon: item['userIcon'],
              date: item['createDate'],
              matchName: item['matchName']));
        });
        data.addAll(newData);
        if (newData.length < 10) {
          data.add(BottomLabel(text: "已经到底了",));
        }
        currentPage = page;
      } else {
        if(page==1){
          data.add(BottomLabel(text: "当前没有数据",));
        }
      }

    } else {}
    updating = false;
    notifyListeners();
  }

}