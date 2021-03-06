import 'package:challenger/Global.dart';
import 'package:challenger/utils/DioUtil.dart';
import 'package:challenger/utils/Toast.dart';
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
  List<DropdownMenuItem> categoryList=[DropdownMenuItem(value: 0,child: Text("请选择门类",style: InputDecorationTheme().hintStyle,),),];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
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
              onTap: () async{
                if(!(formKey.currentState as FormState).validate()){
                  return ;
                }
                DioUtil.getInstance(Global.token).dio.post(
                    "/app/knowledge/add",
                    data: {
                      "title":titleController.text,
                      "content":contentController.text,
                      "categoryId":"1"
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
                padding: EdgeInsets.only(top: 20),
                child: DropdownButtonFormField(
                  items: categoryList,
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

  void initData(){
    Global.categoryList.forEach((item){
      categoryList.add(DropdownMenuItem(value: item['id'],child: Text(item['categoryName'])));
    });
    setState(() {
    });
  }


}