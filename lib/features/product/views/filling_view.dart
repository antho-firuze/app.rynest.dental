import 'dart:developer';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dental/common/widgets/button/custom_button.dart';
import 'package:dental/core/app_asset.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/controller/product_ctrl.dart';
import 'package:dental/features/product/views/doctor_view.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';
import 'package:teeth_selector/teeth_selector.dart';

class FillingView extends ConsumerWidget {
  const FillingView({super.key});

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
                // APPBAR
                // SizedBox(
                //   height: kToolbarHeight,
                //   child: AppBar(
                //     leading: const BackButton(
                //       color: primaryLight,
                //     ),
                //     title: const Text('Filling').clr(primaryLight),
                //     backgroundColor: Colors.transparent,
                //     centerTitle: true,
                //   ),
                // ),
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
                          title: const Text('Filling').clr(primaryLight),
                          backgroundColor: Colors.transparent,
                          centerTitle: true,
                        ),
                      ),
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
                          onChange: (selected) => log(selected.toString()),
                        ),
                      ),
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
                            const Text('Selanjutnya'),
                            20.width,
                            const Icon(SuperIcons.bx_edit, size: 15),
                          ],
                        ),
                        onPressed: () => context.goto(page: const DoctorView()),
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
