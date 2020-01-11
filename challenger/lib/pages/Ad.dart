import 'dart:async';
import 'package:challenger/component/AdLabel.dart';
import 'package:challenger/config/BaseConfig.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Ad extends StatefulWidget{
  AdState createState()=> AdState();
}
class AdState extends State<Ad>{
  // 展示广告页
  bool showAd=true;
  // 展示词
  List<String> words=[
    "旅人的骸骨在山崖间",
    "勇者断剑旁堆放着龙骨",
    "太阳从西方落下",
    "又从东方升起",
    "潮水下沉又涨起",
    "春夏秋冬更迭",
    "踏着前人的脚印前行",
    "Challenger，准备好了吗？",
  ];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // 控制child展示  true为不展示
        Offstage(
          child: Home(),
          offstage: showAd,
        ),
        Offstage(
          offstage: !showAd,
          child:Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Constant.ASSETS_IMG+"moon.jpg"),
                )
            ),
            child:Stack(
              children: <Widget>[
                Positioned(
                  top: 40,height: 30,
                  right: 20,width: 90,
                  child: Listener(
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CountDownWidget(
                          onCountDownFinishCallBack: (bool value){
                            if(value){
                              setState(() {
                                showAd=false;
                              });
                            }
                          }
                      ),
                    ),
                    onPointerDown: (PointerDownEvent) {
                      setState(() {
                        showAd = false;
                      });
                    },
                  ),
                ),
                Positioned(
                  top:MediaQuery.of(context).size.height/3,height: MediaQuery.of(context).size.height/3,
                  left:20,right:20,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: words.map((t)=>AdLabel(word: t)).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  CountDownWidget({Key key, @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 5;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '跳过 $_seconds',
      style: BaseConfig.baseTestStyle,
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
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