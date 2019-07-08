import "package:dio/dio.dart";
import "dart:async";
import "dart:io";
import '../config/service_url.dart';

Future fetchData(String fetchKey, {formData}) async {
  try {
    print('开始获取数据。。。。。。。。。。。。。。。。。');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    if (formData == null) {
      response = await dio.post(servicePath[fetchKey]);
    } else {
       response = await dio.post(servicePath[fetchKey],data:formData);
    }
    if (response.statusCode == 200) {
      print("成功！");
      return response.data;
      
    
    } else {
      print("后端接口异常，请检查接口！");
      throw("后端接口异常，请检查接口！");
      
    }
  } catch(e) { 
      return print("ERROR:===================>${e}");
  }
}