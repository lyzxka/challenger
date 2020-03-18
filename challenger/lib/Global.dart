import 'dart:io';

import 'package:challenger/constant/Constant.dart';
import 'package:challenger/utils/Toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// author: zzxka
/// date: 2020/2/27
/// description: 全局共享变量
class Global extends ChangeNotifier{

  static SharedPreferences storage;
  static bool isLogin=false;
  static String token="";
  static String phone="";
  static String userIcon="";
  static String email="";
  static String name="";
  static BuildContext globalContext;


  //初始化全局信息，会在APP启动时执行
  static Future init(BuildContext context) async {
    globalContext=context;
    storage = await SharedPreferences.getInstance();
    loginInit();
  }

  static update() async{
    token= storage.getString("token");
    isLogin=null==token?false:true;
    phone=storage.getString("phone");
    if(isLogin){
      getUserInfo();
    }
  }

  static void loginInit(){
    token= storage.getString("token");
    phone= storage.getString("phone");
    isLogin=null==token?false:true;
    if(isLogin){
        getUserInfo();
    }
  }
  static void loginCancel(){
    storage.remove("token");
    storage.remove("userIcon");
    isLogin=false;
  }
  static void cancel(){
    loginCancel();
  }
  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  static getUserInfo() async{
    var dio=Dio(BaseOptions(baseUrl:Constant.API_URL,headers: {HttpHeaders.authorizationHeader: token,}));
    Response response=await dio.post("/app/user/userInfo");
    if(response.data['code']==401){
      loginCancel();
    }else if(response.data['code']==0){
      var info=response.data['info'];
      email=info['email'];
      userIcon=info['icon'];
      name=info['name'];
//      storage.setString("userIcon", info['icon']);
//      print(info.toString());
    }else{
      Toast.toast(globalContext,msg:response.data['msg']);
      print(response.data['msg']);
    }
  }

}