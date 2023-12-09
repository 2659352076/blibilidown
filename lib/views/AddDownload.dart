import 'dart:convert';
import 'dart:io';

import 'package:html/dom.dart' as dom;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import '../utils/ParsePlay.dart';
import '../utils/Request.dart';

class AddDownload extends StatefulWidget {
  @override
  _AddDownload createState() {
    return _AddDownload();
  }
}

class _AddDownload extends State<AddDownload> {
  TextEditingController _a = TextEditingController();

  _clickBack() {
    Navigator.pop(context);
  }

  _toast(String te) {
    var snackBar = SnackBar(
      content: Text(te),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  String? videoTitle='';
  String? image='';

  _clickDownload() async {
    String value = _a.text.trim();
    String bv = "BV".toLowerCase();
    String val = value.toLowerCase();
    if (value.isEmpty) {
      _toast("不能为空");
    } else if (!value.contains("BV")) {
      _toast("链接有误");
    } else if (val.substring(0, 2).compareTo(bv) == 0) {
      Response? result = await Request.get(
          'https://www.bilibili.com/video/$value/?spm_id_from=333.1007.tianma.1-1-1.click&vd_source=802f1da793ead12c1dc26f782f4820d1');
      dom.Document document = parse(result.toString());
      videoTitle=  document.querySelector(".video-title")?.innerHtml;
      RegExp imageReg = RegExp(r'<meta data-vue-meta="true" itemprop="image" content="(.*?)">');
      String? img = imageReg.firstMatch(result.toString())?.group(0).toString();
      image=img?.substring(53,(img.length-2));
      print("image : $image");
      Map play = ParsePlay.parsePlay(result.toString());
      var video = play['data']['dash']['video'];
      List supportFormats = play['data']["support_formats"];
      showDefinition(supportFormats,video);
    }
  }
  _onTapDownload(supportFormat, videos) {
    String videoPath = '';
    for(Map video in videos){
      if(supportFormat["quality"].toString().compareTo(video['id'].toString())==0){
        videoPath =video["baseUrl"];
        break;
      }
    }
    if(!videoPath.isEmpty){
      File file = File("../../task.json");
      Request.download(videoPath ,"./$videoTitle");
      List<dynamic> data = jsonDecode(file.readAsString().toString());
      data.add({
        "videoTitle":videoTitle,

      });
    }
  }
  showDefinition(List supportFormats, videos) {
    showDialog(
        context: context,
        builder: (BuildContext builder) {
          var child = Container(
              height: 150,
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start ,
                children: [
                  Text(
                    "请选择清晰度",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: supportFormats.length,
                          itemBuilder: (BuildContext context, int index) {

                            return TextButton(onPressed:(){
                              _onTapDownload(supportFormats[index],videos);
                            },child: Text("${supportFormats[index]['new_description']}"));
                          }))
                ],
              ));
          return Dialog(child: child);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 135, 131, 246),
        title: Text(
          "添加下载链接",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_return),
          onPressed: _clickBack,
        ),
      ),
      body: Container(
        color: Color.fromARGB(1, 138, 130, 246),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                maxLines: 10,
                controller: _a,
                decoration: InputDecoration(
                  hintText: "输入视频链接",
                  border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(10),
                      borderSide:BorderSide(color: Colors.deepPurpleAccent)
                  )
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextButton(
                  onPressed: _clickDownload,
                  child: Text("添加下载"),
                ),
              )

            ],
          )),
        ),
      ),
    );
  }
}
