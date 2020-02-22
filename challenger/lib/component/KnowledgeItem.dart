import 'package:flutter/material.dart';

/// author: zzxka
/// date: 2020/2/22
/// description: 
class KnowledgeItem extends StatelessWidget {

  int id;
  String title;
  String date;
  String userName;
  String theme;

  KnowledgeItem({
    Key key,
    this.id,
    this.title,
    this.userName,
    this.theme,
    this.date
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 非文字区域可触发点击事件
      behavior: HitTestBehavior.opaque,
      onTap: ((){
        print("点击了$id");
      }),
      child: Container(
        constraints: BoxConstraints(
            maxHeight: 100,minHeight: 60,
            maxWidth: MediaQuery.of(context).size.width),
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width-30,
                minHeight: 20,maxHeight: 50,
              ),
              alignment: AlignmentDirectional.topStart,
              padding: EdgeInsets.only(top: 4),
              child: Text("$title",style: TextStyle(fontSize: 18,),maxLines: 2,overflow: TextOverflow.clip,),
            ),
            Container(
              height: 30,
              margin: EdgeInsets.only(top: 5,left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                      minWidth: 60,maxWidth: 100,
                      minHeight: 20,maxHeight: 30,
                    ),
                    child: Text("$userName",style: TextStyle(color: Colors.grey),overflow: TextOverflow.ellipsis,maxLines: 1,),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        minWidth: 50,maxWidth: 160
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.blue,
                    ),
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                    child: Text("$theme",style: TextStyle(color: Colors.white),),
                  ),
                  Expanded(
                    child: Container(
                      width: 160,
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text("$date",style: TextStyle(color: Colors.grey),),
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 9,)
          ],
        ),
      ),
    );
  }
}
