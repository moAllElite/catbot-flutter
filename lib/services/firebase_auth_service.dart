import 'dart:core';
import 'package:catbot/exceptions/auth_handler_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class FirebaseAuthService{




  // Création d'un compte utilisateur via l'email et le mot de passse
  Future<UserCredential?> createUserWithEmailAndPassword({required String emailAddress,required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      String message = AuthHandlerException.generateErrorMessage(e);
      debugPrint(message);
    }
    return null;
  }


  //connexion via l'email et le mot de passe  @param email & @param password
  Future<String> loginWithEmailAndPassword({required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      final message = 'User signed in: ${credential.user?.email}';
      debugPrint(message);
      return message;
    } on FirebaseAuthException catch (e) {
      String message = AuthHandlerException.generateErrorMessage(e);
      debugPrint(message);
      return message;
    }
  }


  // se connecter avec Google
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //

  //Déconnexion de l'utilisateur
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }




}