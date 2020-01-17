import 'package:challenger/component/MatchItem.dart';
import 'package:challenger/component/SearchFriendsItem.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/pages/home/Navigation.dart';
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
  List<String> _swiperImg;
  @override
  void initState() {
    super.initState();
    _swiperImg=[
      Constant.ASSETS_IMG+"Lincoln.jpg",
      Constant.ASSETS_IMG+"default_head_icon.jpg",
      Constant.ASSETS_IMG+"default_head_icon.jpg",
      Constant.ASSETS_IMG+"default_head_icon.jpg",
      Constant.ASSETS_IMG+"moon.jpg",
    ];
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(0, 0, 0, 0.1),
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
                        ),
                      ],
                    ),
                    MatchItem(itemId: 1,title: "齐鲁软件设计大赛",date:"2020-01-16"),
                    MatchItem(itemId: 2,title: "齐鲁软件设计大赛",date:"2020-01-16"),
                    MatchItem(itemId: 3,title: "齐鲁软件设计大赛",date:"2020-01-16"),
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
                    SearchFriendsItem(),
                    SearchFriendsItem(),
                    SearchFriendsItem(),
                    SearchFriendsItem(),
                  ],
                ),
              ),
              // 底部
              Container(
                height: 50,
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(240, 239, 239,0),
                        Colors.white,
                      ]),
                ),
                alignment: AlignmentDirectional.center,
                child: Text("已经到底了",style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.3)),),
              )
            ],
          ),
        ),

      ],
    );
  }
  // 轮播
  Widget _itemBuilder(BuildContext context,int index){
    return Image.asset(_swiperImg[index],fit: BoxFit.fitWidth,);
  }
}