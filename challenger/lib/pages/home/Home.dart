import 'package:challenger/component/BottomLabel.dart';
import 'package:challenger/component/HomeMatchItem.dart';
import 'package:challenger/component/SearchFriendsItem.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/pages/home/Navigation.dart';
import 'package:challenger/pages/match/Match.dart' as match;
import 'package:challenger/utils/Toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// author：zzxka
/// date：2020-01-16 15:11
/// description: 
class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // 轮播图片
  List<String> _swiperImg=[];
  List<Widget> matchList=[];
  List<Widget> groupSearchList=[];

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: (() async {
        getData();
        await Future<int>.delayed(Duration(seconds: 2),(){
          return 1;
        });
        return null;
      }),
      child: Stack(
        children: <Widget>[
          Container(
            child:ListView(
              children: <Widget>[
                // 轮播图
                Container(
                  padding: EdgeInsets.only(top: 4,left: 10,right: 10),
                  constraints: BoxConstraints.tightFor(height: 140),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Swiper(
                    itemCount: _swiperImg.length,
                    itemBuilder: _itemBuilder,
                    control: new SwiperControl(
                        size: 18
                    ),
                    autoplay: true,
                    autoplayDelay: 4000,
                    scrollDirection: Axis.horizontal,
                    pagination: new SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            color: Colors.black54,
                            activeColor: Colors.white,
                            size: 4,
                            activeSize: 5
                        )
                    ),
                    onTap: (index)=>print("当前页面${index+1}"),
                  ),
                ),
                // 精选导航
                Navigation(),
                // 比赛资讯
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 10,right: 10,top: 7),
                  margin: EdgeInsets.only(top: 5),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Text("最新资讯"),
                          ),
                          Listener(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children:<Widget>[
                                Text("更多 >>",),
                              ],
                            ),
                            onPointerDown: ((PointerDownEvent event){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Scaffold(
                                  appBar:AppBar(
                                  ),
                                  body:match.Match(),
                                );
                              }));
                            }),
                          ),
                        ],
                      ),
                      Column(
                        children: matchList,
                      )
                    ],
                  ),
                ),
                // 组队信息
                Container(
                  color: Colors.white,
                  width: screenSize.width,
                  padding: EdgeInsets.only(left: 10,right: 10,top: 7),
                  margin: EdgeInsets.only(top: 5),
                  alignment: AlignmentDirectional.centerStart,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Text("志友招募"),
                          ),
                          Listener(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children:<Widget>[
                                Text("更多 >>",),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: groupSearchList,
                      )
                    ],
                  ),
                ),
                // 底部
//                BottomLabel(),
              ],
            ),
          ),

        ],
      ),
    );
  }
  // 轮播
  Widget _itemBuilder(BuildContext context,int index){
    return Image.asset(_swiperImg[index],fit: BoxFit.fitWidth,);
  }

  // 获取首页数据
  getData() async{
    Response response= await Dio().post(
        Constant.API_URL+"/app/base/index"
    );
    print(response);
    if(response.data['code']==0){
      //比赛资讯列表
      this.matchList=[];
      var matchList=response.data['matchList'];
      if(!matchList.isEmpty) {
        response.data['matchList'].forEach((item) {
          this.matchList.add(HomeMatchItem(itemId: item['id'],
              title: item['title'],
              date: item['beginDate']));
        });
      }else{
        this.matchList.add(BottomLabel(text: "暂无数据",));
      }
      // 志友招募列表
      this.groupSearchList=[];
      print(response.data['groupSearchList']);
      var groupSearchList=response.data['groupSearchList'];
      if(!groupSearchList.isEmpty){
        groupSearchList.forEach((item){
          this.groupSearchList.add(
              SearchFriendsItem(
                id:item['id'],
                userIcon: item['userIcon'],
                userName: item['userName'],
                content: item['title'],
                matchName: item['matchName'],
                date: item['createDate'],
              )
          );
        });
      }else{
        this.groupSearchList.add(BottomLabel(text: "暂无数据",));
      }
      _swiperImg=[
        Constant.ASSETS_IMG+"Lincoln.jpg",
        Constant.ASSETS_IMG+"default_head_icon.jpg",
        Constant.ASSETS_IMG+"default_head_icon.jpg",
        Constant.ASSETS_IMG+"default_head_icon.jpg",
        Constant.ASSETS_IMG+"moon.jpg",
      ];
    }else{
      Toast.toast(context,msg: response.data['msg']);
    }
    setState(() {

    });
  }
}