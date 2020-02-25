import 'package:challenger/constant/Constant.dart';
import 'package:flutter/material.dart';

/// author: zzxka
/// date: 2020/2/25
/// description: 
class PwdChange extends StatefulWidget {
  PwdChangeState createState() => PwdChangeState();
}

class PwdChangeState extends State<PwdChange> {
  TextEditingController phoneController = new TextEditingController();
  TextEditingController oldPwdController = new TextEditingController();
  TextEditingController newPwdController = new TextEditingController();
  TextEditingController newPwdController2 = new TextEditingController();
  GlobalKey formKey = new GlobalKey<FormState>();

  // 显示密码控制
  bool _passwordVisible=false;


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
                          // 原密码
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: TextFormField(
                                autofocus: false,
                                controller: oldPwdController,
                                decoration: InputDecoration(
                                  hintText: "请输入原密码",
                                  icon: Icon(Icons.lock, color: Colors.grey,),
                                ),
                                obscureText: _passwordVisible,
                                validator: (v) {
                                  return v
                                      .trim()
                                      .length > 5 ? null : "密码不能少于6位";
                                }
                            ),
                          ),
                          // 密码
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: TextFormField(
                                autofocus: false,
                                controller: newPwdController,
                                decoration: InputDecoration(
                                  hintText: "请输入新密码",
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
                                obscureText: _passwordVisible,
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
                              controller: newPwdController2,
                              decoration: InputDecoration(
                                hintText: "确认新密码",
                                icon: Icon(Icons.lock, color: Colors.grey,),
                              ),
                              obscureText: true,
                              validator: (v) {
                                if(newPwdController2.text=="" ){
                                  return "请确认新密码";
                                }
                                return newPwdController.text == newPwdController2.text
                                    ? null
                                    : "两次密码不一致";
                              },
                            ),
                          ),
                          // 登录按钮
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    child: Text("修改密码",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      //在这里不能通过此方式获取FormState，context不对
                                      //print(Form.of(context));
                                      // 通过_formKey.currentState 获取FormState后，
                                      // 调用validate()方法校验用户名密码是否合法，校验
                                      // 通过后再提交数据。
                                      if ((formKey.currentState as FormState)
                                          .validate()) {
                                        //验证通过提交数据
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