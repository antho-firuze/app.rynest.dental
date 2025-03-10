import 'package:age_calculator/age_calculator.dart';
import 'package:dental/common/widgets/forms/field_list.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/controller/treatment_ctrl.dart';
import 'package:dental/features/user/controller/profile_ctrl.dart';
import 'package:dental/utils/datetime_utils.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TicketView extends ConsumerWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final dateOfBirth = profile?.dateOfBirth ?? DateTime.now();
    final age = AgeCalculator.age(dateOfBirth);

    return MyUI(
      connectivityInfoBottomPadding: kToolbarHeight,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(),
          body: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {},
                child: ListView(
                  children: [
                    // BODY
                    20.height,
                    Column(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Nomor Antrian').tsTitleL().bold().family('Roboto').space(1.5),
                        Transform.scale(
                          scaleY: 1.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A-').tsHeadlineDL().bold().family('Roboto'),
                              Text('001').tsHeadlineDL().bold().family('Roboto').clr(oRed),
                            ],
                          ),
                        ),
                      ],
                    ),
                    40.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            value: Text('${age.years} Tahun, ${age.months} Bulan').right(),
                          ),
                          FieldList(
                            caption: Text('Treatment :').bold(),
                            value: Text('${ref.read(treatmentTypeProvider)?.name}').right(),
                          ),
                          FieldList(
                            caption: Text('Date :').bold(),
                            value: Text(DateTime.now().custom('d-MMM-yyyy')).right(),
                          ),
                          FieldList(
                            caption: Text('Time :').bold(),
                            value: Text("${DateTime.now().custom('HH:mm')} Siang").right(),
                          ),
                          FieldList(
                            caption: Text('Dokter :').bold(),
                            value: Text(ref.read(doctorNameProvider)).right(),
                          ),
                          FieldList(
                            caption: Text('Location treatment :').bold(),
                            value: Text('Bottom All').right(),
                          ),
                          FieldList(
                            listType: ListType.topBottom,
                            caption: Text('Keluhan :').bold(),
                            value: Text(''),
                          ),
                        ],
                      ),
                    ),
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
