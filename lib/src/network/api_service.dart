import 'package:dio/dio.dart';
import 'package:interview_task/src/constant/config.dart';
import 'package:interview_task/src/core/core_res_list.dart';
import 'package:interview_task/src/helpers/http_helper.dart';
import 'package:interview_task/src/models/home_data.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Config.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.interceptors.add(HttpHelper().getDioInterceptor());
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET("directory/dataList")
  Future<CoreResList<HomeData>> homeDataList();
}
