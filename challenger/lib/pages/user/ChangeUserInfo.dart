import 'package:challenger/Global.dart';
import 'package:challenger/utils/DioUtil.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// author: zzxka
/// date: 2020/3/4
/// description: 
class ChangeUserInfo extends StatefulWidget {
  ChangeUserInfoState createState() => ChangeUserInfoState();
  String name;
  String email;
  int type;
  ChangeUserInfo({Key key,@required this.type,this.name,this.email}):super(key:key);
}

class ChangeUserInfoState extends State<ChangeUserInfo> {

  TextEditingController nameController=new TextEditingController();
  TextEditingController emailController=new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("修改信息",style: TextStyle(fontSize: 18),),
        actions: <Widget>[
          Container(
            alignment: AlignmentDirectional.center,
            child: GestureDetector(
              child: Container(
                height: 30,width: 50,
                margin: EdgeInsets.only(right: 10),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    color:Colors.blue,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Text("提交",style: TextStyle(color: Colors.white,fontSize: 16),),
              ),
              onTap: () async{
                DioUtil.getInstance(Global.token).dio.post(
                  "/app/user/changeInfo",
                  data: {
                    "name":nameController.text,
                    "email":emailController.text
                  }
                ).then((response){
                  print(response);
                  if(response.data['code']==0){
                    Navigator.pop(context,1==widget.type?nameController.text:emailController.text);
                    Global.getUserInfo();
                  }
                });


              },
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: 1==widget.type?false:true,
            child: Container(
              height: 40,
              margin: EdgeInsets.only(left: 20,top: 10),
              child: TextFormField(
                controller: nameController,
//                initialValue: widget.name,
                decoration: InputDecoration(
                  hintText: "请输入昵称",
                ),
                validator: (v) {
                  return v.trim().length > 0 ? null : "昵称不能为空";
                },
              ),
            ),
          ),
          Offstage(
            offstage: 2==widget.type?false:true,
            child: Container(
              height: 40,
              margin: EdgeInsets.only(left: 20,top: 10),
              child: TextFormField(
                controller: emailController,
//                initialValue: widget.email,
                decoration: InputDecoration(
                  hintText: "请输入邮箱",
                ),
                validator: (v) {
                  return v.trim().length > 0 ? null : "邮箱不能为空";
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

}