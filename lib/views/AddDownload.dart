import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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

  _clickDownload() async {
    String value = _a.text.trim();
    String bv = "BV".toLowerCase();
    String val = value.toLowerCase();
    int r = val.substring(0, 2).compareTo(bv);
    if (value.isEmpty) {
      _toast("不能为空");
    } else if (!value.contains("BV")) {
      _toast("链接有误");
    } else if (r == 0) {
      Response? result = await Request.get('https://www.bilibili.com/video/$value/?spm_id_from=333.1007.tianma.1-1-1.click&vd_source=802f1da793ead12c1dc26f782f4820d1');
      Map play = ParsePlay.parsePlay(result.toString());
      var videos = play['data']['dash']['video'];
      print(videos);
    }
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
                controller: _a,
                decoration: InputDecoration(
                  hintText: "输入视频链接",
                ),
              ),
              TextButton(
                onPressed: _clickDownload,
                child: Text("添加下载"),
                style: ButtonStyle(),
              )
            ],
          )),
        ),
      ),
    );
  }
}
