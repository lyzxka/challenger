import 'package:challenger/Global.dart';
import 'package:challenger/utils/DioUtil.dart';
import 'package:flutter/material.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

class KnowledgeAdd extends StatefulWidget{
  KnowledgeAddState createState()=>KnowledgeAddState();
}

class KnowledgeAddState extends State<KnowledgeAdd>{

  GlobalKey formKey = new GlobalKey<FormState>();
  TextEditingController titleController=new TextEditingController();
  TextEditingController contentController=new TextEditingController();
  int type=0;
  GZXDropdownMenuController _gzxDropdownMenuController=new GZXDropdownMenuController();

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
              onTap: () async{
                /*DioUtil.getInstance(Global.token).dio.post(
                    "/app/user/changeInfo",
                    data: {
                      "name":titleController.text,
                      "email":contentController.text
                    }
                ).then((response){
                  print(response);
                  if(response.data['code']==0){
                    Navigator.pop(context);
                  }
                });*/
                print((formKey.currentState as FormState).validate());
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
                  decoration: InputDecoration(
                    hintText: "请输入标题",
                  ),
                  validator: ((v){
                    return v.trim().length==0?"标题不能为空":null;
                  }),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: DropdownButtonFormField(
                  items: [
                    DropdownMenuItem(value: 0,child: Text("请选择门类",style: InputDecorationTheme().hintStyle,),),
                    DropdownMenuItem(value: 1,child: Text("1"),),
                    DropdownMenuItem(value: 2,child: Text("2"),),
                    DropdownMenuItem(value: 3,child: Text("3"),),
                  ],
                  onChanged: (selectValue){//选中后的回调
                    setState(() {
                      type = selectValue;
                    });
                  },
                  value: type,
                  validator: ((v){
                    return v==0?"请选择门类":null;
                  }),
                )
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
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