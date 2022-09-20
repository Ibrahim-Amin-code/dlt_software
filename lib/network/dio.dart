import 'package:dio/dio.dart';

// ignore: constant_identifier_names
const String BaseUrl = "https://dlt-software.com/wp-json/wp/v2/pages/";

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BaseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers =
        //  (token != null)
        //     ? {
        //         'Accept': 'application/json',
        //         // 'lang': 'en',
        //         // 'Authorization': token
        //         // 'Accept': '*/*',
        //       }
        //     :

        {
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      // 'Authorization': 'Basic YWRtaW46QWhtZWQyNDk5MjA4OUA=',
      'Host': '<calculated when request is sent>',
      'User-Agent': 'PostmanRuntime/7.29.2',
    };

    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic> data,
      String? token,
      Map<String, dynamic>? query}) async {
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
      options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': token,
          }),
    );
  }
}
