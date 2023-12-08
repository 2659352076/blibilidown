



import 'dart:convert';

class ParsePlay {


  static Map parsePlay(String res){
    RegExp reg = RegExp(r">window.__playinfo__=(.*?)<");
    Match? playinfo = reg.firstMatch(res);
    String info= (playinfo?.group(0)).toString();
    Map play = jsonDecode(info.substring(21,(info.length-1)));
    return play;
  }


}
