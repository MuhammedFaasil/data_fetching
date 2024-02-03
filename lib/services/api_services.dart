
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:user_app/model/api_model.dart';
class ApiService {
  static final dio = Dio();
  static Future<List<ApiPostModel>?> fetchData() async {
    const path = 'https://jsonplaceholder.typicode.com/posts';
    try {
      final Response response = await dio.get(path);
      if (response.statusCode == 200) {
        final posts = <ApiPostModel>[];
        for (var i in response.data) {
          posts.add(ApiPostModel.fromJson(i));
        }
        return posts;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
