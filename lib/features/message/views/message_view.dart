import 'package:dental/core/app_color.dart';
import 'package:dental/features/auth/controller/auth_ctrl.dart';
import 'package:dental/features/auth/views/signin_view.dart';
import 'package:dental/features/message/service/message_service.dart';
import 'package:dental/features/message/views/widgets/empty_message.dart';
import 'package:dental/features/message/views/widgets/list_message.dart';
import 'package:dental/localization/string_hardcoded.dart';
import 'package:dental/utils/theme_utils.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageView extends ConsumerWidget {
  const MessageView({super.key});

  static const routeName = '/message';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(authUserProvider) == null) {
      return const SignInView(isEmbed: true);
    }
    return MyUI(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 20,
          title: Text('Pesan'.hardcoded),
          actions: [
            IconButton(
              onPressed: () => ref.read(isAnyChatProvider.notifier).state = !ref.watch(isAnyChatProvider),
              icon: Icon(
                Icons.search,
                color: oWhite.whenDark(oWhite),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: oWhite.whenDark(oWhite),
              ),
            ),
          ],
        ),
        body: ref.watch(isAnyChatProvider) ? const EmptyMessage() : const ListMessage(),
      ),
    );
  }
}
