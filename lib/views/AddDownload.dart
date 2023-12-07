
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class AddDownload extends StatefulWidget{
  @override
  _AddDownload createState() {
    return _AddDownload();
  }

}





class _AddDownload extends State<AddDownload>{

  TextEditingController _a = TextEditingController();

  _clickBack(){
    Navigator.pop(context);
  }

  _toast(String te){
    var snackBar = SnackBar(
      content: Text(te) ,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }


  Dio dio = Dio();
  _clickDownload(){
    String value =  _a.text.trim();
    String bv = "BV".toLowerCase();
    String val = value.toLowerCase();
    int r= val.substring(0,2).compareTo(bv);
    if(value.isEmpty){
      _toast("不能为空");
    }else if(!value.contains("BV")){
        _toast("链接有误");
    }
    else if(r==0){
      var path = value.toUpperCase();
      print(path);
      dio.get("https://www.bilibili.com/video/"+path).then((res){
        RegExp reg = RegExp(r"window\.__playinfo__=(.*)");
        Match? playinfo = reg.firstMatch(res.toString());
        print(playinfo.runtimeType);
      });
    }


  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 135, 131, 246),
        title: Text("添加下载链接",style: TextStyle(
          fontSize: 15,
        ),),
        leading: IconButton(icon: Icon(Icons.keyboard_return), onPressed: _clickBack,),
      ),
      body: Container(
        color: Color.fromARGB(1, 138, 130, 246),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _a,
                  decoration: InputDecoration(
                    hintText: "输入视频链接",
                  ),
                ),

                TextButton(onPressed: _clickDownload, child: Text("添加下载"),style: ButtonStyle(

                ),)
              ],
            )
          ),
        ),
      ),
    );
  }

}