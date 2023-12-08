



import 'package:dio/dio.dart';

class Request{

  // static BaseOptions options = BaseOptions(headers: {
  // 'Referer':'https://www.bilibili.com/',
  //  'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3970.5 Safari/537.36'
  // });

  static Dio dio = Dio();

  static get(String path)  {
    var result = dio.request(path,options: Options(headers: {
      'Referer':'https://www.bilibili.com/',
      'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3970.5 Safari/537.36'
    }));
    return result;
  }

}