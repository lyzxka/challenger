import 'package:challenger/component/MatchTopTabItem.dart';
import 'package:challenger/model/MatchGlobal.dart';
import 'package:challenger/utils/inherited/ShareDataWidget.dart';
import 'package:challenger/utils/provider/ChangeNotifierProvider.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-21 9:35
/// description: 
class TopTab extends StatefulWidget {
  TopTabState createState() => TopTabState();
}

class TopTabState extends State<TopTab> {

  List<String> titleNames=["全站","科学","数码","体育","娱乐","时尚","影视","IT","美术"];
  List<Widget> titles;
  ScrollController controller;

  int currentTopTab=0;

  @override
  void initState() {
    super.initState();
    titles=titleNames.asMap().keys.map((index)=>MatchTopTabItem(id: index,title: titleNames[index])).toList();
    controller=new ScrollController();
    // 标题点击事件
    controller.addListener((){
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            constraints: BoxConstraints.tightFor(height: 50),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: titles,
              controller: controller,
            ),
          ),
          // 顶部标题添加按钮
          Stack(
            children: <Widget>[
              Positioned(
                right: 0,width: 40,
                top: 0,height: 50,
                child: Container(
                  color: Colors.white,
                  alignment: AlignmentDirectional.centerStart,
                  child: Icon(Icons.add,color: Colors.grey,size: 24,),
                ),
              ),
              Positioned(
                right: 40,width: 30,
                top: 0,height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(240, 239, 239,0),
                          Colors.white,
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ]
    );
  }
}
