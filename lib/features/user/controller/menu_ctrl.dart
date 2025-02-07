import 'package:dental/features/auth/controller/auth_ctrl.dart';
import 'package:dental/features/product/views/doctor/doctor_list_view.dart';
import 'package:dental/features/product/views/facility_view.dart';
import 'package:dental/features/product/views/nurse/nurse_list_view.dart';
import 'package:dental/features/user/views/history_view.dart';
import 'package:dental/features/user/views/medical_record/medical_records_view.dart';
import 'package:dental/features/product/views/treatment/treatment_view.dart';
import 'package:dental/core/app_asset.dart';
import 'package:dental/features/tele-dentistry/views/tele_dentistry_view.dart';
import 'package:dental/features/user/views/user_setting/user_setting_view.dart';
import 'package:dental/utils/page_utils.dart';
import 'package:dental/utils/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppMenu {
  menu0('00', 'Treatment', '', 'ic-treatment.png'),
  // menu1('01', 'Appointment', '', 'ic-appointment.png'),
  menu2('02', 'Medical Records', '', 'ic-records.png'),
  menu3('03', 'Doctor', '', 'ic-doctor.png'),
  menu4('04', 'Tele-Dentistry', '', 'ic-tele_dentistry.png'),
  menu5('05', 'Facility', '', 'ic-facility.png'),
  menu6('06', 'Nurse', '', 'ic-nurse.png'),
  menu7('07', 'History', '', 'ic-history.png'),
  menu8('08', 'Setting', '', 'ic-setting.png');

  const AppMenu(this.code, this.name, this.desc, this.image);
  final String code;
  final String name;
  final String desc;
  final String image;
}

class MenuCtrl {
  Ref ref;
  MenuCtrl(this.ref);

  List<AppMenu> getHomeAppMenus() {
    final appMenus = AppMenu.values;

    return appMenus;

    // List<Map<String, Object>> appMenusJson = ref.read(menuServiceProvider).getAppMenus();
    // List<AppMenu> appMenus = appMenusJson.map(AppMenu.fromJson).toList();

    // // NOT SIGNIN
    // // if (ref.read(authUserProvider) == null) {
    // //   final homeMenuList = ["quran", "prayers", "jelajah", "prayerTimes"];
    // //   appMenus.removeWhere((element) => !homeMenuList.contains(element.code));
    // //   return appMenus;
    // // }

    // // AFTER SIGNIN
    // // appMenus = _filterMenuByRole(appMenus);

    // // FILTER WHERE DEFAULT == TRUE
    // appMenus.removeWhere((element) => element.isDefault == false);

    // return appMenus;
  }

  List<AppMenu> getAllAppMenus() {
    List<AppMenu> appMenus = AppMenu.values;
    // final appMenusJson = ref.read(menuServiceProvider).getAppMenus();
    // List<AppMenu> appMenus = appMenusJson.map(AppMenu.fromJson).toList();

    // NOT SIGNIN
    // if (ref.read(authUserProvider) == null) {
    //   final homeMenuList = ["quran", "prayers", "jelajah", "prayerTimes", "exchangeRate", "qibla"];
    //   appMenus.removeWhere((element) => !homeMenuList.contains(element.code));
    //   return appMenus;
    // }

    // AFTER SIGNIN
    // appMenus = _filterMenuByRole(appMenus);

    // FILTER WHERE SHOW == TRUE
    // appMenus.where((element) => element.isShow == true).toList();

    return appMenus;
  }

  List<AppMenu> _filterMenuByRole(List<AppMenu> menus) {
    // Role 1 => Jama'ah
    // if (ref.read(authUserProvider)?.roleId == 1) {
    //   menus.removeWhere((element) => element.code == 'liveLocation');
    //   menus.removeWhere((element) => element.code == 'presenter');
    //   menus.removeWhere((element) => element.code == 'agenda');
    // }
    // Role 2 => Muthowwif
    // if (ref.read(authUserProvider)?.roleId == 2) {
    //   menus.removeWhere((element) => element.code == 'listener');
    // }
    return menus;
  }

  // String getIconPath(String code) {
  //   return switch (code) {
  //     "treatment" => 'assets/icons/menu/ic-treatment.png',
  //     "appointment" => 'assets/icons/menu/ic-appointment.png',
  //     "records" => 'assets/icons/menu/ic-records.png',
  //     "doctor" => 'assets/icons/menu/ic-doctor.png',
  //     "tele_dentistry" => 'assets/icons/menu/ic-tele_dentistry.png',
  //     "facility" => 'assets/icons/menu/ic-facility.png',
  //     "nurse" => 'assets/icons/menu/ic-nurse.png',
  //     "history" => 'assets/icons/menu/ic-history.png',
  //     "setting" => 'assets/icons/menu/ic-setting.png',
  //     String() => '',
  //   };
  // }

  Future goto(String code) async {
    return switch (code) {
      "00" => await ref.read(pageUtilsProvider).goto(page: const TreatmentView()),
      "01" => await ref.read(pageUtilsProvider).goto(page: const TreatmentView()),
      "02" => await ref.read(pageUtilsProvider).goto(page: const MedicalRecordsView()),
      "03" => await ref.read(pageUtilsProvider).goto(page: const DoctorListView()),
      "04" => await ref.read(pageUtilsProvider).goto(page: const TeleDentistryView()),
      "05" => await ref.read(pageUtilsProvider).goto(page: const FacilityView()),
      "06" => await ref.read(pageUtilsProvider).goto(page: const NurseListView()),
      "07" => ref.read(goRouterProvider).go('/history'),
      "08" => await ref.read(pageUtilsProvider).goto(page: const UserSettingView()),
      String() => '',
    };
  }
}

final menuCtrlProvider = Provider(MenuCtrl.new);
