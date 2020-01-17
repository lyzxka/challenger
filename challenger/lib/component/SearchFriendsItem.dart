import 'package:challenger/constant/Constant.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-17 17:03
/// description: 只有招募列表item
class SearchFriendsItem extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 90,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
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
                    Container(
                      width: 70,
                      alignment: AlignmentDirectional.center,
                      child: Text("胖的走不动了吧",style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
                    )
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
            ),
          ),
          Divider(color: Color.fromRGBO(0, 0, 0, .5),height: 8,),
        ],
      ),
    );
  }
}
