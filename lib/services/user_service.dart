//Vérifier l'état d'authentification actuel
import 'dart:async';
import 'package:catbot/exceptions/auth_handler_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserService {

  // Obtenir le statut de la connexion en fonction du profil de l'utilisateur
  Future<String> checkAuthChangeStatus() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      debugPrint('User is currently signed out!');
      return 'User is currently signed out!';
    } else {
      debugPrint('User is signed in!');
      return 'User is signed in!';
    }
  }

// Vérfier l'état d'authentification par l'id du jeton
  Future<String> checkAuthByIdToken(User? user) async {
    String message = '';
    FirebaseAuth.instance
        .idTokenChanges()
        .listen((user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
        message = 'User is currently signed out!';
      } else {
        debugPrint('User is signed in!');
        message = 'User is signed in!';
      }
    });
    return message;
  }

  //Vérifier l'état connecter avec Google
  Future<UserCredential?> checkAuthWithGoogleByIdToken(dynamic idToken) async{
    //Google signin
    OAuthCredential credential = GoogleAuthProvider.credential(idToken: idToken);

    try {
      UserCredential? userCredential = await FirebaseAuth
          .instance.currentUser?.linkWithCredential(credential);
      return userCredential;
    }on FirebaseAuthException catch(e) {
      String message = AuthHandlerException.generateErrorMessage(e);
      debugPrint(message);
      // See the API reference for the full list of error codes.
    }
    return null;
  }



}