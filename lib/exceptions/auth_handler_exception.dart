import 'package:firebase_auth/firebase_auth.dart';

import '../enums/auth_status.dart';

/// Service utilitaire permettant de gérer les exceptions Firebase liées à l’authentification.
///
/// Cette classe a pour objectif de :
/// - Traduire les [FirebaseAuthException] en un type interne [AuthStatus],
///   plus facilement exploitable par la logique métier de l’application.
/// - Fournir des messages d’erreur clairs et localisés, destinés à l’affichage utilisateur.

class AuthHandlerException{
  ///on vérifie la correspondance du type d'exception
  ///Convertit une [FirebaseAuthException] en un [AuthStatus] interne.x
  static handleAuthException(FirebaseAuthException e){
    AuthStatus status;
    switch(e.code){
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthStatus.weakPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      case "user-not-found":
        status = AuthStatus.userNotFound;
      case "provider-already-linked":
        status = AuthStatus.providerAlreadyLinked;
        break;
      case "invalid-credential":
        status = AuthStatus.invalidCredential;
        break;
      case "credential-already-in-use":
        status = AuthStatus.credentialAlreadyInUse;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }

  /// on renvoie un message d'error en fonction du type d'erreur retournée
  /// Convertit une [FirebaseAuthException] en un [AuthStatus] interne.
  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.invalidEmail:
        errorMessage = "Erreur de format de votre email .";
        break;
      case AuthStatus.weakPassword:
        errorMessage = 'Le mot de passe doit être au moins  de 6 charactères.';
        break;
      case AuthStatus.wrongPassword:
        errorMessage = 'Le Mot de passe saisi est incorrect.';
        break;
      case AuthStatus.emailAlreadyExists:
        errorMessage = 'L\'utilisateur avec l\'email saisi est déjà attribué à un utilisateur.';
        break;
      case AuthStatus.userNotFound:
        errorMessage = 'L\'utilisateur avec l\'email fourni est introuvable ';
        break;
      case AuthStatus.providerAlreadyLinked:
        errorMessage = "Le fournisseur a déjà été associé à l'utilisateur..";
      case AuthStatus.invalidCredential:
        errorMessage ="L'identifiant du fournisseur n'est pas valide.";
      case AuthStatus.credentialAlreadyInUse:
        errorMessage="Le compte correspondant à ces informations d'identification existe déjà ou est déjà lié à un utilisateur Firebase..";
      default:
        errorMessage = "Une erreur est survenue. Merci d'essayer plus tard!.";
    }
    return errorMessage;
  }

}