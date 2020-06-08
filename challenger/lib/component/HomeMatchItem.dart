import 'package:challenger/pages/match/MatchDetail.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-17 16:26
/// description: 
class HomeMatchItem extends StatefulWidget {

  HomeMatchItemState createState()=>HomeMatchItemState();
  num itemId;
  String title;
  String date;

  HomeMatchItem({
    Key key,
    this.itemId,
    this.title,
    this.date,
  }):super(key:key);

}

class HomeMatchItemState extends State<HomeMatchItem>{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          height: 60,
          padding: EdgeInsets.only(top: 8),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.title,style: TextStyle(fontSize: 16),),
                          Text(formatDate(DateTime.parse(widget.date), [yyyy,"-",mm,"-",dd]),style: TextStyle(color: Color.fromRGBO(0, 0, 0, .5)),),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right,color: Color.fromRGBO(0, 0, 0, .5),size: 20,),
                  ],
                ),
              ),
              Divider(color: Color.fromRGBO(0, 0, 0, .5),height: 8,),
            ],
          ),
        ),
        onTap: (){
          print("跳转比赛详情页面：${widget.itemId}");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: new AppBar(),
                  body: MatchDetail(id:widget.itemId),
                );
              })
          );
        }
    );
  }
}
