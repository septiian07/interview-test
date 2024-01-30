import 'package:flutter/material.dart';
import 'package:interview_task/src/constant/navigator_key.dart';
import 'package:intl/intl.dart';

class FormatDate {
  String formatDate(date, {format = 'EEE, dd MMM yyyy', context}) {
    return DateFormat(format).format(
      DateTime.parse(date).toLocal(),
    );
  }

  String formatTime(date, context) {
    return DateFormat.jm(
            Localizations.localeOf(context ?? navigatorKey.currentContext)
                .languageCode)
        .format(
      DateTime.parse(date).toLocal(),
    );
  }
}
