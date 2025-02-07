import 'package:dental/common/exceptions/data_failed.dart';
import 'package:dental/common/widgets/forms/group_list.dart';
import 'package:dental/common/widgets/skelton.dart';
import 'package:dental/features/user/controller/medical_record_ctrl.dart';
import 'package:dental/features/user/controller/profile_ctrl.dart';
import 'package:dental/features/user/views/medical_record/medical_detail_view.dart';
import 'package:dental/features/user/views/ticket_layout.dart';
import 'package:dental/features/user/views/widgets/medical_list_layout.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryView extends ConsumerWidget {
  const HistoryView({super.key});

  static const routeName = '/history';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    return MyUI(
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: const Text('History'), titleSpacing: 30),
          body: RefreshIndicator(
            onRefresh: () async {},
            child: ListView(
              children: [
                // TITLE
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text('Hi, ${profile?.fullName}').tsTitleM().bold(),
                      Text('Halaman ini berisi riwayat kedatangan anda dan jadwal kedatangan anda berikutnya.')
                    ],
                  ),
                ),
                30.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GroupList(
                    showDividerTop: false,
                    showDividerCenter: true,
                    title: Text('Antrian kedatangan saat ini '),
                    children: [
                      TicketLayout(),
                      10.height,
                    ],
                  ),
                ),
                50.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GroupList(
                    showDividerTop: false,
                    showDividerCenter: true,
                    title: Text('Riwayat kedatangan '),
                    children: [
                      ref.watch(fetchMedicalRecordsProvider).when(
                            skipLoadingOnRefresh: false,
                            data: (data) {
                              if (data == null || data.isEmpty) {
                                return DataFailed();
                              }

                              return ListView.separated(
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (context, index) {
                                  final item = data[index];
                                  return MedicalListLayout(
                                    item: item,
                                    dark: true,
                                    onTap: () async => await context.goto(page: MedicalDetailView(item)),
                                  );
                                },
                                separatorBuilder: (context, index) => 5.height,
                                itemCount: data.length,
                              );
                            },
                            error: (error, stackTrace) {
                              debugPrint(error.toString());
                              return Container();
                            },
                            loading: () => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                spacing: 10,
                                children: List.generate(3, (index) => Skelton(radius: 8, height: 60)),
                              ),
                            ),
                          ),
                      10.height,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
