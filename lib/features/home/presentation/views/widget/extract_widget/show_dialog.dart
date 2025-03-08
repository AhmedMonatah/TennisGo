import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:weather_app/core/utiles/app_color.dart';

void showQuickAlert(BuildContext context, String message) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: '🌟 Training Prediction 🌟',
    text: message,
    confirmBtnText: 'OK',
    confirmBtnColor: Colors.red,
  );
}