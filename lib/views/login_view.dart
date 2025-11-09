import 'package:catbot/components/rounded_button.dart';
import 'package:catbot/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals.dart';

import '../components/custom_text_form_field.dart';
import '../utils/text_field_controllers.dart';

class LoginView extends StatefulWidget{
  const LoginView({super.key});

  @override
  State<LoginView> createState() => LoginViewState();
}

class LoginViewState extends State<LoginView>{
  final Signal<bool> isVisible = signal<bool>(true); // check

  @override
  Widget build(BuildContext context) {
    double height =  MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
              textController:  fieldControllers.userNameController,
              title: 'Username',
              inputDecoration: kInputTextDecoration.copyWith(
                prefixIcon: Icon(Icons.person)
              ),
            ),
            SizedBox(
              height: height / 10,
            ),
                CustomTextFormField(
                textController:  fieldControllers.passwordController,
                title: 'Password',
                inputDecoration: kInputTextDecoration.copyWith(
                  hintText:  'Enter your password',
                  prefixIcon: IconButton(
                      onPressed: ()=> changePasswordVisibility(),
                      icon: Icon(
                          isVisible.value ? Icons.visibility : Icons.visibility_off
                      )
                  )
                ),
              ),
            SizedBox(
              height: height / 10,
            ),
            RoundedButton(
                action:  () => context.go('/chatbot'), //navigate to chatbot view
                title: 'Login',
                icon: Icons.arrow_circle_right_rounded
            )
          ],
        ),
      ),
    );
  }


  bool changePasswordVisibility(){
    return !isVisible.value;
  }
}

