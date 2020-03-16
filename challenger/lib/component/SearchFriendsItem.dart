import 'package:challenger/constant/Constant.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-17 17:03
/// description: 只有招募列表item
class SearchFriendsItem extends StatelessWidget {

  String userName;
  String content;
  int id;
  String userIcon;
  String matchName;
  String date;
  SearchFriendsItem({
    Key key,
    this.id,
    this.userName,
    this.userIcon,
    this.content,
    this.date,
    this.matchName,
  }):super(key:key);

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
                        child: Image.network(userIcon,width: 40,height: 40,fit: BoxFit.fill,),
                      ),
                    ),
                    Container(
                      width: 70,
                      alignment: AlignmentDirectional.center,
                      child: Text(userName,style: TextStyle(fontSize: 11),maxLines: 1,overflow: TextOverflow.ellipsis,),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(content,style: TextStyle(fontSize: 16,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4,right: 10,bottom: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(matchName,style: TextStyle(color: Color.fromRGBO(0, 0, 0, .5)),),
                            ),
                            Text(formatDate(DateTime.parse(date), [yyyy,"-",mm,"-",dd]),style: TextStyle(color: Color.fromRGBO(0, 0, 0, .5)),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
//                Icon(Icons.chevron_right,color: Color.fromRGBO(0, 0, 0, .5),size: 20,)
              ],
            ),
          ),
          Divider(color: Color.fromRGBO(0, 0, 0, .5),height: 8,),
        ],
      ),
    );
  }
}
