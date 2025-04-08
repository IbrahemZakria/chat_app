import 'package:chat_app/Constant.dart';
import 'package:chat_app/component/custome_button.dart';
import 'package:chat_app/component/custome_text_form_field.dart';
import 'package:chat_app/servise/firebaseServise/auth/email&passAuth/regesteration_firebase_pass.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegesterScreen extends StatelessWidget {
  RegesterScreen({super.key});
  static String id = 'sdddddddddddddd';
  String? email;
  String? password;
  RegesterationFirebasePass? firebasePassRegesteration;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Image.asset("assets/images/scholar.png"),
                  Text(
                    'scholar chat',
                    style: TextStyle(
                      fontFamily: 'Pacifico-Regular',
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Row(
                    children: [
                      Text(
                        "register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  CustomeTextFormField.CustomeTextformField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                          .hasMatch(value)) {
                        return 'please enter a valid email';
                      }
                      return null;
                    },
                    hintText: 'Email',
                    onSaved: (value) {
                      email = value;
                    },
                  ),
                  CustomeTextFormField.CustomeTextformField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your password';
                      } else if (value.length < 6) {
                        return 'password must be at least 6 characters';
                      }
                      return null;
                    },
                    obscureText: true,
                    hintText: 'Password',
                    onSaved: (value) {
                      password = value;
                    },
                  ),
                  CustomeButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        firebasePassRegesteration = RegesterationFirebasePass(
                          email: email!,
                          password: password!,
                          context: context,
                        );
                      }
                    },
                    textbutton: 'register',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("alredy have an account",
                          style: TextStyle(color: Colors.white)),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Login",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 99, 95, 95)))),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
