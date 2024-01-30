import 'dart:async';
import 'dart:io' as io;

import 'package:interview_task/src/app/app.locator.dart';
import 'package:interview_task/src/app/app.router.dart';
import 'package:interview_task/src/core/core_res_list.dart';
import 'package:interview_task/src/core/core_viewmodel.dart';
import 'package:interview_task/src/enum/dialog_type.dart';
import 'package:interview_task/src/models/home_data.dart';
import 'package:interview_task/src/models/playlist.dart';
import 'package:interview_task/src/network/network_exceptions.dart';
import 'package:interview_task/src/network/result_state.dart';
import 'package:interview_task/src/services/home_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel with CoreViewModel {
  final _homeService = locator<HomeService>();

  List<HomeData> dataList = [];
  HomeData? homeData;
  Playlist? currentPlaylist;

  bool checking = false;

  String? pathFileOffline;

  @override
  Future futureToRun() => getHomeData();

  Future<ResultState<CoreResList<HomeData>>> getHomeData() async {
    var result = await _homeService.fetchHomeEvent();
    return result.when(
      success: (CoreResList<HomeData> data) async {
        dataList = data.data ?? [];
        if (dataList.isNotEmpty) {
          homeData = dataList.first;
          checking = true;
          homeData?.playlist?.forEach((element) async {
            await checkingFileExists(element);
          });
          checking = false;
        }
        notifyListeners();
        return ResultState.data(data: data);
      },
      failure: (
        NetworkExceptions error,
        String? message,
      ) async {
        notifyListeners();
        showMessageError('$error');
        return ResultState.error(error: error);
      },
    );
  }

  Future checkingFileExists(Playlist playlist) async {
    var syncPath;
    if (playlist.type == 'image') {
      syncPath = await '/storage/emulated/0/Download/${playlist.title}.jpeg';
    } else {
      syncPath = await '/storage/emulated/0/Download/${playlist.title}';
    }

    await io.File(syncPath).exists();
    bool existsFile = io.File(syncPath).existsSync();

    playlist.fileExists = existsFile;

    notifyListeners();
  }

  String? getVimeoVideoId(String vimeoLink) {
    RegExp regExp = RegExp(r'/video/(\d+)');

    RegExpMatch? match = regExp.firstMatch(vimeoLink);

    if (match != null && match.groupCount == 1) {
      return match.group(1);
    } else {
      return null;
    }
  }

  void clear() {
    pathFileOffline = null;
    notifyListeners();
  }

  Future<void> deleteFile(Playlist playlist) async {
    var syncPath;
    if (playlist.type == 'image') {
      syncPath = await '/storage/emulated/0/Download/${playlist.title}.jpeg';
    } else {
      syncPath = await '/storage/emulated/0/Download/${playlist.title}';
    }
    await io.File(syncPath).delete();
    await checkingFileExists(playlist);
    showMessageError('Berhasil dihapus');
    notifyListeners();
  }

  Future<bool> showConfirmDialog(
    Playlist playlist, {
    String? title,
    String? negativeLabel,
    String? positiveLabel,
  }) async {
    var response = await dialogService.showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.confirmation,
      title: title,
      mainButtonTitle: positiveLabel,
      secondaryButtonTitle: negativeLabel,
    );
    if (response?.confirmed == true) {
      await deleteFile(playlist);
      notifyListeners();
    }

    return response?.confirmed ?? false;
  }

  void blankView() => navigationService.clearStackAndShow(Routes.blankView);
}
