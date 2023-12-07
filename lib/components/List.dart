import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class List extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _List();
  }
}

class _List extends State<List> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
       for(int i=0;i<10;i++)  Padding(
          padding: EdgeInsets.all(20),
          child: Container(
          height: 150,
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Color.fromRGBO(247, 246, 255, 1)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  "https://i1.hdslb.com/bfs/archive/5ec5e6f82ebf5608d9bf015b5a3b316a7a4866fb.jpg",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("耗时两年个人C4D原创科幻短片 | Solar Pulse [太阳脉冲]",overflow: TextOverflow.visible,),
                        Text("1080px"),
                        SizedBox(
                          width: 220,
                          child: LinearProgressIndicator(
                            color: Colors.blueAccent,
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
        )
      ],
    );
  }
}
