import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../Models/CoinsModel.dart';
import '../Models/HashTagsModel.dart';
import '../Models/TagCatesModel.dart';

final HttpClient httpClient = TagsHTTPClient('versa-ai.com');

abstract class HttpClient {
  Future<T> get<T extends SimpleHTTPResponse>(String path) async {
    throw (mustCallSuper);
  }
}

class TagsHTTPClient implements HttpClient {
  final Dio dio;
  final String baseUrl;
  TagsHTTPClient(this.baseUrl) : dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  Future<T> get<T extends SimpleHTTPResponse>(String path) async {
    final Response<Map> response;
    try {
      final uri = Uri(path: path);
      response = await dio.getUri(uri);
      return SimpleHTTPResponse<T>.from(response) as T;
    } on DioError catch (e) {
      return SimpleHTTPResponse(error: e) as T;
    } finally {}
  }
}

class SimpleHTTPResponse<T> {
  final Exception? error;
  int? statusCode;
  final Map? data;
  SimpleHTTPResponse({this.error, this.statusCode, this.data});

  /// Factory constructors
  /// 用法 1
  /// `Use the factory keyword when implementing a constructor that doesn’t always create a new instance of its class`
  /// 用法 2
  /// Another use case for factory constructors is initializing a final variable using logic that can’t be handled in the initializer list
  /// 工厂构造，用来方便构造可能不是这个 SimpleHTTPResponse 类型的实例（子类/或者是缓存的实例）
  /// 或者构造不方便（初始化列表 eg. 22 行给 final dio 赋值，如果 options 中的其他参数不需要存储在 `TagsHTTPClient` 的时候）在初始列表中构造的 final variable 属性
  /// 就可以通过工厂构造来构造属性参数
  factory SimpleHTTPResponse.from(Response<Map> response) {
    final map = {'data': Null};
    final json = (response.data ?? map) as Map<String, dynamic>;
    if (T is CoinsModel) {
      final coins = CoinsModel.fromJson(json);
      coins.statusCode = response.statusCode;
      return coins as SimpleHTTPResponse<T>;
    } else if (T is HashTags) {
      final tags = HashTags.fromJson(json) ;
      tags.statusCode = response.statusCode;
      return tags as SimpleHTTPResponse<T>;
    } else if (T is TagCates) {
      final cates = TagCates.fromJson(json) ;
      cates.statusCode = response.statusCode;
      return cates as SimpleHTTPResponse<T>;
    } else {
      throw NotNullableError;
    }
  }  
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