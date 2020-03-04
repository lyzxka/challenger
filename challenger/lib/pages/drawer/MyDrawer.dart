import 'package:challenger/Global.dart';
import 'package:challenger/constant/Constant.dart';
import 'package:challenger/pages/user/UserInfo.dart';
import 'package:flutter/material.dart';

/// author：zzxka
/// date：2020-01-12 13:29
/// description: 左侧抽屉
class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);
  MyDrawerState createState()=>MyDrawerState();
}
class MyDrawerState extends State<MyDrawer>{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.network(
                          Global.userIcon,
                          width: 50,height: 50,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      Global.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onTap: ((){
//                Global.getUserInfo();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return UserInfo();
                  }
                ));
              }),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: const Text('我的收藏'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text('我的知识'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.hourglass_empty),
                    title: const Text('我的比赛'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.group),
                    title: const Text('我的小队'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.history),
                    title: const Text('浏览记录'),
                  ),
                  /*ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('退出'),
                    onTap: (){
                      Global.loginCancel();
                      Navigator.pop(context);

                    },
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}