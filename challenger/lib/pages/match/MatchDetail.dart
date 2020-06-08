import 'package:challenger/constant/Constant.dart';
import 'package:challenger/pages/group/SearchFriendAdd.dart';
import 'package:challenger/utils/DioUtil.dart';
import 'package:challenger/utils/Toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Global.dart';

class MatchDetail extends StatefulWidget{
  MatchDetailState createState()=>MatchDetailState();
  num id;
  MatchDetail({Key key,this.id}):super(key:key);
}
class MatchDetailState extends State<MatchDetail>{
  bool sign=false;

  String signUpStatusText="";
  bool onFocus=false;
  bool master=false;

  String title="";
  String text="";
  String date="";
  String matchName="";
  String enter="";
  String categoryName="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDate();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,bottom: 60,
          left: 8,right: 8,
          child: RefreshIndicator(
            color: Colors.blue,
            onRefresh: (() async {
              await Future<int>.delayed(Duration(seconds: 3),(){
                // 刷新
                initDate();
                return 1;
              });
              return null;
            }),
            notificationPredicate: ((ScrollNotification notification){
              return true;
            }),
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: ((context,index){
                  return basicWidget();
                })
            ),
          ),
        ),
        Positioned(
          bottom: 20,height: 60,
          right: 10,width: 60,
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Text(enter=="1"?"已参加":"招募",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
            onPressed: ((){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return SearchFriendAdd(id:widget.id);
                  }
              )).then((value){

              });
              /*Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      appBar: new AppBar(),
                      body: SearchFriendAdd(),
                    );
                  })
              );*/
            }),
          ),
        )
      ],
    );
  }
  basicWidget(){
    return Container(
      padding: EdgeInsets.only(top:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 23)),
          Padding(padding: EdgeInsets.only(top: 15,bottom: 10),
            child: Row(
              children: <Widget>[
                Container(width: 200,child: Text(date,style: TextStyle(fontSize: 13,color: Colors.grey),),),
                Expanded(child: Container(padding: EdgeInsets.only(right: 10),alignment: AlignmentDirectional.centerEnd,child: Text(matchName),),),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 60,height: 30,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: onFocus?Colors.white:Colors.blue,
                      border:Border.all(color: Colors.grey,width: 0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(categoryName,style: TextStyle(color: onFocus?Colors.grey:Colors.white),),
                  ),
                  onTap: ((){
                    /*setState(() {
                      onFocus=!onFocus;
                    });*/
                  }),
                )
              ],
            ),
          ),
          Divider(height: .5,color: Colors.grey.shade400,),
          Container(
            constraints: BoxConstraints(
                minHeight: 200
            ),
            padding: EdgeInsets.only(top: 10,bottom: 10),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
  initDate() async{
    Response response= await DioUtil.getInstance(Global.token).dio.post(
        Constant.API_URL+'/app/match/detail',
        data: {
          "objectId": widget.id
        }
    );
    if(response.data['code']!=0){
      Toast.toast(context,msg: response.data['msg']);
    }
    Map<String,dynamic> match=response.data['match'];
    setState(() {
      title=match['title'];
      text=match['content'];
      date=match['createDate'];
      enter=match['enter'];
      categoryName=response.data['category'];
    });
    print(response);
  }
}