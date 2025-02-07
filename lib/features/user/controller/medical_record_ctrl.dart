import 'dart:convert';
import 'dart:developer';

import 'package:dental/features/product/model/medical_record.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchMedicalRecordsProvider = FutureProvider<List<MedicalRecord>?>((ref) async {
  await Future.delayed(Duration(seconds: 1));
  final response = await rootBundle.loadString('assets/json/medical_record.json');
  List<dynamic>? jsonList = await json.decode(response);

  log('fetchMedicalRecordsProvider : $jsonList', name: 'MEDICAL_RECORD-CTRL');
  final result = jsonList?.map((e) => MedicalRecord.fromJson(e)).toList();

  return result;
});
