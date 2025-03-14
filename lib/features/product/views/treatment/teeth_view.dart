import 'dart:developer';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dental/common/widgets/button/custom_button.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/controller/product_ctrl.dart';
import 'package:dental/features/product/controller/treatment_ctrl.dart';
import 'package:dental/features/product/views/treatment/visit_schedule_view.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';
import 'package:teeth_selector/teeth_selector.dart';

class TeethView extends ConsumerWidget {
  const TeethView(this.type, {super.key});

  final TreatmentType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(Duration.zero).then((_) {
      ref.read(treatmentTypeProvider.notifier).state = type;
    });

    return MyUI(
      connectivityInfoBottomPadding: kToolbarHeight,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: Text(type.name), centerTitle: true),
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
                    const Icon(SuperIcons.bx_edit),
                  ],
                ),
                onPressed: () => context.goto(page: const VisitScheduleView()),
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
                    const Text('Jenis Gigi :').tsBodyL().center(),
                    10.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AnimatedToggleSwitch<bool>.sizeByHeight(
                        current: ref.watch(teethPrimaryProvider),
                        values: const [false, true],
                        indicatorSize: Size.fromWidth(context.screenWidth / 2),
                        iconList: [
                          const Text('Dewasa').tsBodyS().bold(),
                          const Text('Anak').tsBodyS().bold(),
                        ],
                        style: ToggleStyle(
                          backgroundColor: oBlue70,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          indicatorBorderRadius: const BorderRadius.all(Radius.circular(8)),
                          borderColor: Colors.transparent,
                          indicatorBorder: Border.all(
                            width: 4,
                            color: oBlue70,
                          ),
                        ),
                        onChanged: (value) =>
                            ref.read(teethPrimaryProvider.notifier).state = !ref.read(teethPrimaryProvider),
                      ),
                    ),
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Kanan').bold(),
                          Text('Kiri').bold(),
                        ],
                      ),
                    ),
                    40.height,
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
                        onChange: (selected) => log(selected.toString()),
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
