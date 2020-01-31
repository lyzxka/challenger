import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-20 16:35
/// description: 
class BottomLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(240, 239, 239,0),
              Colors.white,
            ]),
      ),
      alignment: AlignmentDirectional.center,
      child: Text("已经到底了",style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.3)),),
    );
  }
}
