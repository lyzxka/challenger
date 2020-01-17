import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-17 16:26
/// description: 
class MatchItem extends StatelessWidget {
  num itemId;
  String title;
  String date;

  MatchItem({
    Key key,
    this.itemId,
    this.title,
    this.date,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Listener(
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
                        Text(title,style: TextStyle(fontSize: 16),),
                        Text(date,style: TextStyle(color: Color.fromRGBO(0, 0, 0, .5)),),
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
      onPointerDown: (PointerDownEvent event){
        print("跳转比赛详情页面：$itemId");
      }
    );
  }
}
