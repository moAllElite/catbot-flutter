//Vérifier l'état d'authentification actuel
import 'dart:async';

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
      switch (e.code) {
        case "provider-already-linked":
          debugPrint("The provider has already been linked to the user.");
          break;
        case "invalid-credential":
          debugPrint("The provider's credential is not valid.");
          break;
        case "credential-already-in-use":
          debugPrint("The account corresponding to the credential already exists, "
              "or is already linked to a Firebase User.");
          break;
      // See the API reference for the full list of error codes.
        default:
          debugPrint("Unknown error.");
      }
    }
    return null;
  }



}