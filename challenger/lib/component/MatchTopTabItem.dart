import 'package:challenger/model/MatchGlobal.dart';
import 'package:challenger/utils/provider/ChangeNotifierProvider.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-31 21:46
/// description:  比赛首页顶部导航列表item
class MatchTopTabItem extends StatefulWidget {
  MatchTopTabItemState createState() => MatchTopTabItemState();

  int id;
  String title;

  MatchTopTabItem({
    Key key,
    this.id,
    this.title
  }):super(key:key);

}

class MatchTopTabItemState extends State<MatchTopTabItem> {
  bool taped=false;
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    int currentTopTab=ChangeNotifierProvider.of<MatchGlobal>(context).currentCategoryId;
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: ChangeNotifierProvider.of<MatchGlobal>(context).currentCategoryId==widget.id?Colors.blue:Color.fromRGBO(240, 239, 239,1),
          ),
          constraints: BoxConstraints.tightFor(width: 50,height: 34),
          alignment: AlignmentDirectional.center,
          child: Text(widget.title,style: TextStyle(color: ChangeNotifierProvider.of<MatchGlobal>(context).currentCategoryId==widget.id?Colors.white:Colors.grey),),
        ),
      ),
      onTap: ((){
        setState(() {
          currentTopTab=widget.id;
        });
        ChangeNotifierProvider.of<MatchGlobal>(context).currentCategoryId=widget.id;
        print("导航标题被点击了${widget.id}，当前$currentTopTab");
//        MatchGlobal.update(widget.id, 1);
        ChangeNotifierProvider.of<MatchGlobal>(context).getList(widget.id,1);
      }),
    );
  }
}