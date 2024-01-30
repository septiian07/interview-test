import 'dart:async';

import 'package:interview_task/src/app/app.router.dart';
import 'package:interview_task/src/core/core_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends FutureViewModel with CoreViewModel {
  final _duration = const Duration(seconds: 2);
  final currentTime = DateTime.now();

  @override
  Future futureToRun() => showNextPage();

  Future<void> showNextPage() async {
    Timer(_duration, showDashboard);
  }

  void showDashboard() => navigationService.clearStackAndShow(Routes.homeView);

  void blankView() => navigationService.clearStackAndShow(Routes.blankView);
}
