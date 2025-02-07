import 'package:dental/common/views/about_view.dart';
import 'package:dental/common/views/contact_us_view.dart';
import 'package:dental/common/widgets/forms/group_list.dart';
import 'package:dental/common/widgets/version_info.dart';
import 'package:dental/features/auth/controller/auth_ctrl.dart';
import 'package:dental/features/auth/views/pwd_change_view.dart';
import 'package:dental/features/user/views/profile/profile_edit_view.dart';
import 'package:dental/features/user/views/user_setting/widgets/appearance_dialog.dart';
import 'package:dental/features/user/views/user_setting/widgets/device_check_view.dart';
import 'package:dental/features/user/views/user_setting/widgets/my_location_dialog.dart';
import 'package:dental/localization/string_hardcoded.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:flutter/material.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class UserSettingView extends ConsumerWidget {
  const UserSettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Scaffold(
          appBar: AppBar(title: Text('Setting'.hardcoded), centerTitle: true),
          body: RefreshIndicator(
            onRefresh: () async {},
            child: ListView(
              shrinkWrap: true,
              children: [
                if (ref.watch(authUserProvider) != null) ...[
                  GroupList(
                    showDividerTop: false,
                    showDividerBottom: true,
                    title: ListTile(
                      leading: const Icon(SuperIcons.mg_location_2_fill),
                      title: const Text('Pantau lokasi saya').bold(),
                      onTap: () async => showDialog(
                        context: context,
                        builder: (context) => const MyLocationDialog(),
                      ),
                    ),
                  ),
                  GroupList(
                    showDividerTop: false,
                    showDividerBottom: true,
                    title: ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text('Rubah Data Akun').bold(),
                      onTap: () => context.goto(page: const ProfileEditView()),
                    ),
                  ),
                  GroupList(
                    showDividerTop: false,
                    showDividerBottom: true,
                    title: ListTile(
                      leading: const Icon(Icons.password_outlined),
                      title: const Text('Rubah Kode Sandi').bold(),
                      onTap: () => context.goto(page: const PwdChangeView()),
                    ),
                  ),
                ],
                ListTile(
                  leading: const Icon(SuperIcons.is_sun_fog_outline),
                  title: Text('Tampilan Aplikasi'.hardcoded).bold(),
                  subtitle: Text('Atur tampilan warna di Aplikasi'.hardcoded).tsLabelL(),
                  onTap: () async => await showDialog(
                    context: context,
                    builder: (context) => const AppearanceDialog(),
                  ),
                ),
                ListTile(
                  leading: const Icon(SuperIcons.is_devices_1_bold),
                  title: Text('Device Check'.hardcoded),
                  onTap: () => context.goto(page: const DeviceCheckView()),
                ),
                ListTile(
                  leading: const Icon(SuperIcons.is_user_octagon_outline),
                  title: Text('Hubungi Kami'.hardcoded),
                  onTap: () => context.goto(page: const ContactUsView()),
                ),
                // ListTile(
                //   leading: const Icon(SuperIcons.is_book_outline),
                //   title: Text('Syarat & Ketentuan'.hardcoded),
                //   onTap: () => context.goto(page: const TermConditionView()),
                // ),
                ListTile(
                  leading: const Icon(SuperIcons.is_shield_security_bold),
                  title: Text('Kebijakan Privasi'.hardcoded),
                  onTap: () async => await launchUrl(Uri.parse('https://www.rynest-technology.com/tentang.html')),
                  // onTap: () => context.goto(page: const PrivacyPolicyView()),
                ),
                ListTile(
                  leading: const Icon(SuperIcons.is_information_outline),
                  title: Text('Tentang Rynest'.hardcoded),
                  onTap: () => context.goto(page: const AboutView()),
                ),
                if (ref.watch(authUserProvider) != null) ...[
                  GroupList(
                    title: ListTile(
                      leading: const Icon(Icons.exit_to_app),
                      title: const Text('Keluar Akun').bold(),
                      onTap: () => ref.read(authCtrlProvider).signOut(),
                    ),
                  ),
                ],
                20.height,
                VersionInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
