import 'package:challenger/component/BottomLabel.dart';
import 'package:challenger/component/KnowledgeItem.dart';
import 'package:challenger/component/SearchTextFieldWidget.dart';
import 'package:flutter/material.dart';

class Knowledge extends StatefulWidget{
  KnowledgeState createState()=>KnowledgeState();
}
class KnowledgeState extends State<Knowledge>{
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Positioned(
            top: 0,height: 50,
            left: 0,right: 0,
            child: Container(
              margin: EdgeInsets.only(top: 10,bottom: 0),
              child: SearchTextFieldWidget(
                hintText: '标题名称/用户名称/主题名称',
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                onTab: () {
                  print("123123");
                },
                onSubmitted: ((value){
                  if(value==""){
                    print("搜索内容为空");
                    return ;
                  }
                  print("搜索内容："+value);
                }),
              ),
            ),
          ),
          Positioned(
            top: 52,bottom: 0,
            left: 0,right: 0,
            child: RefreshIndicator(
              color: Colors.blue,
              onRefresh: (() async {
                await Future<int>.delayed(Duration(seconds: 3),(){
                  print("知识首页更新了");
                  return 1;
                });
                return null;
              }),
              child: ListView(
                children: <Widget>[
                  KnowledgeItem(id:1,title:"姜华珍快要饿死了",userName: "zzxka",theme: "Flutter",date:"2020-02-22 22:20:12"),
                  KnowledgeItem(id:2,title:"姜华珍胖的不行不行的了",userName: "zzxka",theme: "Java",date:"2020-02-22 22:20:12"),
                  KnowledgeItem(id:3,title:"姜华珍胖的走不动路了，移动只能躺在地上滚动，",userName: "zzxka",theme: "大数据",date:"2020-02-22 22:20:12"),
                  KnowledgeItem(id:4,title:"姜华珍快要饿死了",userName: "zzxka",theme: "AI人工智能",date:"2020-02-22 22:20:12"),
                  KnowledgeItem(id:5,title:"姜华珍快要饿死了",userName: "zzxka",theme: "Flutter",date:"2020-02-22 22:20:12"),
                  KnowledgeItem(id:6,title:"姜华珍胖的不行不行的了",userName: "zzxka",theme: "Java",date:"2020-02-22 22:20:12"),
                  KnowledgeItem(id:7,title:"姜华珍胖的走不动路了，移动只能躺在地上滚动，",userName: "zzxka",theme: "大数据",date:"2020-02-22 22:20:12"),
                  KnowledgeItem(id:8,title:"姜华珍快要饿死了",userName: "zzxka",theme: "AI人工智能",date:"2020-02-22 22:20:12"),
                  BottomLabel(),
                ],
              ),
            ),
          ),
        ]
    );
  }

}