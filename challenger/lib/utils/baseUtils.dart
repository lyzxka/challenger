import 'package:flutter/material.dart';

class BaseUtil{
  static Size contextSize(BuildContext context){
    return MediaQuery.of(context).size;
  }
}