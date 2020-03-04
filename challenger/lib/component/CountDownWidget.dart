import 'dart:async';
import 'package:flutter/material.dart';

/// author: zzxka
/// date: 2020/2/24
/// description: 
class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  final second;
  String suffixText;
  String prefixText;

  CountDownWidget({Key key, @required this.onCountDownFinishCallBack,@required this.second,this.prefixText,this.suffixText})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 5;
  String prefixText;
  String suffixText;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _seconds=widget.second;
    prefixText=widget.prefixText==null?"":widget.prefixText;
    suffixText=widget.suffixText==null?"":widget.suffixText;
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$prefixText$_seconds$suffixText',
      style: TextStyle(color: Colors.grey,fontSize: 16,decoration: TextDecoration.none),
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // 更新视图
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer?.cancel();
  }
}