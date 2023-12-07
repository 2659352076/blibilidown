

import 'package:flutter/material.dart';

class UserCompoent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _UserCompoent();
  }

}


class _UserCompoent extends State<UserCompoent>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(234,230,255,1),
      body:Container(
          decoration:  BoxDecoration(

          ),
          child: Text("个人中心"),
        ),
    );
  }

}