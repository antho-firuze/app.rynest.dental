
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dental/common/widgets/button/custom_button.dart';
import 'package:dental/common/widgets/custom_avatar.dart';
import 'package:dental/common/widgets/custom_input.dart';
import 'package:dental/common/widgets/forms/group_list.dart';
import 'package:dental/core/app_asset.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/controller/product_ctrl.dart';
import 'package:dental/features/product/views/widgets/time_selector.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';
import 'package:table_calendar/table_calendar.dart';

class DoctorScheduleView extends ConsumerWidget {
  const DoctorScheduleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(AppAsset.imPattern),
                repeat: ImageRepeat.repeat,
                opacity: .2,
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Stack(
              children: [
                RefreshIndicator(
                  onRefresh: () async {},
                  child: ListView(
                    children: [
                      // APPBAR
                      SizedBox(
                        height: kToolbarHeight,
                        child: AppBar(
                          leading: const BackButton(
                            color: primaryLight,
                          ),
                          title: const Text('Jadwal Kunjungan').clr(primaryLight),
                          backgroundColor: Colors.transparent,
                          centerTitle: true,
                        ),
                      ),
                      // BODY
                      Column(
                        children: [
                          const CustomAvatar(),
                          10.height,
                          const Text('Drg. Icha Kimberly').tsTitleL(),
                          const Text('10 years exp').tsButton(),
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
                              TimeSelector(
                                practiceHour: ref.read(productCtrlProvider).practiceHour,
                                selected: ref.watch(selectedScheduleProvider),
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
                            header: Padding(
                              padding: const EdgeInsets.all(20),
                              child: const Text('Data Pribadi').tsTitleL(),
                            ),
                            children: [
                              20.height,
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
                      60.height,
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomAppBar(
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
                            const Icon(SuperIcons.bx_edit, size: 15),
                          ],
                        ),
                        onPressed: () => context.popzAll(),
                      ),
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
