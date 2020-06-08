import 'package:challenger/Global.dart';
import 'package:challenger/utils/DioUtil.dart';
import 'package:challenger/utils/Toast.dart';
import 'package:flutter/material.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

class SearchFriendAdd extends StatefulWidget{
  SearchFriendAddState createState()=>SearchFriendAddState();
  num id;
  SearchFriendAdd({Key key,this.id}):super(key:key);
}

class SearchFriendAddState extends State<SearchFriendAdd>{

  GlobalKey formKey = new GlobalKey<FormState>();
  TextEditingController titleController=new TextEditingController();
  TextEditingController groupNameController=new TextEditingController();
  TextEditingController groupNumController=new TextEditingController();
  TextEditingController contentController=new TextEditingController();
  int type=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分享知识"),
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
              onTap: ()  {
                if(!(formKey.currentState as FormState).validate()){
                  return ;
                }
                DioUtil.getInstance(Global.token).dio.post(
                    "/app/group/groupCreate",
                    data: {
                      "title":titleController.text,
                      "content":contentController.text,
                      "groupName":groupNameController.text,
                      "userNum":groupNumController.text,
                      "matchId":widget.id,
                    }
                ).then((response){
                  print(response);
                  if(response.data['code']==0){
                    Toast.toast(context,msg: "发布成功");
                    Navigator.pop(context);
                    setState(() {

                    });
                  }else{
                    Toast.toast(context,msg: response.data['msg']);
                  }
                });
              },
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15,right: 15),
        child: Form(
          key: formKey,
          autovalidate: false,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "请输入标题",
                  ),
                  validator: ((v){
                    return v.trim().length==0?"标题不能为空":null;
                  }),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: groupNameController,
                  decoration: InputDecoration(
                    hintText: "请输入队名",
                  ),
                  validator: ((v){
                    return v.trim().length==0?"队名不能为空":null;
                  }),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: groupNumController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "请输入招募人数",
                  ),
                  validator: ((v){
                    return v.trim().length==0?"招募人数不能为空":null;
                  }),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: contentController,
                  decoration: InputDecoration(
                    hintText: "请输入正文",
                  ),
                  maxLines: 12,
                  minLines: 8,
                  validator: ((v){
                    return v.trim().length<9?"正文不能少于10字符":null;
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



}