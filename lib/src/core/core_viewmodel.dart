import 'package:flutter/material.dart';
import 'package:interview_task/src/app/app.locator.dart';
import 'package:interview_task/src/app/app.router.dart';
import 'package:interview_task/src/constant/config.dart';
import 'package:interview_task/src/helpers/shared_preferences_helper.dart';
import 'package:interview_task/src/injector/injector.dart';
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';

class CoreViewModel {
  final navigationService = locator<NavigationService>();
  final dialogService = locator<DialogService>();
  final SharedPreferencesHelper sharedPreferencesHelper =
      locatorLocal<SharedPreferencesHelper>();
  BuildContext? currentContext = StackedService.navigatorKey?.currentContext;

  String formattedDate =
      DateFormat(Config.dayDateFormat).format(DateTime.now());
  String dateNow = DateFormat(Config.dateFormat).format(DateTime.now());
  String dateTimeNow = DateFormat(Config.dateTimeFormat).format(DateTime.now());
  String formattedDateAPI =
      DateFormat(Config.dateFormatAPI).format(DateTime.now());

  void back() => navigationService.back();

  // void main() => navigationService.clearStackAndShow(Routes.mainView);

  void showMessageError(String msg) {
    ScaffoldMessenger.of(currentContext!).showSnackBar(
      SnackBar(
        content: Text(msg),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void clearData() {
    sharedPreferencesHelper.clearAll();
  }
}
