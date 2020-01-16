import 'package:challenger/constant/Constant.dart';
import 'package:challenger/pages/Ad.dart';
import 'package:challenger/pages/home/Home.dart';
import 'package:challenger/pages/drawer/MyDrawer.dart';
import 'package:flutter/material.dart';
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
      Text("比赛"),
      Text("志友"),
      Text("知识"),
    ];
    barItems=[
      BottomNavigationBarItem(title:Text("首页"),icon: Icon(Icons.home)),
      BottomNavigationBarItem(title:Text("比赛"),icon: Icon(Icons.subscriptions)),
      BottomNavigationBarItem(title:Text("志友"),icon: Icon(Icons.people_outline)),
      BottomNavigationBarItem(title:Text("知识"),icon: Icon(Icons.book)),
    ];
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
            child:ClipOval(
              child: Image.asset(Constant.ASSETS_IMG+"default_head_icon.jpg",width: 30),
            ),
          ),
          onPointerDown: (PointerDownEvent event)=>_scaffoldKey.currentState.openDrawer(),
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