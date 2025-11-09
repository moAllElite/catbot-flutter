
import 'package:catbot/utils/custom_color.dart';
import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget{
  final  Function action;
  final String title;
  final IconData icon;
  final Color? backgroundColor;
  final double? radius;

  const RoundedButton({
    super.key,
    required this.action,
    required this.title,
    this.radius,
    this.backgroundColor,
    required this.icon
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: (){
            action();
          },
          color: backgroundColor ?? appColor.primary,
          elevation: 5.0,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
              title,
              style:const TextStyle(
                  color:Colors.white
              )
          ),
      ),
      )
    );
  }

}