import 'package:challenger/Global.dart';
import 'package:challenger/Global.dart' as prefix1;
import 'package:challenger/component/AdLabel.dart';
import 'package:challenger/component/CountDownWidget.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/model/MatchGlobal.dart';
import 'package:challenger/pages/match/Match.dart';
import 'package:challenger/pages/match/Match.dart' as prefix0;
import 'package:challenger/utils/provider/ChangeNotifierProvider.dart';
import 'package:flutter/material.dart';

import 'AppIndex.dart';

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
    //初始化全局变量
    Global.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // 控制child展示  true为不展示
        Offstage(
          child:ChangeNotifierProvider<Global>(
            data: Global(),
            child:  AppIndex(),
          ),
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
                          second: 5,
                          prefixText: "跳过",
                          onCountDownFinishCallBack: (bool value){
                            if(value){
                              setState(() {
                                showAd=false;
                              });
                            }
                          }
                      ),
                    ),
                    onPointerDown: (PointerDownEvent e) {
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
