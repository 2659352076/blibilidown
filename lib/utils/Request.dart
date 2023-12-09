



import 'package:dio/dio.dart';

class Request{



  static BaseOptions baseOptions = BaseOptions(headers: {
    'Sec-Fetch-Dest':'document',
    'Sec-Fetch-Mode':'navigate',
    'Sec-Fetch-Site':'none',
    'Sec-Fetch-User':'?1',
    'Upgrade-Insecure-Requests':'1',
    'Referer':'https://www.bilibili.com/',
    'Accept-Language':'zh-CN,zh;q=0.9',
    'Cache-Control':'max-age=0',
    'Cookie':" buvid3=01F39575-30ED-3AD4-70BF-C3F5180806C832542infoc; b_nut=1696637032; i-wanna-go-back=-1; b_ut=7; _uuid=44913782-C8EA-9FCB-BF107-B910D9E4ECE5A33561infoc; buvid4=0AFCEA6D-2C7C-F0B9-6BF8-DD836E7D502833625-023100708-PZp2A9trCiXTwYUbHyrfSw%3D%3D; header_theme_version=CLOSE; LIVE_BUVID=AUTO2316966838532936; rpdid=|(k|~kR~Ylkk0J'uYmYY)JmY); buvid_fp_plain=undefined; DedeUserID=399374803; DedeUserID__ckMd5=ef190ea98eb2acb1; enable_web_push=ENABLE; iflogin_when_web_push=1; is-2022-channel=1; CURRENT_BLACKGAP=0; CURRENT_FNVAL=4048; hit-dyn-v2=1; fingerprint=18a72c8f731d15c3484ff8931d7f596c; CURRENT_QUALITY=80; SESSDATA=3210e1a0%2C1717482974%2C7b5d1%2Ac1CjBhPdplXNNu3048KaIuUDCMsll-HR99-B6N07UUNgULV0GkJFFXlJc6VFAcsHuWqwoSVnBuTDBiUmJfNmdIbnVnYm44T09tYUNZX0VVV0FPbEdRTFd5MWkzaF9jWC1XcjJDYUd6YVpQanlPS0NWTG9COWVDcWJjSXUybGg1RVNSeTN0Yi1hcUhnIIEC; bili_jct=54e856657a6b4e5170deccd1492383ca; sid=63ej2yju; buvid_fp=659c5f6dca6bee5cc8b49d96da20faca; bp_video_offset_399374803=872690118520995877; b_lsid=4755D8F6_18C494CC161; bmg_af_switch=1; bmg_src_def_domain=i0.hdslb.com; home_feed_column=5; browser_resolution=1920-931; bili_ticket=eyJhbGciOiJIUzI1NiIsImtpZCI6InMwMyIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDIyOTYxNTgsImlhdCI6MTcwMjAzNjg5OCwicGx0IjotMX0.as6OG4Vn1dkodf8M8QMeB6wUnrOZCuFsn072u92iD3U; bili_ticket_expires=1702296098; PVID=2",
    'Accept':'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
    'User-Agent':'Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.188 Safari/537.36 CrKey/1.54.250320'
  });
  static Dio dio = Dio(baseOptions);

  static get(String path)  {
    return dio.get(path);
  }
  static download(String path,String filePath)  {
    baseOptions.headers.addAll({
      "Range":"bytes=0-999999999999999",
    });

    return dio.download(path,filePath);
  }

}