import 'package:dental/common/widgets/custom_avatar.dart';
import 'package:dental/common/widgets/custom_icon.dart';
import 'package:dental/common/widgets/custom_input.dart';
import 'package:dental/common/widgets/skelton.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/tele-dentistry/controller/tele_dentistry_ctrl.dart';
import 'package:dental/features/tele-dentistry/model/chat.dart';
import 'package:dental/features/tele-dentistry/views/widgets/chat_layout.dart';
import 'package:dental/features/user/controller/profile_ctrl.dart';
import 'package:dental/utils/datetime_utils.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class ChatView extends ConsumerWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    return MyUI(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomAvatar(image: profile?.photo),
                      CustomAvatar(
                        image: 'assets/icons/app-icon.png',
                        ratio: .75,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: kToolbarHeight,
            color: oBlue70,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: CustomInput(
                      autoLabel: false,
                      hintText: 'Silahkan ketik disini',
                      suffixIcon: Icon(SuperIcons.bs_chat_right),
                    ),
                  ),
                  CustomIcon(
                    SuperIcons.bs_camera,
                    foregroundColor: oWhite,
                    backgroundColor: oGreen,
                    shape: BoxShape.rectangle,
                    size: 37,
                    iconRatio: .60,
                    borderRadius: 10,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () async => ref.refresh(fetchChatMessageProvider),
            child: Scrollbar(
              child: ListView(
                children: [
                  ref.watch(fetchChatMessageProvider).when(
                        skipLoadingOnRefresh: false,
                        data: (data) {
                          if (data == null || data.isEmpty) {
                            return Text('Silahkan anda mulai chat di bawah !');
                          }

                          return ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              bool isSameDate = true;
                              final item = data[index];
                              final date = DateTime(item.time!.year, item.time!.month, item.time!.day, item.time!.hour);
                              if (index == 0) {
                                isSameDate = false;
                              } else {
                                final prevItem = data[index - 1].time;
                                final prevDate = DateTime(prevItem!.year, prevItem.month, prevItem.day, prevItem.hour);
                                isSameDate = date.isAtSameMomentAs(prevDate);
                              }

                              if (index == 0 && !isSameDate) {
                                return Column(
                                  spacing: 20,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(child: Text('${item.time?.custom('dd MMM yyyy - HH:mm')}').bold()),
                                    ChatLayout(item: item),
                                  ],
                                );
                              } else if (!isSameDate) {
                                return Column(
                                  spacing: 20,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text('${item.time?.custom('HH:mm')}').bold(),
                                      ),
                                    ),
                                    ChatLayout(item: item),
                                  ],
                                );
                              } else {
                                return ChatLayout(item: item);
                              }
                            },
                            separatorBuilder: (context, index) => 10.height,
                            itemCount: data.length,
                          );
                        },
                        error: (error, stackTrace) => Container(),
                        loading: () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            spacing: 15,
                            children: List.generate(5, (index) => Skelton(height: (index + 1) * 20)),
                          ),
                        ),
                      ),
                  10.height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
