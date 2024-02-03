import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_model.freezed.dart';
part 'api_model.g.dart';

@freezed
class ApiPostModel with _$ApiPostModel {
  factory ApiPostModel(
      {required int id,
      required String title,
      required String body}) = _ApiPostModel;

  factory ApiPostModel.fromJson(Map<String, dynamic> json) =>
      _$ApiPostModelFromJson(json);
}
