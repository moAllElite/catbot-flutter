import 'dart:core';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService{

  //initialisation  de la connexion
  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }


  // Création d'un compte utilisateur via l'email et le mot de passse
  Future<UserCredential?> createUserWithEmailAndPassword({required String emailAddress,required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }if(e.code == 'invalid-email'){
        debugPrint('The email is not valid');
      }
    } catch (e) {
      debugPrint(e.toString());
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
      if (e.code == 'user-not-found') {
        final message = 'No user found for that email.';
        debugPrint(message);
        return message;
      } else if (e.code == 'wrong-password') {
        final message = 'Wrong password provided for that user.';
        debugPrint(message);
        return message;
      } else {
        final message = 'Authentication error: ${e.code}';
        debugPrint(message);
        return message;
      }
    } catch (e) {
      final message = 'Unexpected error: $e';
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


  //Déconnexion de l'utilisateur
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }




}