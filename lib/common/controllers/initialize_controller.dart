import 'dart:developer';

import 'package:dental/common/controllers/network_ctrl.dart';
import 'package:dental/common/controllers/version_ctrl.dart';
import 'package:dental/features/auth/controller/auth_ctrl.dart';
import 'package:dental/features/auth/model/jwt_token.dart';
import 'package:dental/features/notification/controller/notification_ctrl.dart';
import 'package:dental/features/user/controller/profile_ctrl.dart';
import 'package:dental/features/user/controller/user_setting_ctrl.dart';
import 'package:dental/utils/router.dart';
import 'package:dental/common/services/sharedpref_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitializeCtrl {
  final Ref ref;

  InitializeCtrl(this.ref) : _showWalkThrough = ref.read(sharedPrefProvider).getBool('SHOW_WALKTHROUGH') ?? false;

  final bool _showWalkThrough;

  void initializeApps() async {
    // Initialize Network
    ref.read(networkCtrlProvider).initialize();

    // Initialize Location/GPS
    // await ref.read(locationCtrlProvider).initialize();

    // Check User login & token
    ref.read(authCtrlProvider).initialize();

    // Initialize User Settings
    ref.read(userSettingCtrlProvider).initialize();

    // Initialize Profile
    await ref.read(profileCtrlProvider).initialize();

    // Initialize Notifications
    ref.read(notificationCtrlProvider).initialize();

    // Check Is Token Expired
    if (ref.read(authTokenProvider) != null) {
      log("initialize => check token ?", name: "INITIALIZE-CTRL");
      if (ref.read(authTokenProvider)!.hasExpired()) {
        log("initialize => token has expired", name: "INITIALIZE-CTRL");
        await ref.read(authCtrlProvider).signOut(silence: true);
      } else {
        log("initialize => token still valid", name: "INITIALIZE-CTRL");
      }
    } else {
      log("initialize => token is null", name: "INITIALIZE-CTRL");
      await ref.read(authCtrlProvider).signOut(silence: true);
    }

    // Goto Next Route
    if (_showWalkThrough) {
      ref.read(goRouterProvider).go('/walkthrough');
    } else {
      ref.read(goRouterProvider).go('/home');
    }
  }
}

final initCtrlProvider = Provider(InitializeCtrl.new);
