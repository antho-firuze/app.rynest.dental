import 'dart:convert';
import 'dart:developer';

import 'package:dental/features/tele-dentistry/model/chat.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchChatMessageProvider = FutureProvider<List<Chat>?>((ref) async {
  await Future.delayed(Duration(seconds: 1));
  final response = await rootBundle.loadString('assets/json/chat.json');
  List<dynamic>? jsonList = await json.decode(response);

  log('fetchChatMessageProvider : $jsonList', name: 'TELE_DENTISTRY-CTRL');
  final result = jsonList?.map((e) => Chat.fromJson(e)).toList();

  return result;
});