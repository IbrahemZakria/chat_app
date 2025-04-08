import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// كومبوننت مخصص لعرض Toast
class Usermessage {
  // دالة ثابتة لعرض التوست مع خيارات قابلة للتخصيص
  static void show({
    required String message, // النص المطلوب عرضه
    Color backgroundColor = Colors.black87, // لون الخلفية الافتراضي
    Color textColor = Colors.white, // لون النص الافتراضي
    ToastGravity gravity = ToastGravity.BOTTOM, // موقع الظهور
    Toast length = Toast.LENGTH_SHORT, // المدة (قصيرة أو طويلة)
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}
