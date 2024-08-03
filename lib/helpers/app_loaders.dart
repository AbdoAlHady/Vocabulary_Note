

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoaders {

  static void showToastError(
      {required BuildContext context, required String message, int? second}) {
    DelightToastBar(
      autoDismiss: true,
      position: DelightSnackbarPosition.bottom,
      snackbarDuration: Duration(seconds: second ?? 3),
      builder: (context) {
        return ToastCard(
          title: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: const Icon(
            Icons.error,
            color: Colors.white,
            size: 32,
          ),
          color: Colors.red,
        );
      },
    ).show(context);
  }

  static void showToastSuccess(
      {required BuildContext context, required String message, int? second}) {
    DelightToastBar(
      autoDismiss: true,
      position: DelightSnackbarPosition.bottom,
      snackbarDuration: Duration(seconds: second ?? 3),
      builder: (context) {
        return ToastCard(
          title: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: const Icon(
            Icons.done,
            color: Colors.white,
            size: 32,
          ),
          color: Colors.green,
        );
      },
    ).show(context);
  }
  
}