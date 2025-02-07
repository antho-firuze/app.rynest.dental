import 'package:flutter_riverpod/flutter_riverpod.dart';

final teethPrimaryProvider = StateProvider<bool>((ref) => false);
final genderProvider = StateProvider<bool>((ref) => false);
final timeSelectorProvider = StateProvider<int>((ref) => 0);

// final timeIndexSelectedProvider = StateProvider<List<int>>((ref) => [0, 5]);

class ProductCtrl {
  Ref ref;
  ProductCtrl(this.ref);

  // List selectedTimes

  // List<int> practiceHour = [8, 13, 20];

  // List<Map<String, dynamic>> timePicker = [
  //   {"time": 8, "text": "08:00", "desc": "Pagi"},
  //   {"time": 10, "text": "10:00", "desc": "Siang"},
  //   {"time": 13, "text": "01:00", "desc": "Siang"},
  //   {"time": 15, "text": "03:00", "desc": "Sore"},
  //   {"time": 18, "text": "06:00", "desc": "Sore"},
  //   {"time": 20, "text": "08:00", "desc": "Malam"},
  //   {"time": 22, "text": "10:00", "desc": "Malam"},
  //   {"time": 24, "text": "12:00", "desc": "Malam"},
  // ];
}

final productCtrlProvider = Provider(ProductCtrl.new);

// class DayTime {
//   late final int time;
//   late final String text;
//   bool selected = false;

//   DayTime();
// }
