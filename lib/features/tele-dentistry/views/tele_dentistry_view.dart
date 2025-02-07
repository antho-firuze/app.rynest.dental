import 'package:dental/common/widgets/button/custom_button.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/tele-dentistry/views/chat_view.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class TeleDentistryView extends ConsumerWidget {
  const TeleDentistryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      connectivityInfoBottomPadding: kToolbarHeight,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: Text('Tele-Dentistry'), centerTitle: true),
          bottomNavigationBar: Container(
            height: kToolbarHeight,
            color: oBlue70,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: CustomButton(
                // flat: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Mulai Tele-Dentistry'),
                    20.width,
                    const Icon(SuperIcons.bx_edit),
                  ],
                ),
                onPressed: () => context.goto(page: const ChatView()),
              ),
            ),
          ),
          body: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {},
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                              'Ini adalah layanan perawatan gigi yang menggunakan teknologi komunikasi jarak jauh untuk memberikan konsultasi, diagnosis, perencanaan perawatan, dan edukasi kepada pasien tanpa perlu kunjungan fisik ke klinik.')
                          .tsBodyL()
                          .justify(),
                    ),
                    10.height,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
