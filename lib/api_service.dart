

 import 'package:dio/dio.dart';
import 'package:flutter_api_post_login_token/response_data.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';
@RestApi(baseUrl: "http://10.0.2.2:8000/api/user/")
abstract class ApiPostService {
  factory ApiPostService(Dio dio)=_ApiPostService;

  static ApiPostService create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiPostService(dio);
  }

  @POST("token/")
  @FormUrlEncoded()
  Future<ResponseData>postUserId(@Field('name')String name,@Field('password')String password);
}
