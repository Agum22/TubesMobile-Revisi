import 'package:android/Modul6/Model.dart';
import 'package:dio/dio.dart';

class DioClass {
  Dio dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8000',
        connectTimeout: 20000,
        sendTimeout: 20000,
        receiveTimeout: 20000,
        contentType: "application/json",
        responseType: ResponseType.json,
      )
  );
  
  Future<Welcome> getData()async{
    final res = await dio.get('/api/posts/show');
    return Welcome.fromJson(res.data);
  }

  Future<Welcome> delete (String id) async{
    final res = await dio.post('/api/posts/delete/$id');
    return Welcome.fromJson(res.data);
  }
}

