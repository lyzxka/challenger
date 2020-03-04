import 'package:challenger/Global.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/pages/group/SearchFriend.dart';
import 'package:challenger/pages/home/Home.dart';
import 'package:challenger/pages/drawer/MyDrawer.dart';
import 'package:challenger/pages/match/Match.dart' as match;
import 'package:challenger/router.dart';
import 'package:flutter/material.dart';

import 'knowledge/Knowledge.dart';
/// 首页
class AppIndex extends StatefulWidget{
  AppIndexState createState()=>AppIndexState();
}
class AppIndexState extends State<AppIndex>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<BottomNavigationBarItem> barItems;
  List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages=[
      Home(),
      match.Match(),
      SearchFriend(),
      Knowledge(),
    ];
    barItems=[
      BottomNavigationBarItem(title:Text("首页"),icon: Icon(Icons.home)),
      BottomNavigationBarItem(title:Text("比赛"),icon: Icon(Icons.subscriptions)),
      BottomNavigationBarItem(title:Text("志友"),icon: Icon(Icons.people_outline)),
      BottomNavigationBarItem(title:Text("知识"),icon: Icon(Icons.book)),
    ];
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("change 1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // 左侧抽屉
      drawer: MyDrawer(),
      drawerEdgeDragWidth: 20,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Challenger"),
        //自定义抽屉图标及打开控制
        leading: Listener(
          child: Container(
            alignment: AlignmentDirectional.center,
            child:GestureDetector(
              child: Global.isLogin? ClipOval(
                child: Image.network(Global.userIcon,width: 30,height: 30,fit: BoxFit.fill,),
                ):Text("未登录",style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          onPointerDown: (PointerDownEvent event)=>Global.isLogin?_scaffoldKey.currentState.openDrawer():Router.pushNoParams(context, Router.login),
        ),
      ),
      body: Stack(
        children: pages.map((e)=>_getPagesWidget(pages.indexOf(e))).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: barItems,
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.black12,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  int _selectedIndex = 0;
  int index=0;

  // 切换页面
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // Stack（层叠布局）+Offstage组合,解决状态被重置的问题
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: TickerMode(
        enabled: _selectedIndex == index,
        child: pages[index],
      ),
    );
  }

}