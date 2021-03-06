import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-11 16:02
/// description: 广告页文字行
class AdLabel extends StatelessWidget {
  TextStyle labelTextStyle=TextStyle(color: Colors.grey,fontSize: 18,decoration: TextDecoration.none);
  String word;
  AdLabel({
    Key key,
    @required this.word
  }):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6),
      child: Text(word,style: labelTextStyle,),
    );
  }
}
