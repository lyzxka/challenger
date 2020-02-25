import 'package:challenger/pages/user/Login.dart';
import 'package:challenger/pages/user/PwdChange.dart';
import 'package:challenger/pages/user/PwdReset.dart';
import 'package:challenger/pages/user/Register.dart';
import 'package:flutter/material.dart';

import 'component/web_view_page.dart';

/// author: zzxka
/// date: 2020/2/24
/// description:  路由管理
class Router {
  static const register="app://register";
  static const login="app://login";
  static const pwdReset="app://pwdRest";
  static const pwdChange="app://pwdChange";

  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      return WebViewPage(url, params: params);
    } else {
      switch (url) {
        // 用户账户管理
        case login:
          return Login();
        case register:
          return Register();
        case pwdReset:
          return PwdReset();
        case pwdChange:
          return PwdChange();


        /*case photoHero:
          return PhotoHeroPage(
              photoUrl: params['photoUrl'], width: params['width']);
        case personDetailPage:
          return PersonDetailPage(params['personImgUrl'], params['id']);*/
      }
    }
    return null;
  }

  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}