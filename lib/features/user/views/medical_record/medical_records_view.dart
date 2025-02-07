import 'package:dental/common/exceptions/data_failed.dart';
import 'package:dental/common/widgets/custom_rich_text.dart';
import 'package:dental/common/widgets/skelton.dart';
import 'package:dental/features/user/controller/medical_record_ctrl.dart';
import 'package:dental/features/user/views/medical_record/medical_detail_view.dart';
import 'package:dental/features/user/views/widgets/medical_list_layout.dart';
import 'package:dental/localization/string_hardcoded.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MedicalRecordsView extends ConsumerWidget {
  const MedicalRecordsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: Text('Medical Records'), centerTitle: true),
          body: RefreshIndicator(
            onRefresh: () async => ref.refresh(fetchMedicalRecordsProvider),
            child: ListView(
              // shrinkWrap: true,
              children: [
                // TITLE
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, Alexis Anderson".hardcoded).tsTitleL(),
                      10.height,
                      CustomRichText(
                        text: TextSpan(
                          text: 'Ini adalah '.hardcoded,
                          style: tsBodyM(),
                          children: [
                            TextSpan(
                              text: 'Medical Record ',
                              style: tsBodyL().bold(),
                            ),
                            TextSpan(
                              text: 'terakhir anda :',
                              style: tsBodyL(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                20.height,
                // BODY
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
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: MedicalListLayout(
                                item: item,
                                onTap: () async => await context.goto(page: MedicalDetailView(item)),
                              ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
