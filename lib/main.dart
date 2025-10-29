
import 'package:catbot/utils/custom_color.dart';
import 'package:catbot/views/chat_view.dart';
import 'package:catbot/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appColor.primary),
        primaryColor: appColor.primary,
      ),
      routes: {
         '/': (context) => const LoginView(),
        '/login':(context) => const ChatView(title: 'CatBot'),
      },
    );
  }
}



