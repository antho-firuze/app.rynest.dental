import 'dart:developer';

import 'package:dental/common/widgets/button/custom_button.dart';
import 'package:dental/common/widgets/forms/field_list.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/controller/product_ctrl.dart';
import 'package:dental/features/product/model/medical_record.dart';
import 'package:dental/features/user/controller/profile_ctrl.dart';
import 'package:dental/utils/datetime_utils.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teeth_selector/teeth_selector.dart';

class MedicalDetailView extends ConsumerWidget {
  const MedicalDetailView(this.item, {super.key});

  final MedicalRecord item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    final a = profile?.dateOfBirth?.difference(DateTime.now());
    final age = (a?.inDays.abs() ?? 0);

    return MyUI(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Medical Detail'),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {},
                child: ListView(
                  children: [
                    // BODY
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        spacing: 10,
                        children: [
                          FieldList(
                            caption: Text('Nama :').bold(),
                            value: Text('${profile?.fullName}').right(),
                          ),
                          FieldList(
                            caption: Text('Jenis Kelamin :').bold(),
                            value: Text('${profile?.gender}').right(),
                          ),
                          FieldList(
                            caption: Text('Tempat, Tgl Lahir :').bold(),
                            value:
                                Text('${profile?.placeOfBirth}, ${profile?.dateOfBirth?.custom('dd-MM-yyyy')}').right(),
                          ),
                          FieldList(
                            caption: Text('Berat Badan :').bold(),
                            value: Text('${profile?.weightKg?.ceil()}kg').right(),
                          ),
                          FieldList(
                            caption: Text('Tinggi Badan :').bold(),
                            value: Text('${profile?.heightCm?.ceil()}cm').right(),
                          ),
                          FieldList(
                            caption: Text('Usia :').bold(),
                            value: Text('${(age / 365).floor()} Tahun').right(),
                          ),
                          FieldList(
                            caption: Text('Treatment :').bold(),
                            value: Text('${item.treatment}').right(),
                          ),
                          FieldList(
                            caption: Text('Date :').bold(),
                            value: Text('${item.date?.custom('d-MMM-yyyy')}').right(),
                          ),
                          FieldList(
                            caption: Text('Location treatment :').bold(),
                            value: Text('${item.location}').right(),
                          ),
                          FieldList(
                            listType: ListType.topBottom,
                            caption: Text('Diagnosa :').bold(),
                            value: Text('${item.diagnosis}'),
                          ),
                        ],
                      ),
                    ),
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            child: const Text('Kanan'),
                            onPressed: () {},
                          ),
                          CustomButton(
                            child: const Text('Kiri'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TeethSelector(
                        multiSelect: true,
                        unselectedColor: primaryLight,
                        selectedColor: oRed,
                        topString: "ATAS",
                        bottomString: "BAWAH",
                        leftString: "",
                        rightString: "",
                        showPrimary: ref.watch(teethPrimaryProvider),
                        showPermanent: !ref.watch(teethPrimaryProvider),
                        textStyle: tsTitleL().bold(),
                        keyTextStyle: ts.bold(),
                        initiallySelected: item.location!.map((e) => "$e").toList(),
                        onChange: (selected) => log(selected.toString()),
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
              //         onPressed: () => context.goto(page: const DoctorView()),
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
