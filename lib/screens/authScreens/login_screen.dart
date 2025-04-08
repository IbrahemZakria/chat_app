import 'package:chat_app/Constant.dart';
import 'package:chat_app/component/custome_button.dart';
import 'package:chat_app/component/custome_text_form_field.dart';
import 'package:chat_app/screens/authScreens/regester_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/servise/firebaseServise/auth/email&passAuth/login_emai_pass.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static String id = 'dfgerfgwfgwfc';
  String? email;
  String? password;
  LoginEmaiPass? loginEmaiPass;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
      progressIndicator: const CircularProgressIndicator(
        color: Colors.white,
      ),
      child: Scaffold(
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
                          "Login",
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
                          return 'please enter a valid email address';
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
                          return 'password must be at least 6 characters long';
                        }
                        return null;
                      },
                      hintText: 'Password',
                      obscureText: true,
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                    CustomeButton(
                        textbutton: 'Login',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            loginEmaiPass = LoginEmaiPass(
                                isLoading: isLoading,
                                email: email!,
                                password: password!,
                                context: context);
                            Navigator.pushNamed(context, ChatScreen.id,
                                arguments: email!);
                          }
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("don't have an account? ",
                            style: TextStyle(color: Colors.white)),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RegesterScreen.id);
                            },
                            child: Text("register",
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 99, 95, 95)))),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
