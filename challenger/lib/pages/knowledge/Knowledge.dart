import 'package:challenger/Global.dart';
import 'package:challenger/component/BottomLabel.dart';
import 'package:challenger/component/KnowledgeItem.dart';
import 'package:challenger/component/SearchTextFieldWidget.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/model/KnowledgeGlobal.dart';
import 'package:challenger/pages/knowledge/KnowledgeAdd.dart';
import 'package:challenger/pages/user/Login.dart';
import 'package:challenger/utils/Toast.dart';
import 'package:challenger/utils/provider/ChangeNotifierProvider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Knowledge extends StatefulWidget{
  KnowledgeState createState()=>KnowledgeState();
}
class KnowledgeState extends State<Knowledge>{

  List<Widget> initList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }
  @override
  Widget build(BuildContext context) {
    var global=ChangeNotifierProvider.of<KnowledgeGlobal>(context);
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
                },
                onSubmitted: ((value){
                  global.text=value;
                  global.getList(global.text, 1);
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
                  global.getList(global.text, 1);
                  return 1;
                });
                return null;
              }),
              notificationPredicate: ((ScrollNotification notification){
                double progress = notification.metrics.maxScrollExtent-notification.metrics.pixels;
                if(notification.metrics.axisDirection==AxisDirection.down&&progress<10) {
                  print("分页更新${global.currentPage+1}");
                  if (progress <= 200) {
                    global.getList(global.text, global.currentPage+1);
                  }
                }
                return true;
              }),
              child: ListView.builder(
                itemCount: global.data.isEmpty?initList.length:global.data.length,
                itemBuilder: (context,position){
                  return global.data.isEmpty?initList[position]:global.data[position];
                },
              ),
            ),
          ),
          Positioned(
            bottom: 10,height: 60,
            right: 10,width: 60,
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              child: Text("发布",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w300),),
              onPressed: ((){
                if(!Global.isLogin){
                  Toast.toast(context,msg: "请先进行登录");
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return Login();
                      }
                  ));
                  return ;
                }
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return KnowledgeAdd();
                    }
                )).then((value){
                  global.getList(global.text, 1);
                });
              }),
            ),
          ),
        ]
    );
  }
  initData() async{
    Response response=await Dio().post(
        Constant.API_URL+"/app/knowledge/list",
        data: {
          "page":1,
          "limit":10
        }
    );
    if(response.data['code']==0){
      var list=response.data['data'];
      if(list.isNotEmpty){
        list.forEach((item){
          initList.add(KnowledgeItem(
            id: item['id'],
            title: item['title'],
            userName: item['userName'],
            theme: item['categoryName'],
            date: item['createDate'],
          ));
        });
      }else{
        initList.add(BottomLabel(text:"暂无数据"));
      }

      setState(() {

      });
    }else{
      Toast.toast(context,msg: response.data['msg']);
    }
  }
}