import 'dart:io';

import 'package:blbldown/views/AddDownload.dart';
import 'package:flutter/material.dart';
import './views/LayoutView.dart';
Future<void> main() async {
  runApp(const MyApp());
  File file = File("./task.json");
  if(await file.exists()){
    file.create();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bl下载器',
      routes: {
        'addDownload':(context)=> AddDownload(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LayoutView(),

    );
  }
}


