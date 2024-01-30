import 'package:interview_task/src/core/core_res_list.dart';
import 'package:interview_task/src/core/core_service.dart';
import 'package:interview_task/src/models/home_data.dart';
import 'package:interview_task/src/network/api_result.dart';
import 'package:interview_task/src/network/network_exceptions.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class HomeService extends CoreService {
  Future<ApiResult<CoreResList<HomeData>>> fetchHomeEvent() async {
    try {
      var result = await apiService.homeDataList();
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e, true),
      );
    }
  }
}
