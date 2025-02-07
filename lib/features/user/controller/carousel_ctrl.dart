import 'dart:convert';
import 'dart:developer';

import 'package:dental/features/user/model/carousel.dart';
import 'package:dental/utils/custom_carousel_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeCarouselController = CustomCarouselController();

// GET FROM LOCAL REPOSITORY
final fetchCarouselProvider = FutureProvider.autoDispose<List<Carousel>?>((ref) async {
  // List<Map<String, dynamic>>? jsonList = ref.read(carouselServiceProvider).fetchAll();
  // if (jsonList == null || jsonList.isEmpty) return [];
  final String response = await rootBundle.loadString('assets/json/carousel.json');
  List<dynamic>? jsonList = await json.decode(response);

  log('$jsonList', name: 'CAROUSEL-CTRL');

  final result = jsonList?.map((e) => Carousel.fromJson(e)).toList();
  // final result = jsonList?.map(Carousel.fromJson).toList();
  log('fetchCarouselProvider | $result', name: 'carousel_controller');

  return result;
});

// GET FROM API
// final fetchCarouselProvider = FutureProvider.autoDispose<List<Carousel>>((ref) async {
//   final reqs = Reqs(path: '/api/v1/carousel/all');
//   final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

//   if (state.hasError) return [];

//   List<Map<String, dynamic>>? jsonList = state.value;
//   if (jsonList == null || jsonList.isEmpty) return [];

//   final result = jsonList.map(Carousel.fromJson).toList();
//   log('fetchCarouselProvider | $result', name: 'carousel_controller');

//   return result;
// });
