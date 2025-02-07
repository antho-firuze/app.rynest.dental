import 'package:dental/core/app_color.dart';
import 'package:dental/localization/string_hardcoded.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:dental/common/widgets/one_ui/one_ui_nested_scroll_view.dart';
import 'package:dental/utils/ui_helper.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return MyUI(
      enabledSafeArea: false,
      child: Scaffold(
        body: OneUINestedScrollView(
          foregroundColor: oWhite,
          collapsedWidget: Text('Penasaran dengan Rynest?'.hardcoded).tsTitleL().ellipsis().clr(oWhite).maxLn(1),
          background: Container(
            decoration: const BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(image: AssetImage('assets/images/im-about_team.png'), fit: BoxFit.cover),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.search),
            // ),
          ],
          sliverList: SliverList.list(
            children: [
              20.height,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Profil Rynest Technology'.hardcoded).tsHeadlineL().bold(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Solusi Masalah Teknologi Anda'),
              ),
              30.height,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: const Text(
                        "PT. Rynest Technology Indomedia merupakan perusahaan yang bergerak di bidang Teknologi Informasi dengan karakteristik jasa layanan yang inovatif, kreatif, dan modern. RTI di dirikan sejak tahun 2009 sekaligus bernanung dalam unit usaha The Rynest Companies Group (RCG).")
                    .justify(),
              ),
              20.height,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: const Text(
                        "Dengan dukungan sumber daya manusia yang kompeten dan profesional serta berpengalaman sehingga kualitas produk dan layanan yang diberikan RTI selalu dapat memenuhi kebutuhan para pelanggannya khususnya untuk layanan teknologi informasi dibidang asuransi, dana pensiun, dan keuangan.")
                    .justify(),
              ),

              // VISI & MISI
              30.height,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('VISI dan MISI'.hardcoded).tsHeadlineL().bold(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Impian dan Cita-cita yang dimiliki Rynest'),
              ),
              30.height,
              Center(child: SizedBox(height: 70, child: Image.asset('assets/icons/ic-vision.png'))),
              10.height,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: const Text(
                        'Menjadi perusahaan IT Konsultan dan jasa yang terkemuka baik di insdustri asuransi dan non asuransi, dana pensiun, layanan kesehatan, financial dan training di masa depan.')
                    .justify(),
              ),
              30.height,
              Center(child: SizedBox(height: 70, child: Image.asset('assets/icons/ic-mission.png'))),
              10.height,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: const Text(
                        'Memberikan fasilitas pelayanan yang prima secara efektif dan efisien dalam teknologi informasi saat ini, sesuai dengan kebutuhan klien.')
                    .justify(),
              ),
              30.height,
            ],
          ),
        ),
      ),
    );
  }
}
