import 'dart:core';

/// author: zzxka
/// date: 2020/2/26
/// description: 请求返回对象
class ResponseData{
  final int code;
  final String msg;
  final dynamic data;

  ResponseData(this.msg,this.code,this.data);

  ResponseData.formJson(Map<String,dynamic> json)
  :msg=json['msg'],
  code=json['code'],
  data=json['data'];

  Map<String,dynamic> toJson()=>
      <String,dynamic>{
        'msg':msg,
        'code':code,
        'data':data
      };
}