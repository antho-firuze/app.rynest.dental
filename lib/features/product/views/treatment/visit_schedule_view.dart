import 'package:age_calculator/age_calculator.dart';
import 'package:dental/common/services/snackbar_service.dart';
import 'package:dental/common/widgets/button/custom_button.dart';
import 'package:dental/common/widgets/custom_combo.dart';
import 'package:dental/common/widgets/custom_datetime.dart';
import 'package:dental/common/widgets/custom_input.dart';
import 'package:dental/common/widgets/custom_upload.dart';
import 'package:dental/common/widgets/forms/group_list.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/controller/treatment_ctrl.dart';
import 'package:dental/features/product/views/doctor/doctor_selection_view.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class VisitScheduleView extends ConsumerWidget {
  const VisitScheduleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = ref.watch(treatmentTypeProvider);
    final ageController = TextEditingController();

    debugPrint('On Build');
    return MyUI(
      connectivityInfoBottomPadding: kToolbarHeight,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: Text('Jadwal Kunjungan'), centerTitle: true),
          bottomNavigationBar: Container(
            height: kToolbarHeight,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              color: oWhite,
              boxShadow: [
                BoxShadow(
                  color: Color(0x23000000),
                  blurRadius: 3.0,
                  offset: Offset(0.0, -1.0),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: CustomButton(
                color: oRed50,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Selanjutnya'),
                    20.width,
                    const Icon(SuperIcons.bx_edit, size: 15, color: oWhite),
                  ],
                ),
                onPressed: () => context.goto(page: const DoctorSelectionView()),
                // onPressed: () => context.popzAll(),
              ),
            ),
          ),
          body: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {},
                child: ListView(
                  children: [
                    // BODY
                    10.height,
                    GroupList(
                      showDividerTop: false,
                      showDividerBottom: true,
                      title: Padding(
                        padding: const EdgeInsets.all(20),
                        child: const Text('DATA DIRI').tsTitleL().bold(),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomInput(
                                hintText: 'Nama',
                              ),
                              10.height,
                              const CustomInput(
                                hintText: 'NIK',
                              ),
                              10.height,
                              CustomCombo(
                                hintText: 'Jenis Kelamin',
                                items: ['Laki-laki', 'Perempuan'],
                              ),
                              // const Text('Jenis Kelamin'),
                              // 10.height,
                              // AnimatedToggleSwitch<bool>.sizeByHeight(
                              //   current: ref.watch(genderProvider),
                              //   values: const [false, true],
                              //   indicatorSize: Size.fromWidth(context.screenWidth / 2),
                              //   iconList: [
                              //     const Text('Laki-Laki').tsBodyS().bold(),
                              //     const Text('Perempuan').tsBodyS().bold(),
                              //   ],
                              //   style: ToggleStyle(
                              //     backgroundColor: oBlue70,
                              //     borderRadius: const BorderRadius.all(Radius.circular(10)),
                              //     indicatorBorderRadius: const BorderRadius.all(Radius.circular(8)),
                              //     borderColor: Colors.transparent,
                              //     indicatorBorder: Border.all(width: 4, color: oBlue70),
                              //   ),
                              //   onChanged: (value) =>
                              //       ref.read(genderProvider.notifier).state = !ref.read(genderProvider),
                              // ),
                              10.height,
                              const CustomInput(
                                hintText: 'Tempat Lahir',
                              ),
                              10.height,
                              Row(
                                spacing: 10,
                                children: [
                                  SizedBox(
                                    width: context.screenWidth / 2 - 20,
                                    child: CustomDateTime(
                                      hintText: 'Tanggal Lahir',
                                      onChanged: (val) {
                                        if (val != null) {
                                          final duration = AgeCalculator.age(val);
                                          final y = duration.years;
                                          final m = duration.months;
                                          // debugPrint(m.toString());
                                          ageController.text = "$y Tahun, $m Bulan";
                                        } else {
                                          ageController.text = "";
                                        }
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomInput(
                                      controller: ageController,
                                      hintText: 'Usia',
                                      enabled: false,
                                    ),
                                  ),
                                ],
                              ),
                              10.height,
                              Row(
                                spacing: 10,
                                children: [
                                  SizedBox(
                                    width: context.screenWidth / 2 - 20,
                                    child: const CustomInput(
                                      hintText: 'Berat (kg)',
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  Expanded(
                                    child: const CustomInput(
                                      hintText: 'Tinggi (cm)',
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                              20.height,
                            ],
                          ),
                        ),
                      ],
                    ),
                    GroupList(
                      showDividerTop: false,
                      showDividerBottom: true,
                      title: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('KEDATANGAN').tsTitleL().bold(),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Treatment').tsButton().bold(),
                              10.height,
                              SizedBox(
                                width: double.infinity,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: oGrey,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(child: Text(type?.name.toUpperCase() ?? '').clr(primaryLight).bold()),
                                ),
                              ),
                              10.height,
                              CustomDateTime(
                                hintText: 'Tanggal',
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(Duration(days: 7)),
                              ),
                              10.height,
                              const CustomCombo(
                                hintText: 'Pilihan Dokter',
                              ),
                              10.height,
                              const CustomInput(
                                hintText: 'Keluhan Sakit',
                                maxLines: 5,
                              ),
                              10.height,
                              CustomCombo(
                                hintText: 'Asuransi / Non-Asuransi',
                                items: ['Asuransi', 'Non-Asuransi'],
                              ),
                              10.height,
                              const CustomInput(
                                hintText: 'Input Nomor Kartu Asuransi',
                              ),
                              10.height,
                              CustomUpload(
                                hintText: 'Upload Gambar Kartu Asuransi :',
                                desc: 'Drag & Drop Files here or Choose file Gambar Kartu Asuransi',
                                onTap: () => SnackBarService.show(message: 'Upload Gambar Kartu Asuransi'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    80.height,
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
