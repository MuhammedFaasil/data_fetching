
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:user_app/model/api_model.dart';
import 'package:user_app/services/api_services.dart';
final apiProvider = FutureProvider<List<ApiPostModel>?>((ref) async {
  return ApiService.fetchData();
});
