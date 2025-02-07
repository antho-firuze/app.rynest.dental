import 'package:dental/common/widgets/custom_rich_text.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/features/product/views/treatment/filling_view.dart';
import 'package:dental/localization/string_hardcoded.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class TreatmentView extends StatelessWidget {
  const TreatmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(),
          body: RefreshIndicator(
            onRefresh: () async {},
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
                          text: 'Silahkan Pilih '.hardcoded,
                          style: tsBodyM(),
                          children: [
                            TextSpan(
                              text: 'Treatment :',
                              style: tsBodyL().bold(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                20.height,
                // BODY
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          leading: Image.asset('assets/icons/dental/ic-treatment.png', width: 35),
                          title: const Text('Bleaching').bold(),
                          subtitle: const Text('Untuk memutihkan gigi'),
                          trailing: const Icon(SuperIcons.mg_right_line),
                          onTap: () async => await context.goto(page: const FillingView()),
                        ),
                      ),
                      5.height,
                      Card(
                        child: ListTile(
                          leading: Image.asset('assets/icons/dental/ic-scaling.png', width: 35),
                          title: const Text('Scaling').bold(),
                          subtitle: const Text('Untuk pembersihan plak dan karang'),
                          trailing: const Icon(SuperIcons.mg_right_line),
                          onTap: () async => await context.goto(page: const FillingView()),
                        ),
                      ),
                      5.height,
                      Card(
                        child: ListTile(
                          leading: Image.asset('assets/icons/dental/ic-veneer.png', width: 35),
                          title: const Text('Veneer').bold(),
                          subtitle: const Text('Cangkang tipis permukaan depan gigi'),
                          trailing: const Icon(SuperIcons.mg_right_line),
                          onTap: () async => await context.goto(page: const FillingView()),
                        ),
                      ),
                      5.height,
                      Card(
                        child: ListTile(
                          leading: Image.asset('assets/icons/dental/ic-filling.png', width: 35),
                          title: const Text('Filling').bold(),
                          subtitle: const Text('Untuk menambal gigi yang berlubang'),
                          trailing: const Icon(SuperIcons.mg_right_line),
                          onTap: () async => await context.goto(page: const FillingView()),
                        ),
                      ),
                      5.height,
                      Card(
                        child: ListTile(
                          leading: Image.asset('assets/icons/dental/ic-root_canal.png', width: 35),
                          title: const Text('Root Canal Treatment').bold(),
                          subtitle: const Text('Untuk kerusakan gigi yang sudah mengenai saraf'),
                          trailing: const Icon(SuperIcons.mg_right_line),
                          onTap: () async => await context.goto(page: const FillingView()),
                        ),
                      ),
                      5.height,
                      Card(
                        child: ListTile(
                          leading: Image.asset('assets/icons/dental/ic-kawat_gigi.png', width: 35),
                          title: const Text('Kawat Gigi').bold(),
                          subtitle: const Text('Untuk merapikan bentuk gigi tidak rata'),
                          trailing: const Icon(SuperIcons.mg_right_line),
                          onTap: () async => await context.goto(page: const FillingView()),
                        ),
                      ),
                      5.height,
                      Card(
                        child: ListTile(
                          leading: Image.asset('assets/icons/dental/ic-treatment.png', width: 35),
                          title: const Text('Dental Crown dan Bridges').bold(),
                          subtitle: const Text('Implan pada gigi & masalah gigi berjarak'),
                          trailing: const Icon(SuperIcons.mg_right_line),
                          onTap: () async => await context.goto(page: const FillingView()),
                        ),
                      ),
                      5.height,
                      Card(
                        child: ListTile(
                          leading: Image.asset('assets/icons/dental/ic-treatment.png', width: 35),
                          title: const Text('Dental Jewelry').bold(),
                          subtitle:
                              const Text('Untuk menghias gigi dengan aplikasi kristal atau berlian di permukaan gigi'),
                          trailing: const Icon(SuperIcons.mg_right_line),
                          onTap: () async => await context.goto(page: const FillingView()),
                        ),
                      ),
                    ],
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
