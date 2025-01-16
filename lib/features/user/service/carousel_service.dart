// ignore_for_file: invalid_annotation_target

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'carousel_service.g.dart';

@JsonLiteral('../repository/carousel.json', asConst: true)
const carouselRepo = _$carouselRepoJsonLiteral;

class CarouselService {
  Ref ref;
  CarouselService(this.ref);

  List<Map<String, dynamic>>? fetchAll() => carouselRepo;
}

final carouselServiceProvider = Provider(CarouselService.new);
