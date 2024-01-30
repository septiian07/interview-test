import 'dart:io';

import 'package:flutter/material.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/models/playlist.dart';
import 'package:interview_task/src/ui/shared/colors.dart';
import 'package:interview_task/src/ui/shared/dimens.dart';
import 'package:interview_task/src/ui/shared/styles.dart';
import 'package:interview_task/src/ui/shared/ui_helpers.dart';
import 'package:interview_task/src/ui/widgets/loading.dart';
import 'package:interview_task/src/ui/widgets/playlist_menu.dart';
import 'package:pod_player/pod_player.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late final PodPlayerController _podController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );

    try {
      _podController = PodPlayerController(
        playVideoFrom: PlayVideoFrom.vimeo('558445492'),
      )..initialise();
    } catch (e) {
      print(e);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
    _podController.dispose();
  }

  Future changeVideo(String videoId) async {
    try {
      await _podController.changeVideo(
        playVideoFrom: PlayVideoFrom.vimeo(videoId),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        endDrawer: Container(
          width: screenWidthPercentage(context, percentage: 0.4),
          color: BaseColors.white,
          padding: EdgeInsets.symmetric(
            vertical: SDP.sdp(padding),
            horizontal: SDP.sdp(padding),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "This is drawer",
                style: interBlackSemiBoldTextStyle.copyWith(
                  fontSize: SDP.sdp(headline5),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: vm.homeData?.logo == null || vm.homeData?.logo == ''
              ? Text(
                  "Logo",
                  style: interBlackSemiBoldTextStyle.copyWith(
                    fontSize: SDP.sdp(20),
                  ),
                )
              : Container(
                  height: SDP.sdp(50),
                  width: SDP.sdp(140),
                  decoration: BoxDecoration(
                    image: vm.homeData?.logo == null || vm.homeData?.logo == ''
                        ? null
                        : DecorationImage(
                            image: NetworkImage(
                              vm.homeData?.logo ?? '',
                            ),
                            fit: BoxFit.fitWidth,
                          ),
                  ),
                ),
          elevation: 0,
        ),
        body: Loading(
          status: vm.isBusy || vm.checking,
          child: SafeArea(
            child: Container(
              height: screenHeight(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (vm.currentPlaylist == null)
                    Container(
                      height: SDP.sdp(200),
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                        image: vm.homeData?.banner == null ||
                                vm.homeData?.banner == ''
                            ? null
                            : DecorationImage(
                                opacity: 0.4,
                                image: NetworkImage(
                                  vm.homeData?.banner ?? '',
                                ),
                                colorFilter: ColorFilter.mode(
                                    BaseColors.black.withOpacity(0.8),
                                    BlendMode.overlay),
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                      child: vm.homeData?.banner == null ||
                              vm.homeData?.banner == ''
                          ? Icon(
                              Icons.image_outlined,
                              color: Color.fromARGB(255, 37, 19, 19),
                              size: SDP.sdp(100),
                            )
                          : Container(),
                    )
                  else if (vm.currentPlaylist?.type == 'image')
                    Container(
                      height: SDP.sdp(200),
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                        image: vm.currentPlaylist?.url == null ||
                                vm.currentPlaylist?.url == ''
                            ? null
                            : DecorationImage(
                                opacity: 0.4,
                                image:
                                    NetworkImage(vm.currentPlaylist?.url ?? ''),
                                colorFilter: ColorFilter.mode(
                                    BaseColors.black.withOpacity(0.8),
                                    BlendMode.overlay),
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                      child: vm.currentPlaylist?.url == null ||
                              vm.currentPlaylist?.url == ''
                          ? Icon(
                              Icons.image_outlined,
                              color: Color.fromARGB(255, 37, 19, 19),
                              size: SDP.sdp(100),
                            )
                          : Container(),
                    )
                  else if (vm.currentPlaylist?.type == 'video')
                    Container(
                      height: SDP.sdp(200),
                      width: screenWidth(context),
                      child: PodVideoPlayer(controller: _podController),
                    ),
                  verticalSpace(SDP.sdp(space)),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: SDP.sdp(smallPadding)),
                    child: Text(
                      vm.currentPlaylist?.title ?? '',
                      style: interBlackBoldTextStyle.copyWith(
                        fontSize: SDP.sdp(headline55),
                      ),
                    ),
                  ),
                  verticalSpace(SDP.sdp(4)),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: SDP.sdp(smallPadding)),
                    child: Text(
                      vm.currentPlaylist?.description ?? '',
                      style: interBlackRegularTextStyle.copyWith(
                        fontSize: SDP.sdp(headline6),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  verticalSpace(SDP.sdp(defaultPadding)),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SDP.sdp(smallPadding),
                          ),
                          child: Container(
                            height: SDP.sdp(40.0),
                            width: screenWidth(context),
                            decoration: BoxDecoration(
                              color: BaseColors.primary,
                              borderRadius: BorderRadius.circular(
                                SDP.sdp(space),
                              ),
                            ),
                            child: TabBar(
                              indicatorPadding: EdgeInsets.symmetric(
                                horizontal: SDP.sdp(smallPadding),
                              ),
                              isScrollable: true,
                              controller: _tabController,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  SDP.sdp(space),
                                ),
                                color: BaseColors.blue,
                              ),
                              labelPadding: EdgeInsets.symmetric(
                                horizontal: SDP.sdp(padding),
                              ),
                              labelColor: Colors.white,
                              labelStyle: interBlackSemiBoldTextStyle.copyWith(
                                fontSize: SDP.sdp(headline55),
                                color: BaseColors.white,
                              ),
                              unselectedLabelColor: Colors.black,
                              unselectedLabelStyle:
                                  interBlackSemiBoldTextStyle.copyWith(
                                fontSize: SDP.sdp(headline55),
                              ),
                              tabs: const [
                                Tab(
                                  text: 'Produk',
                                ),
                                Tab(
                                  text: 'Materi',
                                ),
                                Tab(
                                  text: 'Layanan',
                                ),
                                Tab(
                                  text: 'Lainnya',
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpace(SDP.sdp(bigSpace)),
                        Expanded(
                          child: TabBarView(
                            physics: const BouncingScrollPhysics(),
                            controller: _tabController,
                            children: [
                              Column(
                                children: [
                                  Expanded(
                                    child: ListView(
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount:
                                              vm.homeData?.playlist?.length ??
                                                  0,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: SDP.sdp(smallPadding),
                                          ),
                                          itemBuilder: (context, index) {
                                            final item =
                                                vm.homeData?.playlist?[index];
                                            return PlaylistMenu(
                                              onTap: () async {
                                                vm.currentPlaylist = item;
                                                if (item?.type == 'video') {
                                                  var videoId =
                                                      vm.getVimeoVideoId(
                                                          item?.url ?? '');
                                                  changeVideo(videoId ?? '');
                                                }
                                                setState(() {});
                                              },
                                              onDelete: () async {
                                                vm.showConfirmDialog(
                                                  item ?? Playlist(),
                                                  title:
                                                      'Apakah anda ingin menghapusnya?',
                                                  positiveLabel: 'Ya',
                                                  negativeLabel: 'Batal',
                                                );
                                                setState(() {});
                                              },
                                              onSave: () {
                                                setState(() {
                                                  FileDownloader.downloadFile(
                                                    url: item?.url ?? '',
                                                    name: item?.title,
                                                    onDownloadCompleted:
                                                        (path) async {
                                                      final File file =
                                                          File(path);
                                                      vm.showMessageError(
                                                          'Berhasil diunduh $path');
                                                      await vm
                                                          .checkingFileExists(
                                                              item ??
                                                                  Playlist());
                                                      setState(() {});
                                                    },
                                                    onDownloadError:
                                                        (errorMessage) {
                                                      vm.showMessageError(
                                                          errorMessage);
                                                    },
                                                  );
                                                });
                                              },
                                              title: item?.title,
                                              description: item?.description,
                                              fileExists: item?.fileExists,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Expanded(
                                    child: ListView(
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount:
                                              vm.homeData?.playlist?.length ??
                                                  0,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: SDP.sdp(smallPadding),
                                          ),
                                          itemBuilder: (context, index) {
                                            final item =
                                                vm.homeData?.playlist?[index];
                                            return PlaylistMenu(
                                              onTap: () async {
                                                vm.currentPlaylist = item;
                                                if (item?.type == 'video') {
                                                  var videoId =
                                                      vm.getVimeoVideoId(
                                                          item?.url ?? '');
                                                  changeVideo(videoId ?? '');
                                                }
                                                setState(() {});
                                              },
                                              onDelete: () async {
                                                vm.showConfirmDialog(
                                                  item ?? Playlist(),
                                                  title:
                                                      'Apakah anda ingin menghapusnya?',
                                                  positiveLabel: 'Ya',
                                                  negativeLabel: 'Batal',
                                                );
                                                setState(() {});
                                              },
                                              onSave: () {
                                                setState(() {
                                                  FileDownloader.downloadFile(
                                                    url: item?.url ?? '',
                                                    name: item?.title,
                                                    onDownloadCompleted:
                                                        (path) async {
                                                      final File file =
                                                          File(path);
                                                      vm.showMessageError(
                                                          'Berhasil diunduh $path');
                                                      await vm
                                                          .checkingFileExists(
                                                              item ??
                                                                  Playlist());
                                                      setState(() {});
                                                    },
                                                    onDownloadError:
                                                        (errorMessage) {
                                                      vm.showMessageError(
                                                          errorMessage);
                                                    },
                                                  );
                                                });
                                              },
                                              title: item?.title,
                                              description: item?.description,
                                              fileExists: item?.fileExists,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Expanded(
                                    child: ListView(
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount:
                                              vm.homeData?.playlist?.length ??
                                                  0,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: SDP.sdp(smallPadding),
                                          ),
                                          itemBuilder: (context, index) {
                                            final item =
                                                vm.homeData?.playlist?[index];
                                            return PlaylistMenu(
                                              onTap: () async {
                                                vm.currentPlaylist = item;
                                                if (item?.type == 'video') {
                                                  var videoId =
                                                      vm.getVimeoVideoId(
                                                          item?.url ?? '');
                                                  changeVideo(videoId ?? '');
                                                }
                                                setState(() {});
                                              },
                                              onDelete: () async {
                                                vm.showConfirmDialog(
                                                  item ?? Playlist(),
                                                  title:
                                                      'Apakah anda ingin menghapusnya?',
                                                  positiveLabel: 'Ya',
                                                  negativeLabel: 'Batal',
                                                );
                                                setState(() {});
                                              },
                                              onSave: () {
                                                setState(() {
                                                  FileDownloader.downloadFile(
                                                    url: item?.url ?? '',
                                                    name: item?.title,
                                                    onDownloadCompleted:
                                                        (path) async {
                                                      final File file =
                                                          File(path);
                                                      vm.showMessageError(
                                                          'Berhasil diunduh $path');
                                                      await vm
                                                          .checkingFileExists(
                                                              item ??
                                                                  Playlist());
                                                      setState(() {});
                                                    },
                                                    onDownloadError:
                                                        (errorMessage) {
                                                      vm.showMessageError(
                                                          errorMessage);
                                                    },
                                                  );
                                                });
                                              },
                                              title: item?.title,
                                              description: item?.description,
                                              fileExists: item?.fileExists,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Expanded(
                                    child: ListView(
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount:
                                              vm.homeData?.playlist?.length ??
                                                  0,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: SDP.sdp(smallPadding),
                                          ),
                                          itemBuilder: (context, index) {
                                            final item =
                                                vm.homeData?.playlist?[index];
                                            return PlaylistMenu(
                                              onTap: () async {
                                                vm.currentPlaylist = item;
                                                if (item?.type == 'video') {
                                                  var videoId =
                                                      vm.getVimeoVideoId(
                                                          item?.url ?? '');
                                                  changeVideo(videoId ?? '');
                                                }
                                                setState(() {});
                                              },
                                              onDelete: () async {
                                                vm.showConfirmDialog(
                                                  item ?? Playlist(),
                                                  title:
                                                      'Apakah anda ingin menghapusnya?',
                                                  positiveLabel: 'Ya',
                                                  negativeLabel: 'Batal',
                                                );
                                                setState(() {});
                                              },
                                              onSave: () {
                                                setState(() {
                                                  FileDownloader.downloadFile(
                                                    url: item?.url ?? '',
                                                    name: item?.title,
                                                    onDownloadCompleted:
                                                        (path) async {
                                                      final File file =
                                                          File(path);
                                                      vm.showMessageError(
                                                          'Berhasil diunduh $path');
                                                      await vm
                                                          .checkingFileExists(
                                                              item ??
                                                                  Playlist());
                                                      setState(() {});
                                                    },
                                                    onDownloadError:
                                                        (errorMessage) {
                                                      vm.showMessageError(
                                                          errorMessage);
                                                    },
                                                  );
                                                });
                                              },
                                              title: item?.title,
                                              description: item?.description,
                                              fileExists: item?.fileExists,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
