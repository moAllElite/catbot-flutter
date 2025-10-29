
import 'package:flutter/material.dart';

import '../utils/custom_color.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final Color? textColor;
  final Color? backgroundColor;
  final TextEditingController  textController;
  final InputDecoration? inputDecoration;

  const CustomTextFormField({super.key,
    required this.textController,
    required this.title,this.backgroundColor ,
    this.inputDecoration,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        controller: textController,
        decoration:inputDecoration,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor ?? appColor.textPrimary,
          backgroundColor: backgroundColor ??appColor.lightBackground,
        ),
      ),
    );
  }

}