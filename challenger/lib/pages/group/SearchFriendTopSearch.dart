import 'package:challenger/component/SearchTextFieldWidget.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-02-02 23:30
/// description:  志友首页搜索栏
class SearchFriendTopSearch extends StatefulWidget {
  SearchFriendTopSearchState createState() => SearchFriendTopSearchState();
}

class SearchFriendTopSearchState extends State<SearchFriendTopSearch> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,height: 50,
      left: 0,right: 0,
      child: Container(
        margin: EdgeInsets.only(top: 10,bottom: 0),
        child: SearchTextFieldWidget(
          hintText: '比赛名称',
          margin: const EdgeInsets.only(left: 15.0, right: 15.0),
          onTab: () {
            print("123123");
          },
        ),
      ),

    );
  }
}