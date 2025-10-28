import 'package:catbot/components/rounded_button.dart';
import 'package:catbot/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget{
  const LoginView({super.key});

  @override
  State<LoginView> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RoundedButton(
                action: ()=>{

                },
                title: 'Login',
               // buttonSize: ,
                iconColors: appColor.primary,
                icon: Icons.arrow_circle_right_rounded
            )
          ],
        ),
      ),
    );
  }

}

