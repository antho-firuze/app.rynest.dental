import 'dart:io';

import 'package:dental/common/models/reqs.dart';
import 'package:dental/core/app_base.dart';
import 'package:dental/features/auth/controller/auth_ctrl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dental/utils/dio_service.dart';

class AuthService {
  final Ref ref;
  AuthService(this.ref);

  Future refreshToken({required Reqs reqs}) async {
    final url =
        Uri.parse(reqs.url ?? AppBase.url).replace(path: reqs.path, queryParameters: reqs.queryParameters).toString();

    final options = Options(
      headers: {HttpHeaders.authorizationHeader: "Bearer ${ref.read(authTokenProvider)?.refreshToken}"},
    );
    final state = await AsyncValue.guard(() async => await ref.read(dioProvider).post(url, options: options));

    return state.value?.data;
  }
}

final authServiceProvider = Provider(AuthService.new);
