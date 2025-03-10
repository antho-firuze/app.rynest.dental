import 'package:dental/common/exceptions/data_exeception_layout.dart';
import 'package:dental/common/widgets/custom_input.dart';
import 'package:dental/common/widgets/skelton.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/controller/doctor_ctrl.dart';
import 'package:dental/features/product/controller/treatment_ctrl.dart';
import 'package:dental/features/product/views/widgets/select_doctor_layout.dart';
import 'package:dental/features/product/views/treatment/ticket_view.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class DoctorSelectionView extends ConsumerWidget {
  const DoctorSelectionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: Text('Pilih Dokter'), centerTitle: true),
          body: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {},
                child: ListView(
                  children: [
                    // TITLE
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomInput(
                        prefixIcon: Icon(SuperIcons.lc_search),
                        hintText: "Search by name doctor",
                        backgroundColor: oBlue70,
                        borderRadius: 24,
                        borderSide: BorderSide.none,
                        autoLabel: false,
                      ),
                    ),
                    10.height,
                    ListTile(
                      title: const Text('10 Dokter gigi tersedia'),
                      subtitle: const Text('Silahkan pilih dokter yang Anda mau').bold(),
                      trailing: const Icon(SuperIcons.mg_settings_6_line),
                    ),
                    // BODY
                    ref.watch(fetchDoctorProvider).when(
                          skipLoadingOnRefresh: false,
                          data: (data) {
                            if (data == null || data.isEmpty) {
                              return DataExceptionLayout(type: ExeceptionType.dataEmpty);
                            }

                            final items = data;

                            return ListView.separated(
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (context, index) {
                                final item = items[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: SelectDoctorLayout(
                                    item: item,
                                    onSelected: () {
                                      ref.read(doctorNameProvider.notifier).state = item.name!;
                                      return context.goto(page: TicketView());
                                    },
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => 5.height,
                              itemCount: items.length,
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
                    60.height,
                  ],
                ),
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: BottomAppBar(
              //     height: kToolbarHeight,
              //     color: oBlue70,
              //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              //     child: SizedBox(
              //       width: double.infinity,
              //       child: CustomButton(
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             const Text('Selanjutnya'),
              //             20.width,
              //             const Icon(SuperIcons.bx_edit, size: 15),
              //           ],
              //         ),
              //         onPressed: () {},
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
