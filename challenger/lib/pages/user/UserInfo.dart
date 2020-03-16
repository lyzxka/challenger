import 'package:challenger/Global.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/pages/user/ChangeUserInfo.dart';
import 'package:challenger/utils/DioUtil.dart';
import 'package:challenger/utils/Toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// author: zzxka
/// date: 2020/3/3
/// description: 
class UserInfo extends StatefulWidget {
  UserInfoState createState() => UserInfoState();
}

class UserInfoState extends State<UserInfo> {
  var img;
  String name=Global.name==null?"未命名":Global.name;
  String email=Global.email==null?"未绑定":Global.email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人信息",style: TextStyle(fontSize: 18),),
      ),
      body: Container(
//        color: Color.fromRGBO(233, 233, 233, .9),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  // 头像
                  GestureDetector(
                    child: Container(
                      constraints: BoxConstraints.tightFor(height: 70),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(child: Text("头像",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),),
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(right: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: null==img
                                  ?Image.network(Global.userIcon,fit: BoxFit.fill)
                                  :Image.file( img,fit: BoxFit.fill),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () async {
                      // 相册
                      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
                      FormData formData = FormData.fromMap({
                        "file": await MultipartFile.fromFile(
                          image.path,                                //图片路径
                          filename: "userIcon.jpg",            //图片名称
                        )
                      });
                      Map<String, dynamic> map ={'fileType':"KTP_IMG"};
                      Response response = await Dio().post(          //上传结果
                        Constant.API_URL+"/app/base/upload",
                        data: formData,
                        queryParameters: map,
                        onSendProgress: (int count, int total) {
                          print('-----------${count / total}-------------');  //上传进度
                        },
                      );
                      if(response.data['code']==0){
                        DioUtil.getInstance(Global.token).dio.post(
                            "/app/user/changeInfo",
                            data: {
                              "photo":response.data['url']
                            }
                        ).then((res){
                          print(res);
                          if(res.data['code']==0){
                            Global.getUserInfo();
                            img=image;
                            Toast.toast(context,msg: "修改头像成功");
                          }else if(res.data['code']==401){
                            Global.loginCancel();
                          }else{
                            img=null;
                            Toast.toast(context,msg: res.data['msg']);
                          }
                          setState(() {});
                        });
                      }else{
                        img=null;
                        setState(() {});
                        Toast.toast(context,msg:response.data['msg']);
                      }
                      print(response);
                      // 拍照
//                      var image = await ImagePicker.pickImage(source: ImageSource.camera);
//                      print(image);
                    },
                  ),
                  Divider(color: Colors.grey,height: 2,),
                  GestureDetector(
                    child: Container(
                      constraints: BoxConstraints.tightFor(height: 50),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Text("昵称",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                          ),
                          Container(
                            margin: EdgeInsets.only(right:20),
                            child: Text(name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey)),
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      var result=Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                         return ChangeUserInfo(type: 1,name:Global.name);
                        }
                      ));
                      result.then((data){
                        if(null!=data) {
                          setState(() {
                            name = data;
                          });
                        }
                      });
                    },
                  ),
                  Divider(color: Colors.grey,height: 2,),
                  Container(
                    constraints: BoxConstraints.tightFor(height: 50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          child: Text("手机号",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                        ),
                        Container(
                          margin: EdgeInsets.only(right:20),
                          child: Text(Global.phone,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey)),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey,height: 2,),
                  GestureDetector(
                    child: Container(
                      constraints: BoxConstraints.tightFor(height: 50),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Text("邮箱",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                          ),
                          Container(
                            margin: EdgeInsets.only(right:20),
                            child: Text(email,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey)),
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      var result=Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return ChangeUserInfo(type: 2,name:Global.email);
                          }
                      ));
                      result.then((data){
                        if(null!=data) {
                          setState(() {
                            email = data;
                          });
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15,),
              margin: EdgeInsets.only(top: 10,),
              color: Colors.white,
              child: GestureDetector(
                child: Container(
                  constraints: BoxConstraints.tightFor(height: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Text("退出",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                      ),
                      Container(
                        margin: EdgeInsets.only(right:20),
                        child: Icon(Icons.exit_to_app,size: 25,color: Colors.grey,),
                      )
                    ],
                  ),
                ),
                onTap: (){
                  // 退出
                  Global.loginCancel();
                  Navigator.pop(context);
                  // 关闭drawer
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}