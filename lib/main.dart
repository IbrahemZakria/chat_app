import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/authScreens/login_screen.dart';
import 'package:chat_app/screens/authScreens/regester_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/testfunction.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegesterScreen.id: (context) => RegesterScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        Testfunction.id: (context) => Testfunction(),
      },
      title: 'Flutter Demo',
      initialRoute: ChatScreen.id,
    );
  }
}
