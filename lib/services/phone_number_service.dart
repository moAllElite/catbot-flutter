import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneNumberService{
  FirebaseAuth auth = FirebaseAuth.instance;

  //vérifier si l'utilisateur est connecté via le code de sms et l'id de vérification
  Future<void> verifyCode(String verificationId,String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await auth.signInWithCredential(credential);
    debugPrint("Utilisateur connecté !");
  }

  // envoie le numéro de téléphone
   Future<void> sendVerifySmsCode(String phoneNumber,String smsCode) async {
     await FirebaseAuth.instance.verifyPhoneNumber(
       phoneNumber: phoneNumber, // ex:=>'+44 7123 123 456',
       /**
        * gérez les événements d'échec tels que les numéros de téléphone non valides
        * ou le dépassement du quota de SMS.
        */
       verificationFailed: (FirebaseAuthException e) {
         if (e.code == 'invalid-phone-number') {
           debugPrint('The provided phone number is not valid with code status ${e.code}.');
         }

         // Handle other errors
       },
       /** gestion automatique du code par SMS sur les appareils Android.
        */
       verificationCompleted: (PhoneAuthCredential credential) async{
         if(Platform.isAndroid){
           // ANDROID ONLY!
           // Sign the user in (or link) with the auto-generated credential
           await  auth.signInWithCredential(credential);
         }
       },


       /**permet de gérer l'envoi d'un code à l'appareil depuis Firebase,
       qui permet d'inviter les utilisateurs à saisir le code.*/
       codeSent: (String verificationId, int? resendToken) async {
         // Create a PhoneAuthCredential with the code
         PhoneAuthCredential credential = PhoneAuthProvider
             .credential(verificationId: verificationId, smsCode: smsCode);

         // Sign the user in (or link) with the credential
         await auth.signInWithCredential(credential);
       },
       /**
        * Sur les appareils Android compatibles avec la résolution automatique du code SMS,
        * ce gestionnaire est appelé si l'appareil n'a pas résolu automatiquement un message SMS
        * dans un certain délai. Une fois ce délai écoulé, l'appareil n'essaiera plus de résoudre
        * les messages entrants.
        * Par défaut, l'appareil attend 30 secondes, mais cette valeur peut être personnalisée avec
        * l'argument timeout:
        */
       codeAutoRetrievalTimeout: (String verificationId) {},

     );

   }

}