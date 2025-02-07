import 'dart:convert';
import 'dart:developer';

import 'package:dental/features/product/model/facility.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchFacilityProvider = FutureProvider<List<Facility>?>((ref) async {
  await Future.delayed(Duration(seconds: 1));
  final response = await rootBundle.loadString('assets/json/facility.json');
  List<dynamic>? jsonList = await json.decode(response);

  log('fetchDoctorProvider : ${jsonList?.length}', name: 'FACILITY-CTRL');
  final result = jsonList?.map((e) => Facility.fromJson(e)).toList();

  return result;
});
