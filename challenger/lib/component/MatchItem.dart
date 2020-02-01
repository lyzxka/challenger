import 'package:challenger/constant/Constant.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-02-01 17:51
/// description: 
class MatchItem extends StatefulWidget {
  MatchItemState createState() => MatchItemState();
  String title;
  int id;
  String content;
  String img;
  String looks;
  MatchItem({
    Key key,
    this.id,
    this.title,
    this.content,
    this.img,
    this.looks
  }):super(key:key);
}

class MatchItemState extends State<MatchItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6),
      child: Container(
        color: Colors.white,
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(height: 120),
          child: Padding(
              padding: EdgeInsets.only(left: 18,right: 18),
              child:Stack(
                textDirection: TextDirection.ltr,
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  /*  title  文章标题 */
                  Positioned(
                    top: 4,
                    height: 30,
                    left: 0,
                    right: 0,
                    child: Text("姜华珍小美女",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                  /* content info 用户信息 */
                  Positioned(
                    top: 32,
                    bottom: 2,
                    left: 0,
                    right: 110,
                    child: Stack(
                      textDirection: TextDirection.ltr,
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Positioned(
                          top: 24,
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Text(widget.content,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,),
                        ),
                      ],
                    ),
                  ),
                  /* content img 缩略图 */
                  Positioned(
                    right: 0,
                    width: 100,
                    top: 24,
                    height: 70,
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(widget.img,
                        height: 70,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  /* bottom info 底部信息 */
                  Positioned(
                    bottom: 6,
                    height: 18,
                    left: 0,
                    right: 40,
                    child: Row(
                      children: <Widget>[
                        Text("3,666",style: TextStyle(
                          color: Color.fromRGBO(196, 191, 191,1),
                          fontSize: 12,
                        ),),
                        Text(" 浏览",style: TextStyle(
                          color: Color.fromRGBO(196, 191, 191,1),
                          fontSize: 12,
                        ),),
                      ],
                    ),
                  ),
                  /* bottom deal 操作钮 */
                  Positioned(
                    bottom: 6,
                    right: 0,
                    width: 30,
                    height: 18,
                    child: Icon(Icons.more_horiz,size: 22,color: Color.fromRGBO(196, 191, 191,1),),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}