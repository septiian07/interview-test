import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_task/src/app/app.router.dart';
import 'package:interview_task/src/ui/shared/theme.dart';
import 'package:stacked_services/stacked_services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interview Test',
      theme: ThemeConfig().defaultConfig,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
