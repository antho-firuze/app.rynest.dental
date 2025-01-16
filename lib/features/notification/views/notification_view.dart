import 'package:dental/common/controllers/permission_ctrl.dart';
import 'package:dental/common/exceptions/warning_exeption.dart';
import 'package:dental/common/widgets/button/settings_button.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/notification/views/notification_setting_view.dart';
import 'package:dental/features/notification/views/widgets/empty_notification.dart';
import 'package:dental/features/notification/views/widgets/list_notification.dart';
import 'package:dental/localization/string_hardcoded.dart';
import 'package:dental/utils/theme_utils.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAnyAlertProvider = StateProvider<bool>((ref) => false);

class NotificationView extends ConsumerWidget {
  const NotificationView({super.key});

  static const routeName = '/notification';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(allowAlertProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 20,
            title: Text('Notifikasi'.hardcoded),
          ),
          body: ListView(
            children: [
              WarningException(
                title: 'Saat ini notifikasi belum aktif !',
                child: ElevatedButton(
                  onPressed: () => context.goto(page: const NotificationSettingView()),
                  child: Text('Aktifkan Notifikasi'.hardcoded),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return MyUI(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 20,
          title: Text('Notifikasi'.hardcoded),
          actions: [
            IconButton(
              onPressed: () => ref.read(isAnyAlertProvider.notifier).state = !ref.watch(isAnyAlertProvider),
              icon: Icon(
                Icons.search,
                color: oWhite.whenDark(oWhite),
              ),
            ),
            SettingsButton(onPressed: () => context.goto(page: const NotificationSettingView())),
            // SettingsButton(
            //   onPressed: ref.read(notificationCtrlProvider).goSettingPage,
            // ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: oWhite.whenDark(oWhite),
              ),
            ),
          ],
        ),
        body: ref.watch(isAnyAlertProvider) ? const EmptyNotification() : const ListNotification(),
      ),
    );
  }
}
