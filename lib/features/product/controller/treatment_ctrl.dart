import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TreatmentType {
  bleaching('Bleaching'),
  scaling('Scaling'),
  veneer('Veneer'),
  filling('Filling'),
  rct('Root Canal Treatment'),
  braces('Kawat Gigi'),
  cnb('Dental Crown dan Bridges'),
  jewelry('Dental Jewelry');

  const TreatmentType(this.name);
  final String name;
}

final treatmentTypeProvider = StateProvider<TreatmentType?>((ref) => null);
final doctorNameProvider = StateProvider<String>((ref) => '');