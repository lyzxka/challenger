import 'package:challenger/component/BottomLabel.dart';
import 'package:challenger/component/SearchFriendsItem.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/pages/group/SearchFriendTopSearch.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-02-02 22:44
/// description: 
class SearchFriend extends StatefulWidget {
  SearchFriendState createState() => SearchFriendState();
}

class SearchFriendState extends State<SearchFriend> {
  String city="请选择城市";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SearchFriendTopSearch(),
        Positioned(
          top: 52,bottom: 0,
          left: 0,right: 0,
          child: RefreshIndicator(
            color: Colors.blue,
            onRefresh: (() async {
              await Future<int>.delayed(Duration(seconds: 3),(){
                print("志友首页更新了");
                return 1;
              });
              return null;
            }),
            child: ListView(
              children: <Widget>[
                SearchFriendsItem(id:1,userIcon: Constant.ASSETS_IMG+"default_head_icon.jpg",userName: "姜华珍大傻子",content: "齐鲁软件设计大赛组队啦，现缺一名开发人员，java优先",matchName: "齐鲁软件设计大赛",date: "2020-02-02",),
                SearchFriendsItem(id:1,userIcon: Constant.ASSETS_IMG+"default_head_icon.jpg",userName: "姜华珍大傻子",content: "齐鲁软件设计大赛组队啦，现缺一名开发人员，java优先",matchName: "齐鲁软件设计大赛",date: "2020-02-02",),
                SearchFriendsItem(id:1,userIcon: Constant.ASSETS_IMG+"default_head_icon.jpg",userName: "姜华珍大傻子",content: "齐鲁软件设计大赛组队啦，现缺一名开发人员，java优先",matchName: "齐鲁软件设计大赛",date: "2020-02-02",),
                SearchFriendsItem(id:1,userIcon: Constant.ASSETS_IMG+"default_head_icon.jpg",userName: "姜华珍大傻子",content: "齐鲁软件设计大赛组队啦，现缺一名开发人员，java优先",matchName: "齐鲁软件设计大赛",date: "2020-02-02",),
                SearchFriendsItem(id:1,userIcon: Constant.ASSETS_IMG+"default_head_icon.jpg",userName: "姜华珍大傻子",content: "齐鲁软件设计大赛组队啦，现缺一名开发人员，java优先",matchName: "齐鲁软件设计大赛",date: "2020-02-02",),
                SearchFriendsItem(id:1,userIcon: Constant.ASSETS_IMG+"default_head_icon.jpg",userName: "姜华珍大傻子",content: "齐鲁软件设计大赛组队啦，现缺一名开发人员，java优先",matchName: "齐鲁软件设计大赛",date: "2020-02-02",),
                BottomLabel(),
              ],
            ),
          ),
        )
      ],
    );
  }
}