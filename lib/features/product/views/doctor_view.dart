import 'package:dental/common/widgets/button/custom_button.dart';
import 'package:dental/common/widgets/custom_input.dart';
import 'package:dental/common/widgets/custom_rating_star.dart';
import 'package:dental/core/app_asset.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/views/doctor_schedule_view.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class DoctorView extends ConsumerWidget {
  const DoctorView({super.key});

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
                          title: const Text('Pilih Dokter').clr(primaryLight),
                          backgroundColor: Colors.transparent,
                          centerTitle: true,
                        ),
                      ),
                      // BODY
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: CustomInput(
                          prefixIcon: Icon(SuperIcons.lc_search),
                          hintText: "Search by name doctor",
                        ),
                      ),
                      10.height,
                      ListTile(
                        title: const Text('10 Dokter gigi tersedia'),
                        subtitle: const Text('Silahkan pilih dokter yang Anda mau').bold(),
                        trailing: const Icon(SuperIcons.mg_settings_6_line),
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shrinkWrap: true,
                        primary: false,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Card(
                              child: Column(
                                children: [
                                  10.height,
                                  ListTile(
                                    leading: const CircleAvatar(),
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Drg. Nama $index').bold(),
                                        const CustomRatingStar(rating: 4.9, type: 2),
                                      ],
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('10 years exp').tsButton(),
                                        const Text('Ketersediaan :').bold(),
                                      ],
                                    ),
                                    // trailing: const CustomRatingStar(rating: 4.9, type: 2),
                                  ),
                                  10.height,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: CustomButton(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text('Buat Janji Temu'),
                                          10.width,
                                          const Icon(SuperIcons.mg_right_line),
                                        ],
                                      ),
                                      onPressed: () => context.goto(page: const DoctorScheduleView()),
                                    ),
                                  ),
                                  10.height,
                                ],
                              ),
                            ),
                          );
                        },
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
      ),
    );
  }
}
