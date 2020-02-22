import 'package:challenger/constant/Constant.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-16 18:27
/// description: 首页功能导航
class Navigation extends StatefulWidget {
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  // 导航文字
  TextStyle navigationTextStyle=TextStyle(fontSize: 12,color: Color.fromRGBO(0, 0, 0, .5));
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.only(top: 8),
      constraints: BoxConstraints.tightFor(height: 70),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child:Column(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child:Image.asset(Constant.ASSETS_IMG+"default_head_icon.jpg",width: 36,)
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text("比赛资讯",style: navigationTextStyle,),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child:Column(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child:Image.asset(Constant.ASSETS_IMG+"default_head_icon.jpg",width: 36,)
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text("志友大厅",style: navigationTextStyle,),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child:Column(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child:Image.asset(Constant.ASSETS_IMG+"default_head_icon.jpg",width: 36,)
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text("资料学习",style: navigationTextStyle,),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child:Column(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child:Image.asset(Constant.ASSETS_IMG+"default_head_icon.jpg",width: 36,)
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text("更多",style: navigationTextStyle,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}