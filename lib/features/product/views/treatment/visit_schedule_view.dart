import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dental/common/widgets/button/custom_button.dart';
import 'package:dental/common/widgets/custom_avatar.dart';
import 'package:dental/common/widgets/custom_input.dart';
import 'package:dental/common/widgets/forms/group_list.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/controller/product_ctrl.dart';
import 'package:dental/features/product/model/doctor.dart';
import 'package:dental/features/product/views/widgets/time_selector.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';
import 'package:table_calendar/table_calendar.dart';

class VisitScheduleView extends ConsumerWidget {
  const VisitScheduleView(this.item, {super.key});

  final Doctor item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      connectivityInfoBottomPadding: kToolbarHeight,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: Text('Jadwal Kunjungan'), centerTitle: true),
          bottomNavigationBar: Container(
            height: kToolbarHeight,
            color: oBlue70,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: CustomButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Simpan'),
                    20.width,
                    const Icon(SuperIcons.bx_edit, size: 15, color: oWhite),
                  ],
                ),
                onPressed: () => context.popzAll(),
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
                    Column(
                      children: [
                        CustomAvatar(image: item.photo, size: 60),
                        10.height,
                        Text('${item.name}').tsTitleL(),
                        Text('${item.countExperience} years exp').tsButton(),
                      ],
                    ),
                    10.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        color: oWhite,
                        child: Column(
                          children: [
                            TableCalendar(
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2030, 3, 14),
                              focusedDay: DateTime.now(),
                              calendarFormat: CalendarFormat.week,
                            ),
                            10.height,
                            divider(),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TimeSelector(
                                practiceHour: [0, 5],
                                // selected: 5,
                                // onTap: (index) => DialogService(content: Text('Index ke $index terpilih !')).showInfo(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        color: oWhite,
                        child: GroupList(
                          showDividerTop: false,
                          showDividerBottom: true,
                          title: Padding(
                            padding: const EdgeInsets.all(20),
                            child: const Text('Data Pribadi').tsTitleL(),
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
                                  const Text('Jenis Kelamin'),
                                  10.height,
                                  AnimatedToggleSwitch<bool>.sizeByHeight(
                                    current: ref.watch(genderProvider),
                                    values: const [false, true],
                                    indicatorSize: Size.fromWidth(context.screenWidth / 2),
                                    iconList: [
                                      const Text('Laki-Laki').tsBodyS().bold(),
                                      const Text('Perempuan').tsBodyS().bold(),
                                    ],
                                    style: ToggleStyle(
                                      backgroundColor: oBlue70,
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      indicatorBorderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderColor: Colors.transparent,
                                      indicatorBorder: Border.all(width: 4, color: oBlue70),
                                    ),
                                    onChanged: (value) =>
                                        ref.read(genderProvider.notifier).state = !ref.read(genderProvider),
                                  ),
                                  10.height,
                                  const CustomInput(
                                    hintText: 'Telephone',
                                  ),
                                  10.height,
                                  const CustomInput(
                                    hintText: 'Email',
                                  ),
                                  20.height,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
