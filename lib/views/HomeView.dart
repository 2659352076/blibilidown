


import 'package:blbldown/views/AddDownload.dart';
import 'package:flutter/material.dart';
import '../components/List.dart';
class HomeView extends StatefulWidget{
  const HomeView({super.key});


  @override
  _HomeView createState() {
    return _HomeView();
  }

}
class _HomeView extends State<HomeView>{
  _onPresseds(){
    Navigator.pushNamed(context, "addDownload");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: _onPresseds , icon: Icon(Icons.add))],
        backgroundColor: Color.fromARGB(255, 135, 131, 246),
        centerTitle: true,
        title: Text("哔哩哔哩下载器",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(1, 138, 130, 246) ,
      body: List(),
    );
  }

}