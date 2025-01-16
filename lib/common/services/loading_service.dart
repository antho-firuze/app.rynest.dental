import 'package:dental/common/views/loading_view.dart';
import 'package:dental/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingService {
  static void show([List<String>? message]) {
    showGeneralDialog(
      context: rootNavigatorKey.currentContext!,
      pageBuilder: (context, animation, secondaryAnimation) => LoadingView(
        messages: message,
      ),
    );
  }

  static void dissmiss() {
    rootNavigatorKey.currentContext!.pop();
  }
}
