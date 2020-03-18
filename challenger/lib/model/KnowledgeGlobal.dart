import 'package:challenger/Global.dart';
import 'package:challenger/component/BottomLabel.dart';
import 'package:challenger/component/KnowledgeItem.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/utils/Toast.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


/// author: zzxka
/// date: 2020/3/16
/// description: 
class KnowledgeGlobal extends ChangeNotifier{

  List<Widget> data=[];
  String text="";
  int currentPage=1;
  bool updating =false;

  getList(String text,int page) async{
    if(updating){
      return ;
    }
    updating=true;
    if(""==text&&page==2&&data.length==0){
      updating=false;
      getList(null, 1);
      return;
    }
    Response response=await Dio().post(
      Constant.API_URL+"/app/knowledge/list",
      data: {
        "page":page,
        "limit":10,
        "context":text
      }
    );
    if(response.data['code']==0){
      if(page==1){
        data=[];
      }
      var list=response.data['data'];
      if(list.isNotEmpty){
        list.forEach((item){
          data.add(KnowledgeItem(
            id: item['id'],
            title: item['title'],
            userName: item['userName'],
            theme: item['categoryName'],
            date: item['createDate'],
          ));
        });
        if (list.length< 10) {
          data.add(BottomLabel(text: "已经到底了",));
        }
        currentPage = page;
      }else{
        if(page==1){
          data.add(BottomLabel(text:"暂无数据"));
        }
      }
    }else{}
    updating = false;
    notifyListeners();
  }
}