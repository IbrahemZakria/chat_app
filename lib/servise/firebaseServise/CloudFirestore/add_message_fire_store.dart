import 'package:chat_app/component/UserMessage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddMessageFireStore {
  static Future<void> addMessageToFireStore({
    required String message,
    required String colectionName,
  }) async {
    try {
      await FirebaseFirestore.instance.collection(colectionName).add({
        'message': message,
        'timestamp': FieldValue.serverTimestamp(),
        'userId': FirebaseAuth.instance.currentUser?.email, // إضافة userId
      });
    } catch (e) {
      Usermessage.show(
          message: e.toString(),
          backgroundColor: Colors.red,
          gravity: ToastGravity.BOTTOM);
    }
  }
}
