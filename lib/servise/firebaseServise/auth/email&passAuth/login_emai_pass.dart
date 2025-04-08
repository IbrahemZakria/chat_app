import 'package:chat_app/component/UserMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginEmaiPass {
  final String email;
  final String password;
  final BuildContext context;
  bool isLoading = false;

  LoginEmaiPass({
    this.isLoading = false,
    required this.email,
    required this.password,
    required this.context,
  }) {
    login();
  }

  Future<void> login() async {
    var auth = FirebaseAuth.instance;
    try {
      isLoading = true;
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        isLoading = false;
        Usermessage.show(
          message: 'login successfully',
          backgroundColor: Colors.green,
          gravity: ToastGravity.BOTTOM,
        );
      });
    } on FirebaseAuthException catch (e) {
      Usermessage.show(
        message: e.message.toString(),
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
      );
    } catch (e) {
      Usermessage.show(
        message: e.toString(),
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
