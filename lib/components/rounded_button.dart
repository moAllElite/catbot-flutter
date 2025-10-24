

import 'package:catbot/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget{
  final  Function action;
  final String title;
  final IconData icon;
  final double? buttonSize ;
  final Color? backgroundColor;
  final double? radius;
  final double? iconSize;
  final Color? iconColors;

  const RoundedButton({super.key,
    required this.action,
    required this.title,
    this.buttonSize,
    this.radius,
    this.iconSize,
    this.backgroundColor,
    required this.iconColors,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed:()=> action,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? appColor.primary,
        ),
        maximumSize: WidgetStatePropertyAll((buttonSize ?? 50) as Size?),
        shape:WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(
                radius ?? 32
            )
          ),
        ),
        iconColor: WidgetStatePropertyAll<Color?>(
            (iconColors ?? Colors.black12) as Color?
        ),
        iconSize: WidgetStatePropertyAll(
          iconSize ?? 25
        ) ,
      ),
        label: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style:  Theme.of(context).textTheme.titleMedium,
          ),
        ),
        icon: Icon(
          icon,
          color: iconColors,
          shadows: [
            BoxShadow(
              color:  Colors.black38,
              blurRadius: 1.5,
              blurStyle: BlurStyle.solid,
            )
          ],
        ),
    );
  }

}