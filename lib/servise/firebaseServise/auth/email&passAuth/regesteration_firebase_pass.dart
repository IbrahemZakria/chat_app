import 'package:chat_app/component/UserMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegesterationFirebasePass {
  final String email;
  final String password;
  final BuildContext context;

  RegesterationFirebasePass({
    required this.email,
    required this.password,
    required this.context,
  }) {
    register();
  }

  Future<void> register() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Usermessage.show(
          message: 'User registered successfully',
          backgroundColor: Colors.green,
          gravity: ToastGravity.BOTTOM,
        );
        Navigator.pop(context);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Usermessage.show(
          message: 'The password provided is too weak.',
          backgroundColor: Colors.red,
          gravity: ToastGravity.BOTTOM,
        );
      } else if (e.code == 'email-already-in-use') {
        Usermessage.show(
          message: 'The account already exists for that email.',
          backgroundColor: Colors.red,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      Usermessage.show(
        message: e.toString(),
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
