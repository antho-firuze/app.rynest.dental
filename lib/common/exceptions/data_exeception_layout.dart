import 'dart:developer';

import 'package:dental/common/controllers/network_ctrl.dart';
import 'package:dental/core/app_color.dart';
import 'package:dental/utils/ui_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class DataExceptionLayout extends ConsumerWidget {
  const DataExceptionLayout({
    super.key,
    this.title,
    this.child,
    this.subTitle,
    this.onTap,
    this.error,
    this.type,
    this.foregroundColor = oBlack,
  });

  final String? title;
  final String? subTitle;
  final Widget? child;
  final Color foregroundColor;
  final Function()? onTap;
  final Object? error;
  final ExeceptionType? type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errType = type ?? ref.read(exceptionProvider(error));
    log('ERROR : ${errType!.title}', error: error, name: 'EXCEPTION-LAYOUT');
    switch (errType) {
      case ExeceptionType.noInternet:
        if (ref.watch(isConnectedProvider) == true) {
          if (onTap != null) onTap!();
        }

        return ExceptionLayout(
          image: '',
          message: 'Koneksi internet anda terganggu !',
          foregroundColor: foregroundColor,
          reload: 'Reload',
          onTap: onTap,
        );
      case ExeceptionType.dataEmpty:
        return ExceptionLayout(
          image: 'assets/images/data-not-found.png',
          message: 'Data belum tersedia !',
          foregroundColor: foregroundColor,
          reload: 'Reload',
          onTap: onTap,
        );
      case ExeceptionType.timeOut:
      case ExeceptionType.unknown:
      case ExeceptionType.serverFailed:
        return ExceptionLayout(
          image: '',
          message: 'Server sedang sibuk !',
          foregroundColor: foregroundColor,
          reload: 'Reload',
          onTap: onTap,
        );
    }
  }
}

class ExceptionLayout extends StatelessWidget {
  const ExceptionLayout({
    super.key,
    this.image = '',
    this.message = 'Data belum tersedia !',
    this.reload = 'Reload',
    this.foregroundColor = oBlack,
    this.onTap,
  });

  final String image;
  final String message;
  final String reload;
  final Color foregroundColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        children: [
          if (image.isNotEmpty) Image.asset(image, width: context.screenWidthRatio(.5, .3)),
          Text(message).tsTitleM().center().clr(foregroundColor),
          GestureDetector(
            onTap: onTap,
            child: Opacity(
              opacity: .3,
              child: Column(
                children: [
                  Icon(SuperIcons.is_refresh_2_bold, size: 35, color: foregroundColor),
                  Text(reload).size(10).clr(foregroundColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum ExeceptionType {
  unknown('Unknown'),
  noInternet('No Internet'),
  timeOut('Connection Timeout'),
  serverFailed('Server or Host has failed'),
  dataEmpty('Data is empty');

  const ExeceptionType(this.title);
  final String title;
}

final exceptionProvider = Provider.family<ExeceptionType, Object?>((ref, error) {
  if (ref.read(isConnectedProvider) == false) {
    return ExeceptionType.noInternet;
  } else {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ExeceptionType.timeOut;
        case DioExceptionType.badCertificate:
        case DioExceptionType.badResponse:
        case DioExceptionType.cancel:
        case DioExceptionType.connectionError:
          return ExeceptionType.serverFailed;
        case DioExceptionType.unknown:
          return ExeceptionType.unknown;
      }
    } else {
      return ExeceptionType.unknown;
    }
  }
});
