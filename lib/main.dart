
import 'dart:io';
import 'package:catbot/routes/app.route.dart';
import 'package:catbot/utils/custom_color.dart';
import 'package:catbot/utils/secrets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

///initialisation  de la connexion firebase
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

    //on vérifie avant d'initialiser
    if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          demoProjectId: projectId,
          options: const FirebaseOptions(
            apiKey: firebaseApiKey,
            appId: appId,
            projectId: projectId,
            messagingSenderId: messagingSenderId,
          ),
        );
      } else {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }

    // un emulateur en dev uniquement
    if(Platform.isAndroid){

      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    }

    runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
    @override
    Widget build(BuildContext context) {
      return MaterialApp.router(routerConfig: appRouter); //injection du routing
    }

  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appColor.primary),
        primaryColor: appColor.primary,
      ),
    );
  }




