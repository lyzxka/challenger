import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-31 21:42
/// description: 比赛页面共享数据信息
class MatchGlobal extends ChangeNotifier {
  //顶部标题id
  int currentTopTab=0;
  setCurrentTopTab(int id) {
    currentTopTab = id;
    notifyListeners();
  }
}