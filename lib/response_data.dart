import 'package:json_annotation/json_annotation.dart';

part 'response_data.g.dart';

@JsonSerializable()
class ResponseData {
  final String token;

  ResponseData({required this.token});

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
