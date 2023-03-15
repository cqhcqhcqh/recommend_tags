import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

final HttpClient httpClient = TagsHTTPClient('versa-ai.com');

abstract class HttpClient {
  Future<SimpleHTTPResponse> get(String path) async {
    throw (mustCallSuper);
  }
}

class TagsHTTPClient<T> implements HttpClient {
  final Dio dio;
  final String baseUrl;
  TagsHTTPClient(this.baseUrl) : dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  Future<SimpleHTTPResponse> get(String path) async {
    final Response<Map> response;
    try {
      final uri = Uri(path: path);
      response = await dio.getUri(uri);
      return SimpleHTTPResponse(
          statusCode: response.statusCode, data: response.data);
    } on DioError catch (e) {
      return SimpleHTTPResponse(error: e);
    } finally {}
  }
}

class SimpleHTTPResponse {
  final Exception? error;
  final int? statusCode;
  final Map? data;
  SimpleHTTPResponse({this.error, this.statusCode, this.data});
}

  // 1.
  // TagsHTTPClient(this.baseUrl); 等同于
  // TagsHTTPClient(String baseUrl) {
  // this.baseUrl = baseUrl;
  //}

  // 2.下面代码会报错，只有在 TagsHTTPClient(this.baseUrl) : dio = Dio(BaseOptions(baseUrl: baseUrl))才属于构造时期，构造时期
  // 只在 () 和 : 后面的语句<super 的调用也是在 : 后面进行>，不包括参数后面的闭包语句 {}
  // TagsHTTPClient(this.baseUrl) {
  //   dio = Dio(BaseOptions(baseUrl: baseUrl));
  // }

  // 3. super 的调用
  // class Vector2d {
  //   final double x;
  //   final double y;
  //   Vector2d(this.x, this.y);
  // }

  // class Vector3d extends Vector2d {
  //   final double z;
  // Forward the x and y parameters to the default super constructor like:
  // 下面两句是等同的
  // Vector3d(final double x, final double y, this.z) : super(x, y);
  // Vector3d(super.x, super.y, this.z);
  // }

  // 4. 等同
  // const TextSized22({required Key key}) : super(key: key);
  // const TextSized22({required super.key});

  // final 和 const 都表示变量不可以再次修改
  // 但是 const 是修饰编译常量的
  // final 决定变量只能被赋值一次