import 'package:dental/localization/string_hardcoded.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: const Text('Hubungi Kami'), centerTitle: true),
          body: RefreshIndicator(
            onRefresh: () async {},
            child: ListView(
              children: [
                20.height,
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text('PT. Rynest Technology Indomedia'.hardcoded).tsHeadlineS().bold(),
                ),
                10.height,
                ListTile(
                  title: Text('Alamat'.hardcoded),
                  subtitle: Text(
                          'Jl. Tole Iskandar No. 11, Sukmajaya, Kec. Sukmajaya, Kota Depok, Jawa Barat 16412'.hardcoded)
                      .tsBodyM()
                      .bold(),
                  trailing: const Icon(SuperIcons.is_map_outline),
                  onTap: () => launchUrl(
                    mode: LaunchMode.externalApplication,
                    Uri.parse(
                        'https://www.google.com/maps/search/?api=1&query=-6.405185377767814%2C106.84855663558108&query_place_id=ChIJa-ovOxPraS4RtNCyb6GneFA'),
                  ),
                ),
                30.height,
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 24),
                  child: Stack(
                    children: [
                      Text('Customer Care'.hardcoded).tsHeadlineS().bold(),
                      Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                              onTap: () => showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                                    ),
                                    builder: (context) {
                                      return MyUI(
                                        isTransparent: true,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Stack(
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: CloseButton(onPressed: () => context.pop()),
                                                ),
                                                // const Align(
                                                //   alignment: Alignment.center,
                                                //   child: Padding(
                                                //     padding: EdgeInsets.fromLTRB(10, 12, 10, 0),
                                                //     child: Text('Note'),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                            10.height,
                                            const Padding(
                                              padding: EdgeInsets.only(left: 16),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Note: '),
                                                  Text('- Online setiap hari (08:00 - 20:00)'),
                                                  Text('- Senin - Jumat (08:00 - 18:00)'),
                                                ],
                                              ),
                                            ),
                                            20.height,
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                              child: const Icon(Icons.info))),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(SuperIcons.ev_phone_call),
                  title: Text('Phone #1'.hardcoded),
                  subtitle: Text('021-77821237'.hardcoded).tsBodyM().bold(),
                  // trailing: GestureDetector(
                  //     onTap: () => Uri.parse(
                  //         'https://wa.me/+6282311340044/?text=${Uri.encodeComponent("Assalamu'alaikum Amoora,")}'),
                  //     child: const Icon(SuperIcons.is_whatsapp_outline)),
                  onTap: () => launchUrl(Uri.parse('tel:+622177821237')),
                ),
                ListTile(
                  leading: const Icon(SuperIcons.ev_phone_call),
                  title: Text('Phone #2'.hardcoded),
                  subtitle: Text('021-77822574'.hardcoded).tsBodyM().bold(),
                  // trailing: GestureDetector(
                  //     onTap: () => Uri.parse(
                  //         'https://wa.me/+6282311340011/?text=${Uri.encodeComponent("Assalamu'alaikum Amoora,")}'),
                  //     child: const Icon(SuperIcons.is_whatsapp_outline)),
                  onTap: () => launchUrl(Uri.parse('tel:+622177822574')),
                ),
                ListTile(
                  leading: const Icon(SuperIcons.bs_envelope_open),
                  title: Text('Email'.hardcoded),
                  subtitle: Text('support@rynest-technology.com'.hardcoded).tsBodyM().bold(),
                  onTap: () => launchUrl(Uri.parse('mailto:customerservice@dental.id')),
                ),
                30.height,
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text('Follow Akun Sosial Media Kami'.hardcoded).tsHeadlineS().bold(),
                ),
                10.height,
                ListTile(
                  leading: const Icon(SuperIcons.is_instagram_outline),
                  title: Text('Instagram'.hardcoded).bold(),
                  onTap: () => launchUrl(Uri.parse('https://www.instagram.com/amoora_official/')),
                ),
                ListTile(
                  leading: const Icon(SuperIcons.mg_tiktok_fill),
                  title: Text('Tik Tok'.hardcoded).bold(),
                  onTap: () => launchUrl(Uri.parse('https://www.tiktok.com/@amooraofficial')),
                ),
                ListTile(
                  leading: const Icon(SuperIcons.mg_facebook_fill),
                  title: Text('Facebook'.hardcoded).bold(),
                  onTap: () => launchUrl(Uri.parse('https://www.facebook.com/@amooraidofficial')),
                ),
                ListTile(
                  leading: const Icon(SuperIcons.mg_twitter_fill),
                  title: Text('X (Twitter)'.hardcoded).bold(),
                  onTap: () => launchUrl(Uri.parse('https://www.twitter.com/@amooraofficial')),
                ),
                30.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
