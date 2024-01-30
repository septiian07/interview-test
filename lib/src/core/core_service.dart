import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/src/app/app.locator.dart';
import 'package:interview_task/src/constant/config.dart';
import 'package:interview_task/src/helpers/shared_preferences_helper.dart';
import 'package:interview_task/src/injector/injector.dart';
import 'package:interview_task/src/network/api_service.dart';
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';

class CoreService {
  BuildContext? currentContext = StackedService.navigatorKey?.currentContext;
  ApiService apiService = ApiService(Dio());
  final SharedPreferencesHelper sharedPreferencesHelper =
      locatorLocal<SharedPreferencesHelper>();
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();
  String formattedDateAPI =
      DateFormat(Config.dateFormatAPI).format(DateTime.now());
}
