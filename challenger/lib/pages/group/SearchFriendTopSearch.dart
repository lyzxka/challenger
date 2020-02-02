import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-02-02 23:30
/// description:  志友首页搜索栏
class SearchFriendTopSearch extends StatefulWidget {
  SearchFriendTopSearchState createState() => SearchFriendTopSearchState();
}

class SearchFriendTopSearchState extends State<SearchFriendTopSearch> {
  String city="请选择城市";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.tightFor(height: 50,width: 120),
          padding: EdgeInsets.only(left: 5,top: 5),
          child: GestureDetector(
            child:Text(city,style: TextStyle(fontSize: 17,),maxLines: 1,overflow: TextOverflow.ellipsis,),
            onTap: (()async{
              // type 2
              Result result2 = await CityPickers.showCitiesSelector(
                context: context,
              );
              print(result2);
              setState(() {
                city=result2.cityName;
              });
            }),
          ),
        ),
        Positioned(
          left: 120,width: 100,
          top: 5,bottom: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "比赛名称",
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}