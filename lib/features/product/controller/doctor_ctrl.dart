import 'dart:convert';
import 'dart:developer';

import 'package:dental/features/product/model/doctor.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchDoctorProvider = FutureProvider<List<Doctor>?>((ref) async {
  await Future.delayed(Duration(seconds: 1));
  final response = await rootBundle.loadString('assets/json/doctor.json');
  List<dynamic>? jsonList = await json.decode(response);

  log('fetchDoctorProvider : $jsonList', name: 'DOCTOR-CTRL');
  final result = jsonList?.map((e) => Doctor.fromJson(e)).toList();

  return result;
});

final fetchDoctorReviewProvider = FutureProvider<List<Review>?>((ref) async {
  await Future.delayed(Duration(seconds: 1));
  final response = await rootBundle.loadString('assets/json/doctor_reviews.json');
  List<dynamic>? jsonList = await json.decode(response);

  log('fetchDoctorReviewProvider : $jsonList', name: 'DOCTOR-CTRL');
  final result = jsonList?.map((e) => Review.fromJson(e)).toList();

  return result;
});

