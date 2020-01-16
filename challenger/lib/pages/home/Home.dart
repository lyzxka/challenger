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
    return Container(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      child: Column(
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
            height: 190,
            padding: EdgeInsets.only(left: 10,right: 10,top: 7),
            margin: EdgeInsets.only(top: 5),
            alignment: AlignmentDirectional.centerStart,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Row(
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
                ),
                Container(
                  padding: EdgeInsets.only(top: 25,),
                  alignment: AlignmentDirectional.centerStart,
                  child: ListView.separated(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("齐鲁软件设计大赛",style: TextStyle(fontSize: 18),),
                                Text("2020-01-16",style: TextStyle(color: Color.fromRGBO(0, 0, 0, .5)),),
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right,color: Color.fromRGBO(0, 0, 0, .5),size: 20,)
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(color: Color.fromRGBO(0, 0, 0, 0.5),);
                    },
                  ),
                )
              ],
            ),
          ),
          // 组队信息
          Container(
            color: Colors.white,
            width: screenSize.width,
            height: 200,
            padding: EdgeInsets.only(left: 10,right: 10,top: 7),
            margin: EdgeInsets.only(top: 5),
            alignment: AlignmentDirectional.centerStart,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Row(
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
                ),
                Container(
                  padding: EdgeInsets.only(top: 25,),
                  alignment: AlignmentDirectional.centerStart,
                  child: ListView.separated(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: ClipOval(
                                  child: Image.asset(Constant.ASSETS_IMG+"default_head_icon.jpg",width: 40,),
                                ),
                              ),
                              Text("胖的走不动了",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.clip,)
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("齐鲁软件设计大赛招募啦，我们需要一名后台开发我们需要一名后台开发",style: TextStyle(fontSize: 16,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                Padding(
                                  padding: EdgeInsets.only(top: 4,left: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Text("齐鲁软件设计大赛",style: TextStyle(color: Color.fromRGBO(0, 0, 0, .5)),),
                                      ),
                                      Text("2020-01-16",style: TextStyle(color: Color.fromRGBO(0, 0, 0, .5)),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right,color: Color.fromRGBO(0, 0, 0, .5),size: 20,)
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(color: Color.fromRGBO(0, 0, 0, 0.5),);
                    },
                  ),
                )
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
}