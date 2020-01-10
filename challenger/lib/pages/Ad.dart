import 'package:challenger/constant/Constant.dart';
import 'package:flutter/material.dart';

class Ad extends StatefulWidget{
  AdState createState()=> AdState();
}
class AdState extends State<Ad>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(Constant.ASSETS_IMG+"moon.jpg"),
    );
  }

}