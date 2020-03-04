import 'dart:io';

import 'package:challenger/constant/Constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// author: zzxka
/// date: 2020/3/4
/// description: 
class DioUtil{
  static DioUtil instance;
  Dio dio;
  BaseOptions options;

  CancelToken cancelToken = new CancelToken();

  static DioUtil getInstance(String token) {
    if (null == instance) instance = new DioUtil(token);
    return instance;
  }
  DioUtil(String token) {
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    options = new BaseOptions(
      //请求基地址,可以包含子路径
      baseUrl: Constant.API_URL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      //Http请求头.
      //请求的Content-Type，默认值是[ContentType.json]. 也可以用ContentType.parse("application/x-www-form-urlencoded")
//      contentType: ContentType.json,
      //表示期望以那种格式(方式)接受响应数据。接受4种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.json,
    );
    if(null!=token){
      options.headers[HttpHeaders.authorizationHeader]=token;
    }
    dio = new Dio(options);
  }
  get(url,{data,context}){

  }
}