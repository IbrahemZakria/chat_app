import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String timestamp;
  final String userEmail;

  MessageModel(
      {required this.message,
      required this.timestamp,
      required this.userEmail});

  factory MessageModel.fromJson(Map<String, dynamic> jsonData) {
    return MessageModel(
      userEmail: jsonData['userId'],
      message: jsonData['message'] ?? '',
      timestamp: jsonData['timestamp'] != null
          ? (jsonData['timestamp'] as Timestamp).toDate().toString()
          : '', // تحويل Timestamp إلى String
    );
  }
}
