import 'package:challenger/constant/Constant.dart';
import 'package:challenger/utils/DioUtil.dart';
import 'package:challenger/utils/Toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// author: zzxka
/// date: 2020/3/30
/// description: 
class SearchFriendDetail extends StatefulWidget {
  SearchFriendDetailState createState() => SearchFriendDetailState();
  num id;
  SearchFriendDetail({Key key,this.id}):super(key:key);
}

class SearchFriendDetailState extends State<SearchFriendDetail> {
  TextEditingController questionController=new TextEditingController();

  bool signUp=false;
  bool onFocus=false;
  bool master=false;

  String title="";
  String text="";
  String date="";
  String matchName="";
  String userName="";
  String userIcon="";
  List signUpList=[];

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
              double progress = notification.metrics.maxScrollExtent-notification.metrics.pixels;
              if(notification.metrics.axisDirection==AxisDirection.down&&progress<10) {
                if (progress <= 200) {
                  // 获取下一页评论
                }
              }
              return true;
            }),
            child: ListView.builder(
                itemCount: signUpList.length+1,
                itemBuilder: ((context,index){
                  return index==0?basicWidget():signUpList[index-1];
                })
            ),
          ),
        ),
       Positioned(
         bottom: 20,height: 60,
         right: 10,width: 60,
         child: FloatingActionButton(
           backgroundColor: signUp?Colors.white:Colors.blue,
           child: Text(signUp?"取消":"报名",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: signUp?Colors.grey:Colors.white),),
           onPressed: ((){
             Toast.toast(context,msg:signUp?"取消报名成功":"报名成功");
             setState(() {
               signUp=!signUp;
             });
           }),
         ),
       )
      ],
    );
  }

  initDate() async{
    Response response= await Dio().post(
      Constant.API_URL+'/app/group/groupSearchDetail',
      data: {
        "objectId": widget.id
      }
    );
    if(response.data['code']!=0){
      Toast.toast(context,msg: response.data['msg']);
    }
    Map<String,dynamic> groupSearch=response.data['groupSearch'];
    List<dynamic> groupList=response.data['groupList'];
    groupList.forEach((item){
      print(item);
      signUpList.add(groupSignUpItem(
          item['userIcon'],
          item['userName'],
          item['createDate'],
          item['status']
      ));
    });
    setState(() {
      title=groupSearch['title'];
      text=groupSearch['content'];
      userName=groupSearch['userName'];
      userIcon=groupSearch['userIcon'];
      date=groupSearch['createDate'];
    });
    print(response);
  }

  groupSignUpItem(String userIcon,String userName,String date,String status){
    return Container(
        height: 60,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 5,bottom: 10,top: 10),
                  child: ClipOval(
                    child: Image.network(userIcon,height: 35,width: 35,fit: BoxFit.fill,),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(userName,style: TextStyle(fontSize: 16),),
                        ),
                        Text(date,style: TextStyle(fontSize: 12,color: Colors.grey),)
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(parseStatus(status),style: TextStyle(color: Colors.black),),
                )
              ],
            ),
            Divider(height: .5,color: Colors.grey.shade400,),
          ],
        )
    );
  }

  basicWidget(){
    return Container(
      padding: EdgeInsets.only(top:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 23)),
          Padding(padding: EdgeInsets.only(top: 15),
            child: Row(
              children: <Widget>[
                Container(width: 200,child: Text(date,style: TextStyle(fontSize: 13,color: Colors.grey),),),
                Expanded(child: Container(padding: EdgeInsets.only(right: 10),alignment: AlignmentDirectional.centerEnd,child: Text(matchName),),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10,bottom: 10),
            child: Row(
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 10),child: ClipOval(
                  child: Image.network(userIcon,height: 35,width: 35,fit: BoxFit.fill,),
                ),),
                Expanded(
                  child: Container(padding: EdgeInsets.only(left: 10),alignment: AlignmentDirectional.centerStart,child: Text(userName),height: 40,),
                ),
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
                    child: Text(onFocus?"已关注":"关注",style: TextStyle(color: onFocus?Colors.grey:Colors.white),),
                  ),
                  onTap: ((){
                    setState(() {
                      onFocus=!onFocus;
                    });
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
          Divider(height: .5,color: Colors.grey.shade400,),
          Container(
            padding: EdgeInsets.only(top: 15,left: 10),
            child: Text("报名详情",style: TextStyle(fontSize: 18),),
          ),
        ],
      ),
    );
  }

  // 报名状态
  String parseStatus(String status){
    if("1"==status){
      return "报名中";
    }
    if("2"==status){
      return "已拒绝";
    }
    if("3"==status){
      return "已通过";
    }
    if("4"==status){
      return "已取消";
    }
    return "报名中";
  }

}