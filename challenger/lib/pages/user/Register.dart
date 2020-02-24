import 'package:challenger/component/CountDownWidget.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// author: zzxka
/// date: 2020/2/24
/// description: 
class Register extends StatefulWidget {
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {

  TextEditingController phoneController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  TextEditingController pwdController2 = new TextEditingController();
  GlobalKey formKey = new GlobalKey<FormState>();

  // 显示密码控制
  bool _passwordVisible=false;

  // 短信验证码
  String _codeInfo="获取验证码";
  bool _getCode=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200.0,
                  alignment: Alignment.bottomCenter,
//                padding: EdgeInsets.only(top: 40),
                  color: Colors.white,
                  child: Image.asset(
                    Constant.ASSETS_IMG + "icon.jpg", width: 90, height: 90,),
                ),
                // form表单
                Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40),
                  child: new Container(
                    child: Form(
                      key: formKey,
                      autovalidate: false,
                      child: Column(
                        children: <Widget>[
                          // 手机号
                          TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            controller: phoneController,
                            decoration: InputDecoration(
                                hintText: "手机号",
                                icon: Icon(Icons.person, color: Colors.grey,)
                            ),
                            validator: (v) {
                              return v
                                  .trim()
                                  .length > 0 ? null : "手机号不能为空";
                            },
                          ),
                          // 获取验证码
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: TextFormField(
                                autofocus: false,
                                controller: codeController,
                                decoration: InputDecoration(
                                  hintText: "短信验证码",
                                  icon: Icon(Icons.email, color: Colors.grey,),
                                  suffixIcon: GestureDetector(
                                    child: Container(
                                      width: 100,
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: !_getCode?Text("$_codeInfo"):CountDownWidget(
                                        onCountDownFinishCallBack: (value){
                                          if(value){
                                            setState(() {
                                              _codeInfo="重新获取验证码";
                                              _getCode=false;
                                            });
                                          }
                                        },
                                        second: 60,
                                        suffixText: "后重新获取",
                                      ),
                                    ),
                                    onTap: () async{
                                      Response response=await Dio().post(
                                        "http://192.168.0.126:8080/challenger-api/app/base/getYZM",
                                        data:{
                                          "phone": phoneController.text
                                        }
                                      );
                                      print(response);
                                      if(_getCode){
                                        return ;
                                      }
                                      print("获取短信验证码");
                                      setState(() {
                                        _getCode=true;
                                      });
                                    },
                                  ),
                                ),
                                validator: (v) {
                                  if(codeController.text=="" ||null==codeController.text){
                                    return "短信验证码不能为空";
                                  }
                                  return null;
                                }
                            ),
                          ),
                          // 密码
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: TextFormField(
                                autofocus: false,
                                controller: pwdController,
                                decoration: InputDecoration(
                                  hintText: "您的登录密码",
                                  icon: Icon(Icons.lock, color: Colors.grey,),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        _passwordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible ^= true;
                                         });
                                      }),
                                ),
                                obscureText: !_passwordVisible,
                                validator: (v) {
                                  return v
                                      .trim()
                                      .length > 5 ? null : "密码不能少于6位";
                                }
                            ),
                          ),
                          // 确认密码
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              autofocus: false,
                              controller: pwdController2,
                              decoration: InputDecoration(
                                hintText: "确认登录密码",
                                icon: Icon(Icons.lock, color: Colors.grey,),
                              ),
                              obscureText: true,
                              validator: (v) {
                                if(pwdController2.text=="" ){
                                  return "请确认登录密码";
                                }
                                return pwdController.text == pwdController2.text
                                    ? null
                                    : "两次密码不一致";
                              },
                            ),
                          ),
                          // 登录按钮
                          Padding(
                            padding: const EdgeInsets.only(top: 38.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: RaisedButton(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text("注册"),
                                    color: Theme
                                        .of(context)
                                        .primaryColor,
                                    textColor: Colors.blue,
                                    onPressed: () async {
                                      //在这里不能通过此方式获取FormState，context不对
                                      //print(Form.of(context));
                                      // 通过_formKey.currentState 获取FormState后，
                                      // 调用validate()方法校验用户名密码是否合法，校验
                                      // 通过后再提交数据。
                                      if ((formKey.currentState as FormState)
                                          .validate()) {
                                        //验证通过提交数据
                                        Response response=await Dio().post(
                                          "http://192.168.0.126:8080/challenger-api/app/auth/register",
                                          data:{
                                            "code": codeController.text,
                                            "password": pwdController.text,
                                            "phone": phoneController.text
                                          }
                                        );
                                        print(response);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}