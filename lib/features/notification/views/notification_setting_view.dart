import 'package:dental/common/controllers/permission_ctrl.dart';
import 'package:dental/features/notification/controller/notification_ctrl.dart';
import 'package:dental/localization/string_hardcoded.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationSettingView extends ConsumerWidget {
  const NotificationSettingView({
    super.key,
  });

  static const routeName = '/setting_notification';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: Text('Setting Notifikasi'.hardcoded)),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            children: [
              ListTile(
                title: const Text('Aktifkan Notifikasi').bold(),
                trailing: Switch(
                  value: ref.watch(allowAlertProvider),
                  onChanged: (_) => ref.read(notificationCtrlProvider).allowAlertToggle(),
                ),
              ),
              ListTile(
                title: const Text('Notifikasi pesan baru').bold(),
                trailing: Switch(
                  value: ref.watch(alertNewMessageProvider),
                  onChanged:
                      ref.watch(allowAlertProvider) ? (_) => ref.read(notificationCtrlProvider).alertNewMessage : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
