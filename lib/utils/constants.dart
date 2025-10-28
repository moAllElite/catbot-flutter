import 'package:flutter/material.dart';

class AppColor {
   // Palette principale
   Color primary = Color(0xFF2D1E70); // violet profond
   Color secondary = Color(0xFFF72585); // orange vif
   Color accent = Color(0xFF00C2A8); // turquoise

   // Palette de soutien
   Color lightBackground = Color(0xFFF9F9FB); // fond clair
   Color darkBackground = Color(0xFF121212); // fond sombre
   Color textPrimary = Color(0xFF1E1E1E); // texte principal
   Color textSecondary = Color(0xFF6E6E73); // texte secondaire

   // Couleurs de feedback
   Color success = Color(0xFF00B86B); // vert succès
   Color warning = Color(0xFFFFD166); // jaune attention
   Color error = Color(0xFFE63946); // rouge erreur

}
AppColor appColor = AppColor();