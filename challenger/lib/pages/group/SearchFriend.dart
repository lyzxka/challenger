import 'package:challenger/component/BottomLabel.dart';
import 'package:challenger/component/SearchFriendsItem.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/model/SearchFriendGlobal.dart';
import 'package:challenger/pages/group/SearchFriendTopSearch.dart';
import 'package:challenger/utils/Toast.dart';
import 'package:challenger/utils/provider/ChangeNotifierProvider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-02-02 22:44
/// description: 
class SearchFriend extends StatefulWidget {
  SearchFriendState createState() => SearchFriendState();
}

class SearchFriendState extends State<SearchFriend> {
  List<Widget> initList=[];
  @override
  void initState() {
    super.initState();
    initData();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    var global=ChangeNotifierProvider.of<SearchFriendGlobal>(context);
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
                global.getList(global.matchName, 1);
                return 1;
              });
              return null;
            }),
            notificationPredicate: ((ScrollNotification notification){
              double progress = notification.metrics.maxScrollExtent-notification.metrics.pixels;
              if(notification.metrics.axisDirection==AxisDirection.down&&progress<10) {
                print("分页更新${global.currentPage+1}");
                if (progress <= 200) {
                  global.getList(global.matchName, global.currentPage+1);
                }
              }
              return true;
            }),
            child: ListView.builder(
              itemCount: global.data.length==0?initList.length:global.data.length,
              itemBuilder: (BuildContext context, int position) {
                return global.data.length==0?initList[position]:global.data[position];
              }
            ),
          ),
        )
      ],
    );
  }
  initData() async{
    Response response= await Dio().post(
        Constant.API_URL + "/app/group/groupSearchList",
        data: {
          "page": 1,
          "limit": 10
        }
    );
    var data=response.data;
    if(data['code']==0){
      var list=data['data'];
      if(list.isNotEmpty){
        list.forEach((item){
          initList.add(SearchFriendsItem(
              id: item['id'],
              userName: item['userName'],
              content: item['content'],
              userIcon: item['userIcon'],
              date: item['createDate'],
              matchName: item['matchName']));
        });
      }else{
        initList.add(BottomLabel(text:"当前没有数据"));
      }
    }else{
      Toast.toast(context,msg: data['msg']);
    }
    setState(() {

    });
  }
}