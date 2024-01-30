import 'package:flutter/material.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/ui/shared/images.dart';
import 'package:stacked/stacked.dart';

import 'splash_screen_viewmodel.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<SplashScreenViewModel>.nonReactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: SDP.sdp(144),
                height: SDP.sdp(144),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(logo),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      viewModelBuilder: () => SplashScreenViewModel(),
    );
  }
}
