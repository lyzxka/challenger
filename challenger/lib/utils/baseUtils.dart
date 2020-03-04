import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseUtil{

  static Size contextSize(BuildContext context){
    return MediaQuery.of(context).size;
  }
}